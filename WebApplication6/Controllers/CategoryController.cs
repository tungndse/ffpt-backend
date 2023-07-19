using System;
using System.Threading.Tasks;
using FFPT_Project.Service.DTO.Response;
using Microsoft.AspNetCore.Mvc;
using Project.Service.DTO.Request;
using Project.Service.Service;
using WebApplication6.Helpers;

namespace WebApplication6.Controllers
{
    [Route(SettingVersionApi.ApiVersion)]
    [ApiController]
    public class CategoryController : Controller
    {
        private readonly ICategoryService _categoryService;

        public CategoryController(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }


        /// <summary>
        /// Get List Category
        /// </summary>
        /// <param name="paging"></param>
        /// <returns></returns>
        [HttpGet("GetListCategory")]
        public async Task<ActionResult<PagedResults<CategoryResponse>>> GetListCategory([FromQuery] PagingRequest paging)
        {
            try
            {
                var rs = await _categoryService.GetListCategory(paging);
                return Ok(rs);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
