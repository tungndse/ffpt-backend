using System.Net;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using FFPT_Project.Service.DTO.Response;
using Project.Data.Entity;
using Project.Data.UnitOfWork;
using Project.Service.DTO.Request;
using Project.Service.Exceptions;
using Project.Service.Helpers;
using Project.Service.Utilities;

namespace Project.Service.Service
{
    public interface ICustomerService
    {
        Task<PagedResults<CustomerResponse>> GetCustomers(CustomerResponse request, PagingRequest paging);
       
        Task<CustomerResponse> CreateCustomer(CreateCustomerRequest request);
        Task<CustomerResponse> GetCustomerByEmail(string email);
        Task<CustomerResponse> UpdateCustomer(int customerId, UpdateCustomerRequest request);
    }
    public class CustomerService : ICustomerService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public CustomerService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _mapper = mapper;
            _unitOfWork = unitOfWork;
        }

        public async Task<CustomerResponse> CreateCustomer(CreateCustomerRequest request)
        {
            try
            {
                var customer = _mapper.Map<CreateCustomerRequest, Customer>(request);

                customer.Id = _unitOfWork.Repository<Customer>().GetAll().Count() + 1;
                customer.Name = request.Name;
                customer.Email = request.Email;
                customer.ImageUrl = request.ImageUrl;
                customer.Phone = "";

                await _unitOfWork.Repository<Customer>().InsertAsync(customer);
                await _unitOfWork.CommitAsync();

                return _mapper.Map<Customer, CustomerResponse>(customer);
            }
            catch (CrudException ex)
            {
                throw new CrudException(HttpStatusCode.BadRequest, "Create Product Error!!!", ex?.Message);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public async Task<CustomerResponse> GetCustomerByEmail(string email)
        {
            try
            {
                Customer customer = null;
                customer = _unitOfWork.Repository<Customer>().GetAll()
                    .Where(x => x.Email.Contains(email)).FirstOrDefault();

                return _mapper.Map<Customer, CustomerResponse>(customer);
            }
            catch (Exception e)
            {
                return null;
            }
        }

        public async Task<PagedResults<CustomerResponse>> GetCustomers(CustomerResponse request, PagingRequest paging)
        {
            try
            {
                var customers =  _unitOfWork.Repository<Customer>().GetAll()
                                           .ProjectTo<CustomerResponse>(_mapper.ConfigurationProvider)
                                           .DynamicFilter(request)
                                           .ToList();
                var result = PageHelper<CustomerResponse>.Paging(customers, paging.Page, paging.PageSize);
                return result;
            }
            catch (CrudException ex)
            {
                throw new CrudException(HttpStatusCode.BadRequest, "Get customer list error!!!!!", ex.Message);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

      

        public async Task<CustomerResponse> UpdateCustomer(int customerId, UpdateCustomerRequest request)
        {
            try
            {
                Customer customer = null;
                customer = _unitOfWork.Repository<Customer>()
                    .Find(c => c.Id == customerId);

                if (customer == null)
                {
                    throw new CrudException(HttpStatusCode.NotFound, "Not found customer with id", customerId.ToString());
                }

                _mapper.Map<UpdateCustomerRequest, Customer>(request, customer);

                await _unitOfWork.Repository<Customer>().UpdateDetached(customer);
                await _unitOfWork.CommitAsync();
                return _mapper.Map<Customer, CustomerResponse>(customer);
            }
            catch (CrudException ex)
            {
                throw new CrudException(HttpStatusCode.BadRequest, "Update customer error!!!!!", ex.Message);
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

    }
}
