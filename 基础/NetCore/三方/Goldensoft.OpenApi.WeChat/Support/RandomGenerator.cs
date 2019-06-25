using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;

namespace Goldensoft.OpenApi.WeChat
{
    /// <summary>
    /// 随机码生成器
    /// </summary>
    public class RandomGenerator
    {
        #region Fields

        private readonly RNGCryptoServiceProvider csp;

        #endregion

        #region Constructor

        /// <summary>
        /// 默认构造方法
        /// </summary>
        public RandomGenerator()
        {
            csp = new RNGCryptoServiceProvider();
        }

        #endregion

        #region Public Methods

        /// <summary>
        /// 获取随机无符号整型数字
        /// </summary>
        /// <returns>无符号整型数字</returns>
        public uint GetRandomUInt()
        {
            var randomBytes = GenerateRandomBytes(sizeof(uint));

            return BitConverter.ToUInt32(randomBytes, 0);
        }

        /// <summary>
        /// 生成下一个随机数
        /// </summary>
        /// <param name="minValue">最小值</param>
        /// <param name="maxExclusiveValue">最大值</param>
        /// <returns>随机数</returns>
        public int Next(int minValue, int maxExclusiveValue)
        {
            if (minValue >= maxExclusiveValue)
            {
                throw new ArgumentOutOfRangeException("minValue must be lower than maxExclusiveValue");
            }
            
            var diff = (long)maxExclusiveValue - minValue;
            var upperBound = uint.MaxValue / diff * diff;

            uint ui;

            do
            {
                ui = GetRandomUInt();
            } while (ui >= upperBound);

            return (int)(minValue + (ui % diff));
        }

        #endregion

        #region Private Methods

        /// <summary>
        /// 生成随机字节码
        /// </summary>
        /// <param name="bytesNumber">字节码数量</param>
        /// <returns>字节码</returns>
        private byte[] GenerateRandomBytes(int bytesNumber)
        {
            var buffer = new byte[bytesNumber];

            csp.GetBytes(buffer);

            return buffer;
        }

        #endregion
    }
}
