using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DistMed.Models
{
    public partial class Articulo: IEnumerable 
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "El campo {0} es requerido")]
        [StringLength(100, ErrorMessage = "La longitud de {0} no debe ser mayor a {1}")]
        [Display(Name = "Descripción")]
        public string Descripcion { get; set; }

        [StringLength(30, ErrorMessage = "La longitud de {0} no debe ser mayor a {1}")]
        [Display(Name = "Descripción Corta")]
        public string DescripcionCorta { get; set; }

        [StringLength(20, ErrorMessage = "La longitud de {0} no debe ser mayor a {1}")]
        [Display(Name = "Código de Barras")]
        public string CodigoBarras { get; set; }

        public IEnumerator GetEnumerator()
        {
            throw new NotImplementedException();
        }
    }
}
