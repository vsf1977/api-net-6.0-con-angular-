using Microsoft.AspNetCore.Mvc;
using System.Net;
using WebApplication1.DataAccess;
using WebApplication1.Models;

namespace WebApplication1.Domain
{
    public class FabricanteDomainService
    {
        private DataContext _context;

        #region Constructor
        public FabricanteDomainService(DataContext dataContext)
        {
            _context = dataContext;
        }
        #endregion


        #region Methods
        public List<Fabricante> GetAll()
        {
            return _context.Fabricante.OrderBy(x => x.nombre).ToList();
        }

        public ActionResult<dynamic> Insert(Fabricante fabricante)
        {
            _context.Fabricante.AddAsync(fabricante);
            return _context.SaveChanges();            
        }

        public ActionResult<dynamic> Update(Fabricante fabricante)
        {
            _context.Fabricante.Update(fabricante);
            return _context.SaveChanges();
        }

        public ActionResult<dynamic> Delete(Guid id)
        {
            Fabricante fabricante = _context.Fabricante.Where(x => x.id == id).FirstOrDefault();
            if (fabricante != null)
            {
                _context.Fabricante.Remove(fabricante);
                return _context.SaveChanges();
            }
            return HttpStatusCode.NoContent;
        }

        #endregion
    }
}