using System;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using Mercurius.Prime.Boot.Autofac;
using Mercurius.Prime.Core.Entity;
using Mercurius.Prime.Data.Dapper;
using Mercurius.Prime.Data.Service;

namespace Mercurius.Architecture.ExploreApp
{
    class Program
    {
        static void Main(string[] args)
        {
            //var platform = PlatformSection.Instance;

            //Console.WriteLine(platform);

            QueryDemo();

            // ExpressionDemo();

            Console.ReadKey();
        }

        static void QueryDemo()
        {
          //  ContainerManager.IsOnWebEnvironment = false;

            using (var scop = ContainerManager.LifetimeScope)
            {
                var persistence = scop.GetObject<Persistence>();

                var param = new
                {
                    Guid = "616bff6b8c9d4171ae29e239c3b42056",
                    GoodsName = $"牛奶{DateTime.Now.ToString("yyyyMMddHHmmss")}"
                };

                persistence.Update<OrderBarCode>(param, c => c.Where().Equal(p => p.Guid));

                var so = new { State = "Y", GoodsName = "牛" };

                var barCodes = persistence.QueryForList<OrderBarCode>(new string[] {
                    "Guid",
                    "GoodsName"
                }, so,
                    c => c.Where()
                          .Complexes(g => g.Equal(p => p.State, () => so.State == "N").OrLike(p => p.GoodsName))
                          .NotNull(p => p.PrintCount)
                          .OrderBy(p => p.GoodsName)
                    );

                foreach (var item in barCodes)
                {
                    Console.WriteLine($"{item.Guid}\t{item.GoodsName}");
                }
            }
        }

        static void ExpressionDemo()
        {
            Expression<Func<OrderBarCode, string>> expression = a1 => a1.Guid;

            var body = expression.Body as MemberExpression;
            var columnAttribute = body.Member.GetCustomAttribute<ColumnAttribute>();

            Console.WriteLine(expression.Parameters[0].Name + "." + body.Member.Name + " " + columnAttribute.Name);
        }
    }
}
