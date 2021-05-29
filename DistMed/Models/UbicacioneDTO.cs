using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DistMed.Models
{
    public partial class UbicacioneDTO
    {
        [Key]
        public int Id { get; set; }
        public string Bodega { get; set; }
        public string Nombre { get; set; }
        public string Articulo { get; set; }

        [Display(Name = "Capacidad")]
        public int PiezasMax { get; set; }
    }
}
