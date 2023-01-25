namespace WebApplication1.Models
{
    public class Vuelo
    {
        public Guid id { get; set; }
        public Guid id_ciudad_salida { get; set; }
        public Guid id_ciudad_llegada { get; set; }
        public Guid id_avion { get; set; }
    }
}
