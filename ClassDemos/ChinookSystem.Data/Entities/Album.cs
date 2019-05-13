using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

#region Additional Namespaces
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
#endregion

// entity validation kicks in on the .SaveChanges() command
namespace ChinookSystem.Data.Entities
{
    [Table("Albums")]
    public class Album
    {
        private int _ReleaseYear;
        private string _ReleaseLabel;
        [Key]
        public int AlbumId { get; set; }

        [Required(ErrorMessage ="Title is required.")]
        [StringLength(160,ErrorMessage ="Title is limited to 160 characters")]
        public string Title { get; set; }
        public int ArtistId { get; set; }

        
        public int ReleaseYear
        {
            get
            {
                return _ReleaseYear;
            }
            set
            {
                if (value > DateTime.Today.Year || value < 1950)
                {
                    throw new Exception("Release Year must be between 1950 and this year");
                }
                else
                {
                    _ReleaseYear = value;
                }
            }
        }

        [StringLength(50,ErrorMessage ="Release label limited to 50 characters")]
        public string ReleaseLabel
        {
            get
            {
                return _ReleaseLabel;
            }
            set
            {
                if (string.IsNullOrEmpty(value))
                {
                    _ReleaseLabel = null;
                }
                else
                {
                    _ReleaseLabel = value;
                }
            }
        }

        [NotMapped]
        public string LabelYear
        {
            get
            {
                if (string.IsNullOrEmpty(ReleaseLabel))
                {
                    return "Unknown label (" + ReleaseYear.ToString() + ")";
                }
                else
                {
                    return ReleaseLabel + " (" + ReleaseYear.ToString() + ")";
                }
            }
        }

        //navigational properties
        public virtual Artist Artist { get; set; }
        public virtual ICollection<Track> Tracks { get; set; }
    }
}
