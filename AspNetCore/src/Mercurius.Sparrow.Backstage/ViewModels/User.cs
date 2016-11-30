using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Mercurius.Sparrow.Backstage.ViewModels
{
    public class User
    {
        #region 属性

        [Display(Name="姓名")]
        public string Name { get; set; }

        public string Sex { get; set; }

        public DateTime Birthdate { get; set; }

        #endregion
    }
}
