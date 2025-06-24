using Microsoft.AspNetCore.Mvc;
using WebApplication1.Application;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class AvionController : ControllerBase
    {
        
        #region Fields
        public AvionApplicationService _avionAppService;
        #endregion

        #region Constructor
        public AvionController(AvionApplicationService avionAppService)
        {
            _avionAppService = avionAppService;
        }
        #endregion

        #region Methods
        [HttpGet]
        [Route("GetAll")]
        public ActionResult<dynamic> GetALL()
        {
            return _avionAppService.GetAll();
        }

        [HttpGet]
        [Route("GetAeropuertos")]
        public ActionResult<dynamic> GetAeropuertos()
        {
            return _avionAppService.GetAeropuertos();
        }

        [HttpPost]
        [Route("Insert")]
        public ActionResult<dynamic> Insert([FromBody] Avion avion)
        {

            return _avionAppService.Insert(avion);
        }


        [HttpPut]
        [Route("Update")]
        public ActionResult<dynamic> Update([FromBody] Avion avion)
        {

            return _avionAppService.Update(avion);
        }

        [HttpDelete]
        [Route("Delete")]
        public ActionResult<dynamic> Delete(Guid id)
        {

            return _avionAppService.Delete(id);
        }

        #endregion

    }
}
