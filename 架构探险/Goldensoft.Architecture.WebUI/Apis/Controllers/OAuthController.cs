using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Goldensoft.WX.Backstage.Service.Services;
using Goldensoft.WX.Backstage.Service.Services.Responses;
using Mercurius.Prime.Boot.Jwt;
using Mercurius.Prime.Core;
using Mercurius.Prime.Core.Configuration;
using Mercurius.Prime.Core.Entity;
using Mercurius.Prime.Data.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;

namespace Goldensoft.WX.WebApp.Apis.Controllers
{
    /// <summary>
    /// 接口认证控制器
    /// </summary>
    [ApiController]
    [AllowAnonymous]
    [Route("api/oauth")]
    public class OAuthController : ControllerBase
    {
        #region Properties

        /// <summary>
        /// web api身份认证服务
        /// </summary>
        public WebApiIdentityService WebApiIdentityService { get; set; }

        #endregion

        /// <summary>
        /// 获取token
        /// </summary>
        /// <param name="identity">token认证信息</param>
        /// <returns>token信息</returns>
        [HttpPost]
        [Route("token")]
        public IActionResult Token(AccessIdentity identity)
        {
            var user = Authenticate(identity);

            if (user != null)
            {
                var token = BuildToken(user);

                return this.Ok(token);
            }

            return Unauthorized();
        }

        /// <summary>
        /// 刷新token信息
        /// </summary>
        /// <param name="refreshToken">refresh token值</param>
        /// <returns>token信息</returns>
        [HttpGet]
        [Route("token/refresh/{refreshToken}")]
        public IActionResult RefreshToken(string refreshToken)
        {
            var user = Authenticate(refreshToken);

            if (user != null)
            {
                return this.Ok(BuildToken(user));
            }

            return Unauthorized();
        }

        #region Private Methods

        /// <summary>
        /// 根据refresh token获取用户信息
        /// </summary>
        /// <param name="refreshToken">用户信息</param>
        /// <returns>用户信息</returns>
        private WebApiIdentityResponse Authenticate(string refreshToken)
        {
            return this.WebApiIdentityService.Authenticate(refreshToken).Data;
        }

        /// <summary>
        /// 根据token认证信息获取用户信息
        /// </summary>
        /// <param name="identity">接口访问账号信息</param>
        /// <returns>用户信息</returns>
        private WebApiIdentityResponse Authenticate(AccessIdentity identity)
        {
            return this.WebApiIdentityService.Authenticate(identity.Account, identity.Password).Data;
        }

        /// <summary>
        /// 生成token
        /// </summary>
        /// <param name="identity"></param>
        /// <returns></returns>
        private Token BuildToken(WebApiIdentityResponse identity)
        {
            var claims = new[] {
                new Claim(JwtRegisteredClaimNames.Sub, identity.Account),
                new Claim(JwtRegisteredClaimNames.NameId, identity.Id),
                new Claim(JwtRegisteredClaimNames.Aud, identity.Platform)
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(PlatformConfig.Instance.OAuth?.IssuerKey));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var now = DateTime.Now;
            var expires = now.AddMinutes(PlatformConfig.Instance.OAuth.TokenExpire);

            var token = new JwtSecurityToken(
              PlatformConfig.Instance.OAuth.Issuer,
              PlatformConfig.Instance.OAuth.Audience,
              claims,
              notBefore: now,
              expires: expires,
              signingCredentials: creds
            );

            // 更新刷新token
            var resRefreshToken = this.WebApiIdentityService.UpdateRefreshToken(identity.Id, identity.RefreshTokenExpiresDateTime);

            return new Token
            {
                TokenType = "Bearer",
                AccessToken = new JwtSecurityTokenHandler().WriteToken(token),
                RefreshToken = resRefreshToken.Data.IsNullOrEmptyValue(identity.RefreshToken),
                ExpiresIn = expires.ToTimeStamp(),
            };
        }

        #endregion
    }
}