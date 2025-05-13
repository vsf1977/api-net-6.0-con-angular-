using Azure.Core;
using Microsoft.AspNetCore.Mvc;
using System.Net;
using System.Net.Http;
using WebApplication1.DataAccess;
using WebApplication1.Domain;
using WebApplication1.Models;

namespace WebApplication1.Application
{
    public class VueloApplicationService
    {
        #region Fields
        private VueloDomainService _vueloDomainService;
        private AvionDomainService _avionDomainService;
        private CiudadDomainService _ciudadDomainService;
        private DataContext _context;

        #endregion

        #region Constructor
        public VueloApplicationService(VueloDomainService vueloDomainService, AvionDomainService avionDomainService, CiudadDomainService ciudadDomainService, DataContext dataContext)
        {
            _vueloDomainService = vueloDomainService;
            _avionDomainService = avionDomainService;
            _ciudadDomainService = ciudadDomainService;
            _context = dataContext;
        }
        #endregion

        #region Methods
        public ActionResult<dynamic> GetAll()
        {
            try
            {
                List<Vuelo> vuelo = _vueloDomainService.GetAll();
                return vuelo.ToList();

            }
            catch (Exception ex)
            {
                return ex.InnerException;
            }
        }

        public ActionResult<dynamic> Insert(Vuelo vuelo)
        {
            try
            {
                var res = _vueloDomainService.Insert(vuelo);
                return res;
            }
            catch (Exception ex)
            {
                return ex.InnerException;
            }
        }

        public ActionResult<dynamic> Update(Vuelo vuelo)
        {
            try
            {
                var res = _vueloDomainService.Update(vuelo);
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
                var res = _vueloDomainService.Delete(id);
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
