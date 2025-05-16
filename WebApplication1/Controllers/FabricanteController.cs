using Microsoft.AspNetCore.Mvc;
using WebApplication1.Application;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class FabricanteController : ControllerBase
    {
        
        #region Fields
        public FabricanteApplicationService _fabricanteAppService;
        #endregion

        #region Constructor
        public FabricanteController(FabricanteApplicationService fabricanteAppService)
        {
            _fabricanteAppService = fabricanteAppService;
        }
        #endregion

        #region Methods
        [HttpGet]
        [Route("GetAll")]
        public ActionResult<dynamic> GetALL()
        {
            return _fabricanteAppService.GetAll();
        }

        [HttpPost]
        [Route("Insert")]
        public ActionResult<dynamic> Insert([FromBody] Fabricante fabricante)
        {

            return _fabricanteAppService.Insert(fabricante);
        }


        [HttpPut]
        [Route("Update")]
        public ActionResult<dynamic> Update([FromBody] Fabricante fabricante)
        {

            return _fabricanteAppService.Update(fabricante);
        }

        [HttpDelete]
        [Route("Delete")]
        public ActionResult<dynamic> Delete(Guid id)
        {

            return _fabricanteAppService.Delete(id);
        }

        #endregion

    }
}
