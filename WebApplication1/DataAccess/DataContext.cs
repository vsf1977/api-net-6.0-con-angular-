using Microsoft.EntityFrameworkCore;
using WebApplication1.Models;

namespace WebApplication1.DataAccess
{
    public class DataContext : DbContext
    {
        protected readonly IConfiguration Configuration;
        public DbSet<Avion> Avion { get; set; }

        public DbSet<Ciudad> Ciudad { get; set; }
        public DbSet<Vuelo> Vuelo { get; set; }

        public DbSet<Fabricante> Fabricante { get; set; }

        public DataContext(DbContextOptions<DataContext> options) : base(options)
        {
        }

    }
}
