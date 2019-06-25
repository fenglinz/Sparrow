using System;
using System.Collections.Generic;
using Consul;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;

namespace Mercurius.Prime.Boot.MicroServices
{
    /// <summary>
    /// consul集成扩展
    /// </summary>
    public static class ConsulIntegrateExtension
    {
        public static void RegisterToConsul(this IApplicationBuilder app, IConfiguration configuration, IApplicationLifetime lifetime)
        {
            lifetime.ApplicationStarted.Register(() =>
            {
                var serviceName = configuration.GetValue<string>("MicroServices:ServiceName");
                var serviceIP = configuration.GetValue<string>("MicroServices:ServiceIp");
                var servicePort = configuration.GetValue<int>("MicroServices:ServicePort");
                var consulClientUrl = configuration.GetValue<string>("MicroServices:Consul:ConsulUrl");
                var healthCheckRelativeUrl = configuration.GetValue<string>("MicroServices:Consul:HealthUrl");
                var healthCheckIntervalInSecond = configuration.GetValue<int>("MicroServices:Consul:Heartbeat");

                if (string.IsNullOrWhiteSpace(serviceName))
                {
                    throw new Exception("Please use --serviceName=yourServiceName to set serviceName");
                }

                if (string.IsNullOrEmpty(consulClientUrl))
                {
                    consulClientUrl = "http://192.168.99.100:8500";
                }

                if (string.IsNullOrWhiteSpace(healthCheckRelativeUrl))
                {
                    healthCheckRelativeUrl = "Health";
                }

                healthCheckRelativeUrl = healthCheckRelativeUrl.TrimStart('/');

                if (healthCheckIntervalInSecond <= 0)
                {
                    healthCheckIntervalInSecond = 1;
                }

                var consulClient = new ConsulClient(ConsulClientConfiguration => ConsulClientConfiguration.Address = new Uri(consulClientUrl));

                var httpCheck = new AgentServiceCheck()
                {
                    DeregisterCriticalServiceAfter = TimeSpan.FromSeconds(10),//服务启动多久后注册
                    Interval = TimeSpan.FromSeconds(healthCheckIntervalInSecond),
                    HTTP = $"http://{serviceIP}:{servicePort}/{healthCheckRelativeUrl}",
                    Timeout = TimeSpan.FromSeconds(2)
                };

                // 生成注册请求
                var registration = new AgentServiceRegistration()
                {
                    Checks = new[] { httpCheck },
                    ID = Guid.NewGuid().ToString(),
                    Name = serviceName,
                    Address = serviceIP,
                    Port = servicePort,
                    Meta = new Dictionary<string, string>() { ["Protocol"] = "http" },
                    Tags = new[] { "http" }
                };
                consulClient.Agent.ServiceRegister(registration).Wait();

                //服务停止时, 主动发出注销
                lifetime.ApplicationStopping.Register(() =>
                {
                    try
                    {
                        consulClient.Agent.ServiceDeregister(registration.ID).Wait();
                    }
                    catch
                    { }
                });
            });
        }
    }
}
