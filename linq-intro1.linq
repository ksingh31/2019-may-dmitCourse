<Query Kind="Program">
  <Connection>
    <ID>c9fdc49c-d7c5-4469-8945-928688ab753b</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>Chinook</Database>
  </Connection>
</Query>

void Main()
{
	BLL_Query();
}

// Define other methods and classes here

public IEnumerable<AlbumArtists> BLL_Query()
{
	var results = from a in Albums
					orderby a.Title
					select new AlbumArtists
					{
						Title = a.Title,
						Year = a.ReleaseYear,
						ArtistName = a.Artist.Name
					};
	// to display the context of a variable in LinQpad
	// you will use the LinQpad method .Dump() - Method Only in LinQpad
	return results;
}

/*
the query using this class is pulling data from multiple tables and is a subset of those tables. The resulting dataset is NOT an entity
The query contains ONLY primitve data values
the query has no data structure (i.e list, arrays,...)
classes that are not entities and have no structure will be referred to as POCO classes

*/
public class AlbumArtists
{
	public string Title {get; set;}
	public int Year {get; set;}
	public string ArtistName {get; set;}
}