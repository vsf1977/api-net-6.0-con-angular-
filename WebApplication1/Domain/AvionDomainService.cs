using Microsoft.AspNetCore.Mvc;
using System.Net;
using WebApplication1.DataAccess;
using WebApplication1.Models;

namespace WebApplication1.Domain
{
    public class AvionDomainService
    {
        private DataContext _context;

        #region Constructor
        public AvionDomainService(DataContext dataContext)
        {
            _context = dataContext;
        }
        #endregion


        #region Methods
        public List<Avion> GetAll()
        {
            return _context.Avion.OrderBy(x => x.matricula).ToList();
        }

        public ActionResult<dynamic> Insert(Avion avion)
        {
            _context.Avion.AddAsync(avion);            
            return _context.SaveChanges();
        }

        public ActionResult<dynamic> Update(Avion avion)
        {
            _context.Avion.Update(avion);
            return _context.SaveChanges();
        }

        public ActionResult<dynamic> Delete(Guid id)
        {
            Avion avion = _context.Avion.Where(x => x.id == id).FirstOrDefault();
            if (avion != null)
            {
                _context.Avion.Remove(avion);
                return _context.SaveChanges();
            }
            return HttpStatusCode.NoContent;
        }

        #endregion
    }
}