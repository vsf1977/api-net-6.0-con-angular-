using Microsoft.AspNetCore.Mvc;
using WebApplication1.DataAccess;
using WebApplication1.Domain;
using WebApplication1.Models;

namespace WebApplication1.Application
{
    public class AvionApplicationService
    {
        #region Fields
        private AvionDomainService _avionDomainService;
        private DataContext _context;

        #endregion

        #region Constructor
        public AvionApplicationService(AvionDomainService avionDomainService, DataContext dataContext)
        {
            _avionDomainService = avionDomainService;
            _context = dataContext;
        }
        #endregion

        #region Methods
        public ActionResult<dynamic> GetAll()
        {
            try
            {
                var res = _avionDomainService.GetAll();
                return res;

            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public ActionResult<dynamic> Insert(Avion avion)
        {
            try
            {                
                var res = _avionDomainService.Insert(avion);
                return res;
            }
            catch (Exception ex)
            {
                return ex.InnerException;
            }
        }

        public ActionResult<dynamic> Update(Avion avion)
        {
            try
            {
                var res = _avionDomainService.Update(avion);
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
                var res = _avionDomainService.Delete(id);
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
