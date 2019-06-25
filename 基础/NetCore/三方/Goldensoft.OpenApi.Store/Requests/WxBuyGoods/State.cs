using System;
using System.Collections.Generic;
using System.Text;

namespace Goldensoft.OpenApi.Store.Requests.WxBuyGoods
{
    /// <summary>
    /// 订单类型枚举
    /// </summary>
    public enum State
    {
        Unchanged,

        Added,

        AddingCheck,

        Modified,

        ModifyingCheck,

        Deleted,

        DeletingCheck
    }
}
