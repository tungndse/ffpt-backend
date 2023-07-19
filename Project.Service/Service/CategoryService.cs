using System.Net;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using FFPT_Project.Service.DTO.Response;
using Project.Data.Entity;
using Project.Data.UnitOfWork;
using Project.Service.DTO.Request;
using Project.Service.Exceptions;
using Project.Service.Helpers;

namespace Project.Service.Service
{
    public interface ICategoryService
    {
        Task<PagedResults<CategoryResponse>> GetListCategory(PagingRequest paging);
    }
    public class CategoryService : ICategoryService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;

        public CategoryService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _mapper = mapper;
            _unitOfWork = unitOfWork;
        }

        public async Task<PagedResults<CategoryResponse>> GetListCategory(PagingRequest paging)
        {
            try
            {
                var list = _unitOfWork.Repository<Category>().GetAll()
                                .ProjectTo<CategoryResponse>(_mapper.ConfigurationProvider)
                                .ToList();
                var result = PageHelper<CategoryResponse>.Paging(list, paging.Page, paging.PageSize);

                return result;
            }
            catch(CrudException e)
            {
                throw new CrudException(HttpStatusCode.BadRequest, "Get category list error!!!!!", e.Message);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
