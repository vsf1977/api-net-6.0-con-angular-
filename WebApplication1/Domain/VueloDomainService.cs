using Microsoft.AspNetCore.Mvc;
using System.Net;
using WebApplication1.DataAccess;
using WebApplication1.Models;

namespace WebApplication1.Domain
{
    public class VueloDomainService
    {
        private DataContext _context;

        #region Constructor
        public VueloDomainService(DataContext dataContext)
        {
            _context = dataContext;
        }
        #endregion

        #region Methods
        public List<Vuelo> GetAll()
        {
            return _context.Vuelo.ToList();
        }

        public ActionResult<dynamic> Insert(Vuelo vuelo)
        {
            List<Vuelo> vueloList = _context.Vuelo.ToList();
            if ((vuelo.id_ciudad_salida == vuelo.id_ciudad_llegada) ||
                (vueloList.Where(x => x.id_ciudad_salida == vuelo.id_ciudad_salida &&
                                      x.id_ciudad_llegada == vuelo.id_ciudad_llegada &&
                                      x.id_avion == vuelo.id_avion).Any()))                
                return HttpStatusCode.BadRequest;
            else
            {
                _context.Vuelo.AddAsync(vuelo);
                return _context.SaveChanges();
            }            
        }

        public ActionResult<dynamic> Update(Vuelo vuelo)
        {
            List<Vuelo> vueloList = _context.Vuelo.ToList();
            if ((vuelo.id_ciudad_salida == vuelo.id_ciudad_llegada) ||
                (vueloList.Where(x => x.id_ciudad_salida == vuelo.id_ciudad_salida &&
                                      x.id_ciudad_llegada == vuelo.id_ciudad_llegada &&
                                      x.id_avion == vuelo.id_avion).Any()))
                return HttpStatusCode.BadRequest;
            else
            {
                _context.Vuelo.Update(vuelo);
                return _context.SaveChanges();
            }
        }

        public ActionResult<dynamic> Delete(Guid id)
        {
            Vuelo vuelo = _context.Vuelo.Where(x => x.id == id).FirstOrDefault();
            if (vuelo != null)
            {
                _context.Vuelo.Remove(vuelo);
                return _context.SaveChanges();
            }
            return HttpStatusCode.NoContent;
        }

        #endregion
    }
}