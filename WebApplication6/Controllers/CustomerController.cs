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
    public class CustomerController : Controller
    {
        private readonly ICustomerService _customerService;

        public CustomerController(ICustomerService customerService)
        {
            _customerService = customerService;
        }

        /// <summary>
        /// Get Customer
        /// </summary>
        /// <param name="request"></param>
        /// <param name="paging"></param>
        /// <returns></returns>
        [HttpGet]
        public async Task<ActionResult<PagedResults<CustomerResponse>>> GetCustomers([FromQuery] CustomerResponse request, [FromQuery] PagingRequest paging)
        {
            var rs = await _customerService.GetCustomers(request, paging);
            return Ok(rs);
        }

        /// <summary>
        /// Update Customer
        /// </summary>
        /// <param name="id"></param>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPut("{id}")]
        public async Task<ActionResult<CustomerResponse>> UpdateCustomer(int id, [FromBody] UpdateCustomerRequest request)
        {
            var rs = await _customerService.UpdateCustomer(id, request);
            return Ok(rs);
        }

        /// <summary>
        /// Login
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        /// [AllowAnonymous]
        
    }
}
