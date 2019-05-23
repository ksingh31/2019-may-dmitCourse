<Query Kind="Expression">
  <Connection>
    <ID>c9fdc49c-d7c5-4469-8945-928688ab753b</ID>
    <Persist>true</Persist>
    <Server>.</Server>
    <Database>Chinook</Database>
  </Connection>
</Query>

/* using query syntax, list all the records from the Albums table

from x in Albums
select x
*/

/* using method syntax, list all the records from the Albums table
Albums.Select (x => x)
*/

/* using query syntax, list all the records from the Albums table for ArtistId 1

from x in Albums
where x.ArtistId == 1
select x
*/

/* using method syntax, list all the records from the Albums table for ArtistId 1

Albums.Where (x => (x.ArtistId == x))
*/

/* using query syntax, list all the records from the Albums table for ArtistId 1 
   ordered ascending by ReleaseYear

from x in Albums
where x.ArtistId == 1
orderby x.ReleaseYear
select x
*/



/* List all records from the entity albums ordered by descending ReleaseYear and 
Alphabetically by Title descending is required, ascending is default for any sort of item */
/* 
from x in Albums
orderby x.ReleaseYear descending, x.Title ascending
select x

Albums
   .OrderByDescending (x => x.ReleaseYear)
   .ThenBy (x => x.Title)*/

/* Repeat the previous query but only for years 2007 through 2010 inclusive 
from x in Albums
where x.ReleaseYear >= 2007 && x.ReleaseYear <= 2010
orderby x.ReleaseYear descending, x.Title ascending
select x

Albums
   .Where(x =>(x.ReleaseYear >= 2007 && x.ReleaseYear <= 2010))
   .OrderByDescending (x => x.ReleaseYear)
   .ThenBy (x => x.Title)
*/

/* List all customers in Alphabetic Order by Last Name, firstname who live in the US with an yahoo email 
   from c in Customers
   where c.Country.Equals("USA") && c.Email.Contains("yahoo")
   orderby c.LastName, c.FirstName
   select c
   
   Customers
   	.Where (c => (c.Country.Equals("USA") && c.Email.Contains("yahoo")))
	.OrderBy (c => (c.LastName))
	.ThenBy (c => (c.FirstName)) 
*/

/* once can query for a subset of entity attributes | one can query for a set of attributes from multiple entities 
Create a query to return ONLY the trackid and song name for use by a dropdown list */

from t in Tracks
orderby t.Name
select  new
{
	TrackId = t.TrackId,
	Song = t.Name
}

/* Create an Alphabetic list of Albums showing the album title, release Year and Artist Name */
from a in Albums

select new
{
	Title = a.Title,
	Year = a.ReleaseYear,
	Name = a.Artist.Name
}