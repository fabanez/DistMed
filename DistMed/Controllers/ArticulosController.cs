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
    public class ArticulosController : Controller
    {
        readonly DistMedContext _db;

        public ArticulosController(DistMedContext db)
        {
            _db = db;
        }

        // GET: ArticulosController
        public async Task<ActionResult> Index()
        {
            return View(await _db.Articulos.ToListAsync());
        }

        // GET: ArticulosController/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ArticulosController/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(IFormCollection collection)
        {
            var desc = collection["Descripcion"];
            var corta = collection["DescripcionCorta"];
            var barras = collection["CodigoBarras"];
            try
            {
                var art = new Articulo
                {
                    Descripcion = desc,
                    DescripcionCorta = corta,
                    CodigoBarras = barras
                };
                _db.Articulos.Add(art);
                await _db.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: ArticulosController/Edit/5
        public async Task<ActionResult> Edit(int id)
        {
            var art = await _db.Articulos.FindAsync(id);

            return View(art);
        }

        // POST: ArticulosController/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit(int id, IFormCollection collection)
        {
            var desc = collection["Descripcion"];
            var corta = collection["DescripcionCorta"];
            var barras = collection["CodigoBarras"];
            try
            {
                var art = new Articulo
                {
                    Id = id,
                    Descripcion = desc,
                    DescripcionCorta = corta,
                    CodigoBarras = barras
                };
                _db.Articulos.Update(art);
                await _db.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            catch
            {
                return View();
            }
        }

        // GET: ArticulosController/Delete/5
        public async Task<ActionResult> Delete(int id)
        {
            var item = _db.Articulos.Find(id);
            _db.Articulos.Remove(item);
            await _db.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

    }
}
