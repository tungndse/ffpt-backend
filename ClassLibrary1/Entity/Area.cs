namespace Project.Data.Entity
{
    public partial class Area
    {
        public Area()
        {
            Rooms = new HashSet<Room>();
        }

        public int Id { get; set; }
        public string Name { get; set; } = null!;

        public virtual ICollection<Room> Rooms { get; set; }
    }
}
