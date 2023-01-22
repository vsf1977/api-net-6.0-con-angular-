using Microsoft.AspNetCore.Mvc;
using System.Net;
using WebApplication1.DataAccess;
using WebApplication1.Models;

namespace WebApplication1.Domain
{
    public class CiudadDomainService
    {
        private DataContext _context;

        #region Constructor
        public CiudadDomainService(DataContext dataContext)
        {
            _context = dataContext;
        }
        #endregion


        #region Methods
        public ActionResult<dynamic> GetAll()
        {
            return _context.Ciudad.ToList();
        }

        public ActionResult<dynamic> Insert(Ciudad ciudad)
        {
            _context.Ciudad.AddAsync(ciudad);            
            return _context.SaveChanges();
        }

        public ActionResult<dynamic> Update(Ciudad ciudad)
        {
            _context.Ciudad.Update(ciudad);
            return _context.SaveChanges();
        }

        public ActionResult<dynamic> Delete(Guid id)
        {
            Ciudad ciudad = _context.Ciudad.Where(x => x.Id == id).FirstOrDefault();
            if (ciudad != null)
            {
                _context.Ciudad.Remove(ciudad);
                return _context.SaveChanges();
            }
            return HttpStatusCode.NoContent;
        }

        #endregion
    }
}