using System;
using System.Linq;
using Autofac;
using Project.Data;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Mvc.ApplicationModels;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.OpenApi.Models;

using Project.Data.Context;
using Project.Data.MakeConnection;
using Project.Data.Repository;
using Project.Data.UnitOfWork;
using Project.Service.Service;
using WebApplication6.Helpers;
using WebApplication6.Mapper;

namespace WebApplication6
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }
        public static readonly string MyAllowSpecificOrigins = "_myAllowSpecificOrigins";

        // This method gets called by the runtime. Use this method to add services to the container.
#pragma warning disable CA1041 // Provide ObsoleteAttribute message

        [Obsolete]
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddAutoMapper(typeof(AutoMapperProfile).Assembly);
            services.AddCors(options =>
            {
                options.AddPolicy(MyAllowSpecificOrigins,
                    builder =>
                    {
                        builder
                        //.WithOrigins(GetDomain())
                        .AllowAnyOrigin()
                        .AllowAnyHeader()
                        .AllowAnyMethod();
                    });
            });
            services.AddControllersWithViews();
            services.AddControllers(options =>
            {
                options.Conventions.Add(new RouteTokenTransformerConvention(new SlugifyParameterTransformer()));
            });
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo
                {
                    Title = "FFPT Project API",
                    Version = "v1"
                });
                c.ResolveConflictingActions(apiDescriptions => apiDescriptions.First());


            });
            services.ConnectToConnectionString(Configuration);



        }

        public void ConfigureContainer(ContainerBuilder builder)
        {
            // Register your own things directly with Autofac, like:

            builder.RegisterType<UnitOfWork>().As<IUnitOfWork>();

            builder.RegisterType<CategoryService>().As<ICategoryService>();
            builder.RegisterType<CustomerService>().As<ICustomerService>();
            builder.RegisterType<MenuService>().As<IMenuService>();
            builder.RegisterType<OrderService>().As<IOrderService>();
            builder.RegisterType<ProductInMenuService>().As<IProductInMenuService>();
            builder.RegisterType<ProductServices>().As<IProductServices>();
            builder.RegisterType<SettingsService>().As<ISettingsService>();

            builder.RegisterGeneric(typeof(GenericRepository<>))
            .As(typeof(IGenericRepository<>))
            .InstancePerLifetimeScope();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app)
        {
            app.ConfigMigration<FFPT_ProjectDboContext>();
            app.UseCors(MyAllowSpecificOrigins);
            app.UseExceptionHandler("/error");
            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "FFPT Api V1");
                c.DocExpansion(Swashbuckle.AspNetCore.SwaggerUI.DocExpansion.None);
            });
            app.UseRouting();
            app.UseAuthentication();
         
            app.UseDeveloperExceptionPage();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}