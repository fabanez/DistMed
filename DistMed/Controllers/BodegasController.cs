using DistMed.Models.DB;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DistMed.Controllers
{
    public class BodegasController : Controller
    {
        readonly DistMedContext _db;

        public BodegasController(DistMedContext db)
        {
            _db = db;
        }

        // GET: BodegasController
        public async Task<ActionResult> Index()
        {
            var items = await _db.Bodegas.FromSqlRaw<Bodega>("P_Bodegas_CRUD 0, '', 'R'").ToListAsync();
            return View(items);
        }

        // GET: BodegasController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: BodegasController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(IFormCollection collection)
        {
            var nom = collection["Nombre"];
            try
            {
                await _db.Database.ExecuteSqlRawAsync($"P_Bodegas_CRUD 0, {nom}, 'C'");
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // GET: BodegasController/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            var item = await _db.Bodegas.FromSqlInterpolated<Bodega>($"P_Bodegas_CRUD {id}, '', 'R'").ToListAsync();
            if (item is null)
            {
                return BadRequest("No se encontró la bodega");
            }
            Bodega obj = new Bodega { 
                Id = item[0].Id,
                Nombre = item[0].Nombre
            };
            return View(obj);
        }

        // POST: BodegasController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(int id, IFormCollection collection)
        {
            var nom = collection["Nombre"];
            try
            {
                await _db.Database.ExecuteSqlRawAsync($"P_Bodegas_CRUD {id}, {nom}, 'U'");
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // GET: BodegasController/Delete/5
        public async Task<ActionResult> Delete(int id)
        {
            try
            {
                await _db.Database.ExecuteSqlInterpolatedAsync($"P_Bodegas_CRUD {id}, '', 'D'");
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
