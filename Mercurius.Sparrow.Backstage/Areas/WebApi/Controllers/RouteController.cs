using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web.Mvc;
using Mercurius.Infrastructure;
using Mercurius.Sparrow.Contracts;
using Mercurius.Sparrow.Contracts.Core;
using Mercurius.Sparrow.Contracts.WebApi;
using Mercurius.Sparrow.Entities.Core;
using Mercurius.Sparrow.Entities.Swagger;
using Mercurius.Sparrow.Entities.WebApi;
using Mercurius.Sparrow.Entities.WebApi.SO;
using Newtonsoft.Json;

namespace Mercurius.Sparrow.Backstage.Areas.WebApi.Controllers
{
    /// <summary>
    /// Web Api 路由管理
    /// </summary>
    public class RouteController : BaseController
    {
        #region 常量

        private const string WebApiDocumentUrlSettingName = "WebApiDocumentUrl";

        #endregion

        #region 属性

        /// <summary>
        /// WebApi服务对象。
        /// </summary>
        public IApiService ApiService { get; set; }

        /// <summary>
        /// 系统参数设置服务对象。
        /// </summary>
        public ISystemSettingService SystemSettingService { get; set; }

        #endregion

        /// <summary>
        /// 路由规则列表。
        /// </summary>
        /// <param name="so">WebApi查询对象</param>
        /// <returns></returns>
        [AllowAnonymous]
        public ActionResult Index(ApiSO so)
        {
            var routes = this.ApiService.SearchApis(so);

            this.ViewBag.WebApiUrl = this.SystemSettingService.GetSetting(WebApiDocumentUrlSettingName).Data;

            return View(routes);
        }

        /// <summary>
        /// 新增或修改路由规则
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult CreateOrUpdate(int? id)
        {
            if (id.HasValue)
            {
                var api = ApiService.GetApiById(id.Value);
                return View(api.Data);
            }

            return View();
        }

        /// <summary>
        /// 新增或修改路由规则
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult CreateOrUpdate(Api model)
        {
            if (model.Id > 0)
            {
                var api = ApiService.GetApiById(model.Id);

                if (!api.IsSuccess || api.Data == null)
                {
                    return this.Alert("获取详细失败，失败详情：" + api.ErrorMessage);
                }

                var updateResult = ApiService.CreateOrUpdate(api.Data.ToNewApi(model));

                return updateResult.IsSuccess ? this.CloseDialogWithAlert("保存成功！") : this.Alert("保存失败，失败详情：" + updateResult.ErrorMessage);
            }

            // 添加新路由规则
            var createResult = ApiService.CreateOrUpdate(model);

            return createResult.IsSuccess ? this.CloseDialogWithAlert("保存成功！") : this.Alert("保存失败，失败详情：" + createResult.ErrorMessage);
        }

        /// <summary>
        /// 删除一条路由规则
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpPost]
        public ActionResult Delete(int id)
        {
            var result = ApiService.Remove(id);

            return Json(result);
        }

        /// <summary>
        /// 刷新Web Api路由规则列表
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ActionResult ReflushRoutes(string id)
        {
            if (string.IsNullOrEmpty(id))
            {
                return Json(new Response { ErrorMessage = "没有输入Web Api文档地址路径！" });
            }

            var strRoute = string.Empty;

            using (var client = new HttpClient())
            {
                var request = new HttpRequestMessage(HttpMethod.Get, id);

                request.Headers.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

                strRoute = client.SendAsync(request).Result.Content.ReadAsStringAsync().Result;
            }

            // 反序列得到的路由规则数据
            var model = JsonConvert.DeserializeObject<SwaggerDocument>(strRoute);
            var routes = model.paths.Select(item => new Api { CreateUserId = WebHelper.GetLogOnUserId(), Route = item.Key, Item = item.Value });

            // 清空路由信息表
            this.ApiService.Truncate();

            // 添加新的路由信息
            var rsp = this.ApiService.Adds(routes.ToArray());

            return Json(new Response { ErrorMessage = rsp.ErrorMessage });
        }

        [HttpPost]
        public ActionResult SaveWebApiDocumentUrl(string url)
        {
            var rsp = this.SystemSettingService.SaveSetting(new SystemSetting
            {
                Name = WebApiDocumentUrlSettingName,
                Value = url
            });

            return Alert(rsp.IsSuccess ? "设置成功！" : $"设置失败，失败原因：{rsp.ErrorMessage}", rsp.IsSuccess ? AlertType.Info : AlertType.Error);
        }
    }
}