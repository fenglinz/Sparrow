using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Mercurius.Prime.Core.Entity;

namespace Goldensoft.Architecture.WebUI.Models
{
    [Table("mfStaff")]
    public class MfStaff
    {
        [Column("StaffID")]
        public string Id { get; set; }

        [Column("Name")]
        public string Name { get; set; }

        [Column("LogonUser")]
        public string Account { get; set; }
    }
}
