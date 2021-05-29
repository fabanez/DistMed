using System;
using System.Collections.Generic;

#nullable disable

namespace DistMed.Models.DB
{
    public partial class Ubicacione
    {
        public int Id { get; set; }
        public int IdBodega { get; set; }
        public string Nombre { get; set; }
        public int IdArticulo { get; set; }
        public int PiezasMax { get; set; }

        public virtual Articulo IdArticuloNavigation { get; set; }
        public virtual Bodega IdBodegaNavigation { get; set; }
    }
}
