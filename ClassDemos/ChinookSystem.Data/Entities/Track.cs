using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
#endregion

namespace ChinookSystem.Data.Entities
{
    [Table("Tracks")]
    public class Track
    {
        
        private string _Composer;
        [Key]
        public int TrackId { get; set; }

        public string Name { get; set; }

        public int? AlbumId { get; set; }

        public int MediaTypeId { get; set; }

        public int? GenreId { get; set; }

        public string Composer
        {
            get
            {
                return _Composer;
            }
            set
            {
                if (string.IsNullOrEmpty(value))
                {
                    _Composer = null;
                }
                else
                {
                    _Composer = value;
                }
            }
        }

        public int Milliseconds { get; set; }

        public int? Bytes { get; set; }

        public decimal UnitPrice { get; set; }

        //navigational properties
        public virtual Album Album { get; set; }
        public virtual MediaType MediaType { get; set; }
        public virtual Genre Genre { get; set; }
    }
}
