using Microsoft.AspNetCore.Mvc;
using WebApplication1.Application;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class CiudadController : ControllerBase
    {
        
        #region Fields
        public CiudadApplicationService _ciudadAppService;
        #endregion

        #region Constructor
        public CiudadController(CiudadApplicationService ciudadAppService)
        {
            _ciudadAppService = ciudadAppService;
        }
        #endregion

        #region Methods
        [HttpGet]
        [Route("GetAll")]
        public ActionResult<dynamic> GetALL()
        {
            return _ciudadAppService.GetAll();
        }

        [HttpPost]
        [Route("Insert")]
        public ActionResult<dynamic> Insert([FromBody] Ciudad ciudad)
        {

            return _ciudadAppService.Insert(ciudad);
        }


        [HttpPut]
        [Route("Update")]
        public ActionResult<dynamic> Update([FromBody] Ciudad ciudad)
        {

            return _ciudadAppService.Update(ciudad);
        }

        [HttpDelete]
        [Route("Delete")]
        public ActionResult<dynamic> Delete(Guid id)
        {

            return _ciudadAppService.Delete(id);
        }

        #endregion

    }
}
