namespace Project.Service.DTO.Request
{
    public class UpdateProductInMenuRequest
    {
        public int ProductId { get; set; }
        public int MenuId { get; set; }
        public double? Price { get; set; }
        public int Active { get; set; }
    }
}
