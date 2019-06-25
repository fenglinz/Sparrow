namespace Goldensoft.OpenApi.WeChat.Responses
{
    /// <summary>
    /// 支付响应数据基类
    /// </summary>
    public abstract class PayResponseBase : ModelBase
    {
        #region Properties

        /// <summary>
        /// 返回状态码(SUCCESS/FAIL,此字段是通信标识，非交易标识，交易是否成功需要查看ResultCode来判断)
        /// </summary>
        public string ReturnCode { get => base["return_code"]; set => base["return_code"] = value; }

        /// <summary>
        /// 返回信息(当ReturnCode为FAIL时返回信息为错误原因)
        /// </summary>
        public string ReturnMessage { get => base["return_msg"]; set => base["return_msg"] = value; }

        /// <summary>
        /// 调用接口提交的公众账号ID
        /// </summary>
        public string AppId { get => base["appid"]; set => base["appid"] = value; }

        /// <summary>
        /// 调用接口提交的商户号
        /// </summary>
        public string MerchantId { get => base["mch_id"]; set => base["mch_id"] = value; }

        /// <summary>
        /// 微信返回的随机字符串
        /// </summary>
        public string NonceString { get => base["nonce_str"]; set => base["nonce_str"] = value; }

        /// <summary>
        /// 微信返回的签名值
        /// </summary>
        public string Sign { get => base["sign"]; set => base["sign"] = value; }

        /// <summary>
        /// 业务结果(SUCCESS/FAIL)
        /// </summary>
        public string ResultCode { get => base["result_code"]; set => base["result_code"] = value; }

        /// <summary>
        /// 错误代码
        /// </summary>
        public string ErrorCode { get => base["err_code"]; set => base["err_code"] = value; }

        /// <summary>
        /// 错误代码描述
        /// </summary>
        public string ErrorCodeDescription { get => base["err_code_des"]; set => base["err_code_des"] = value; }

        #endregion
    }
}
