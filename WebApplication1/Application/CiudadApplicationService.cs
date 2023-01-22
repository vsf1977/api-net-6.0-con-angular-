using Microsoft.AspNetCore.Mvc;
using WebApplication1.DataAccess;
using WebApplication1.Domain;
using WebApplication1.Models;

namespace WebApplication1.Application
{
    public class CiudadApplicationService
    {
        #region Fields
        private CiudadDomainService _ciudadDomainService;
        private DataContext _context;

        #endregion

        #region Constructor
        public CiudadApplicationService(CiudadDomainService ciudadDomainService, DataContext dataContext)
        {
            _ciudadDomainService = ciudadDomainService;
            _context = dataContext;
        }
        #endregion


        #region Methods
        public ActionResult<dynamic> GetAll()
        {
            try
            {
                var res = _ciudadDomainService.GetAll();
                return res;

            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public ActionResult<dynamic> Insert(Ciudad ciudad)
        {
            try
            {
                var res = _ciudadDomainService.Insert(ciudad);
                return res;

            }
            catch (Exception ex)
            {
                return ex.InnerException;
            }
        }

        public ActionResult<dynamic> Update(Ciudad ciudad)
        {
            try
            {
                var res = _ciudadDomainService.Update(ciudad);
                return res;

            }
            catch (Exception ex)
            {
                return ex.InnerException;
            }
        }

        public ActionResult<dynamic> Delete(Guid id)
        {
            try
            {
                var res = _ciudadDomainService.Delete(id);
                return res;

            }
            catch (Exception ex)
            {
                return ex.InnerException;
            }
        }

        #endregion
    }
}
