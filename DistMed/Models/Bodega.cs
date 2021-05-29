using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DistMed.Models
{
    public partial class Bodega
    {
        public int Id { get; set; }

        [Required]
        [MaxLength(50, ErrorMessage = "{0} no debe ser mayor de {1}")]
        public string Nombre { get; set; }
    }
}
