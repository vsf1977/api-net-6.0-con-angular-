using Microsoft.AspNetCore.Mvc;
using WebApplication1.Application;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class VueloController : ControllerBase
    {
        
        #region Fields
        public VueloApplicationService _vueloAppService;
        #endregion

        #region Constructor
        public VueloController(VueloApplicationService vueloAppService)
        {
            _vueloAppService = vueloAppService;
        }
        #endregion

        #region Methods
        [HttpGet]
        [Route("GetAll")]
        public ActionResult<dynamic> GetALL()
        {
            return _vueloAppService.GetAll();
        }

        [HttpPost]
        [Route("Insert")]
        public ActionResult<dynamic> Insert([FromBody] Vuelo vuelo)
        {

            return _vueloAppService.Insert(vuelo);
        }


        [HttpPut]
        [Route("Update")]
        public ActionResult<dynamic> Update([FromBody] Vuelo vuelo)
        {

            return _vueloAppService.Update(vuelo);
        }

        [HttpDelete]
        [Route("Delete")]
        public ActionResult<dynamic> Delete(Guid id)
        {

            return _vueloAppService.Delete(id);
        }

        #endregion

    }
}
