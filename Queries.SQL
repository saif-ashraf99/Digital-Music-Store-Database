/* Find Which city has the best customers */

SELECT city,sum(invoice.Total) as InvoiceTotals
from customer
Join invoice
on customer.CustomerId=Invoice.CustomerId
group by customer.city
order by InvoiceTotals desc
limit 10;

/* Find Who is writing the rock music */

SELECT Artist.Name,Artist.ArtistId,COUNT(Track.Name) AS Songs
from Artist
Join Album
on Album.ArtistId=Artist.ArtistId
Join Track
on Album.AlbumId=Track.AlbumId 
join Genre
on Track.GenreId=Genre.GenreId
WHERE Genre.name="Rock"
GROUP BY Artist.ArtistId, Artist.Name, Genre.Name
ORDER BY Songs DESC
limit 10;

/* Find Track names that have a song length longer than the
average song length */

select Artist.Name , Track.Milliseconds , Track.Name
From Track 
Join Album
ON Album.AlbumId=Track.AlbumId
JOIN Artist
ON Artist.ArtistId=Album.ArtistId
WHERE Track.Milliseconds>(SELECT AVG(Milliseconds) FROM Track)
ORDER BY Track.Milliseconds DESC
Limit 10;

/* Find Which artist has earned the most according to the
InvoiceLines */

SELECT Artist.Name as ArtistName , SUM(InvoiceLine.Quantity * InvoiceLine.UnitPrice) AS AmountSpent
FROM Artist 
JOIN Album 
	ON Artist.ArtistId = Album.ArtistId
JOIN Track 
	ON Track.AlbumId = Album.AlbumId
JOIN InvoiceLine 
	ON Track.TrackId = InvoiceLine.Trackid
GROUP BY Artist.Name 
ORDER BY AmountSpent DESC;