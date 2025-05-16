using Microsoft.AspNetCore.Mvc;
using WebApplication1.DataAccess;
using WebApplication1.Domain;
using WebApplication1.Models;

namespace WebApplication1.Application
{
    public class FabricanteApplicationService
    {
        #region Fields
        private FabricanteDomainService _fabricanteDomainService;
        private DataContext _context;

        #endregion

        #region Constructor
        public FabricanteApplicationService(FabricanteDomainService fabricanteDomainService, DataContext dataContext)
        {
            _fabricanteDomainService = fabricanteDomainService;
            _context = dataContext;
        }
        #endregion

        #region Methods
        public ActionResult<dynamic> GetAll()
        {
            try
            {
                var res = _fabricanteDomainService.GetAll();
                return res;

            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public ActionResult<dynamic> Insert(Fabricante fabricante)
        {
            try
            {                
                var res = _fabricanteDomainService.Insert(fabricante);
                return res;
            }
            catch (Exception ex)
            {
                return ex.InnerException;
            }
        }

        public ActionResult<dynamic> Update(Fabricante fabricante)
        {
            try
            {
                var res = _fabricanteDomainService.Update(fabricante);
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
                var res = _fabricanteDomainService.Delete(id);
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
