using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using DistMed.Models.DB;
using DistMed.Classes;
using System.Data;
using Microsoft.AspNetCore.Http;

namespace DistMed.Controllers
{
    public class InventariosController : Controller
    {
        private readonly ISimpleDataAccess _db;

        public InventariosController(ISimpleDataAccess db)
        {
            _db = db;
        }

        // GET: Inventarios
        public async Task<IActionResult> Index()
        {
            DataTable inv = await _db.ExecuteQueryAsync("P_InventarioDTO 0");
            List<DistMed.Models.InventarioDTO> items = new List<DistMed.Models.InventarioDTO>();
            
            foreach (DataRow r in inv.Rows)
            {
                DistMed.Models.InventarioDTO i = new DistMed.Models.InventarioDTO
                {
                    IdUbicacion = r.Field<int>("IdUbicacion"),
                    Bodega = r.Field<string>("Bodega"),
                    Ubicacion = r.Field<string>("Ubicacion"),
                    Articulo = r.Field<string>("Articulo"),
                    Piezas = r.Field<int>("Piezas")
                };
                items.Add(i);
            }
            return View(items);
        }

        // GET: Inventarios
        public async Task<IActionResult> Ubicaciones_Search(string Busqueda)
        {
            List<DistMed.Models.UbicacioneDTO> items = new List<DistMed.Models.UbicacioneDTO>();

            if (Busqueda == null || Busqueda == "")
            {
                return View(items);
            }

            DataTable ubi = await _db.ExecuteQueryAsync($"P_UbicacionesDTO_ArticuloSearch @Articulo='{Busqueda}', @SinInventario=1");

            foreach (DataRow r in ubi.Rows)
            {
                DistMed.Models.UbicacioneDTO i = new DistMed.Models.UbicacioneDTO
                {
                    Id = r.Field<int>("Id"),
                    Bodega = r.Field<string>("Bodega"),
                    Nombre = r.Field<string>("Nombre"),
                    Articulo = r.Field<string>("Articulo"),
                    PiezasMax = r.Field<int>("PiezasMax")
                };
                items.Add(i);
            }
            return View(items);
        }

        // GET: Inventarios/Create
        public async Task<IActionResult> Create(int id)
        {
            if (id <= 0)
            {
                return BadRequest();
            }

            DataTable inv = await _db.ExecuteQueryAsync($"P_InventarioDTO @id={id}, @SinRegistrar=1");

            if(inv.Rows.Count > 0)
            {
                DistMed.Models.InventarioDTO item = new DistMed.Models.InventarioDTO
                {
                    IdUbicacion = inv.Rows[0].Field<int>("IdUbicacion"),
                    Bodega = inv.Rows[0].Field<string>("Bodega"),
                    Ubicacion = inv.Rows[0].Field<string>("Ubicacion"),
                    Articulo = inv.Rows[0].Field<string>("Articulo"),
                    Piezas = inv.Rows[0].Field<int>("Piezas"),
                    PiezasMax = inv.Rows[0].Field<int>("PiezasMax")
                };
                return View(item);
            }
            else
            {
                return BadRequest($"No se encontró el registro {id}");
            }
        }

        // POST: Inventarios/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(IFormCollection collection)
        {
            if (collection.Count == 0){
                return BadRequest();
            }
            //Se obtienen los valores de la forma'
            var Id = collection["idUbicacion"];
            var Piezas = collection["Piezas"];

            try
            {
                //Se validan los datos de la forma
                await _db.ExecuteNonQueryAsync($"P_Inventario_CRUD {Id}, {Piezas}, 'C'");
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // GET: Inventarios/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            DataTable inv = await _db.ExecuteQueryAsync($"P_InventarioDTO @id={id}, @SinRegistrar=0");

            if (inv.Rows.Count > 0)
            {
                DistMed.Models.InventarioDTO item = new DistMed.Models.InventarioDTO
                {
                    IdUbicacion = inv.Rows[0].Field<int>("IdUbicacion"),
                    Bodega = inv.Rows[0].Field<string>("Bodega"),
                    Ubicacion = inv.Rows[0].Field<string>("Ubicacion"),
                    Articulo = inv.Rows[0].Field<string>("Articulo"),
                    Piezas = inv.Rows[0].Field<int>("Piezas"),
                    PiezasMax = inv.Rows[0].Field<int>("PiezasMax")
                };
                return View(item);
            }
            else
            {
                return BadRequest($"No se encontró el registro {id}");
            }
        }

        // POST: Inventarios/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(IFormCollection collection)
        {
            if (collection.Count == 0)
            {
                return BadRequest();
            }
            //Se obtienen los valores de la forma'
            var Id = collection["idUbicacion"];
            var Piezas = collection["Piezas"];

            try
            {
                //Se validan los datos de la forma
                await _db.ExecuteNonQueryAsync($"P_Inventario_CRUD {Id}, {Piezas}, 'U'");
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // GET: Inventarios/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            try
            {
                await _db.ExecuteNonQueryAsync($"P_Inventario_CRUD {id}, 0, 'D'");
                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

    }
}
