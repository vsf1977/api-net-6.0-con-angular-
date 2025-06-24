using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using Newtonsoft.Json.Linq;
using System.Net;
using System.Net.Http;
using WebApplication1.DataAccess;
using WebApplication1.Models;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.Extensions.Configuration;
using System.Configuration;

namespace WebApplication1.Domain
{
    public class AvionDomainService
    {
        private DataContext _context;
        private readonly IConfiguration _configuration;


        #region Constructor
        public AvionDomainService(DataContext dataContext, IConfiguration configuration)
        {
            _context = dataContext;
            _configuration = configuration;
        }
        #endregion


        #region Methods
        public List<Avion> GetAll()
        {
            return _context.Avion.OrderBy(x => x.matricula).ToList();
        }

        public async Task<List<Aeropuerto>> GetAeropuertosAsync()
        {
            HttpClient httpClient = new HttpClient();
            ConfigurationManager configurationManager = new ConfigurationManager();
            string api_key = _configuration["API_KEY"];
            string url = _configuration["APIAeropuerto"];
            httpClient.DefaultRequestHeaders.Add("Authorization", $"Bearer {api_key}");
            httpClient.DefaultRequestHeaders.Add("Duffel-Version", "v2");
            using HttpResponseMessage response = await httpClient.GetAsync(url);
            var jsonResponse = await response.Content.ReadAsStringAsync();
            JObject json = JObject.Parse(jsonResponse);
            List<Aeropuerto> data = JsonSerializer.Deserialize<List<Aeropuerto>>(json["data"].ToString());
            return data;
        }

        public ActionResult<dynamic> Insert(Avion avion)
        {
            _context.Avion.AddAsync(avion);
            return _context.SaveChanges();
        }

        public ActionResult<dynamic> Update(Avion avion)
        {
            _context.Avion.Update(avion);
            return _context.SaveChanges();
        }

        public ActionResult<dynamic> Delete(Guid id)
        {
            Avion avion = _context.Avion.Where(x => x.id == id).FirstOrDefault();
            if (avion != null)
            {
                _context.Avion.Remove(avion);
                return _context.SaveChanges();
            }
            return HttpStatusCode.NoContent;
        }

        #endregion
    }
}