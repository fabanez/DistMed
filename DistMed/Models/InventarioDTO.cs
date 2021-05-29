using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DistMed.Models
{
    public partial class InventarioDTO
    {
        [Key]
        [HiddenInput(DisplayValue = false)]
        public int IdUbicacion { get; set; }

        public string Bodega { get; set; }

        [Display(Name = "Ubicación")]
        public string Ubicacion { get; set; }

        [Display(Name = "Artículo")]
        public string Articulo { get; set; }
        
        [Range(minimum:1, maximum:999999, ErrorMessage = "El valor es inválido")]
        public int Piezas { get; set; }

        [HiddenInput(DisplayValue = false)]
        public int PiezasMax { get; set; }
    }
}
