namespace Project.Data.Entity
{
    public partial class Shipper
    {
        public int Id { get; set; }
        public string ShipperName { get; set; } = null!;
        public string Phone { get; set; } = null!;
        public int Status { get; set; }
    }
}
