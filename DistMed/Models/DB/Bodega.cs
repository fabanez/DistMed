using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace DistMed.Models.DB
{
    public partial class Bodega
    {
        public Bodega()
        {
            Ubicaciones = new HashSet<Ubicacione>();
        }

        public int Id { get; set; }

        [Required]
        [MaxLength(50, ErrorMessage = "{0} no debe ser mayor de {1}")]
        public string Nombre { get; set; }

        public virtual ICollection<Ubicacione> Ubicaciones { get; set; }
    }
}
