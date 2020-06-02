--1
SELECT 
Id,
[Label]
FROM Genre

--2
SELECT
Id,
ArtistName,
YearEstablished
FROM Artist 
ORDER BY ArtistName

--3
SELECT
s.Title,
a.ArtistName
FROM Song s
JOIN Artist a on s.ArtistId = a.id;

--4
SELECT 
art.ArtistName,
g.[Label]
FROM Album a
JOIN Genre g ON a.GenreId = g.Id
JOIN Artist art ON a.ArtistId = art.Id
WHERE a.GenreId = 7

--5
SELECT
art.ArtistName,
g.[Label]
FROM Album al
JOIN Genre g ON al.GenreId = g.Id
JOIN Artist art ON al.ArtistId = art.Id
WHERE al.GenreId = 2 OR al.GenreId= 4

--6
SELECT
a.Title,
a.Id,
s.Id
FROM Album a
LEFT JOIN Song s ON s.AlbumId = null

--TEST--
SELECT
a.Title,
s.AlbumID
FROM Album a
JOIN Song s ON s.AlbumId = a.Id

--7
INSERT INTO  Artist (ArtistName, YearEstablished) VALUES ('Volbeat', '2010');

--8
INSERT INTO Album (Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId) VALUES ('Beyond Hell/Above Heaven', '2010', '200', 'EMI', '29', '5' );

--9
INSERT INTO  Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Heaven nor Hell', '400', '2010', '5', '29', '23');
INSERT INTO  Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('A Warriors Call', '300', '2010', '5', '29', '23');
INSERT INTO  Song (Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId) VALUES ('Still Counting', '422', '2010', '5', '29', '23');


--10
SELECT
s.Title,
a.Title,
art.ArtistName
FROM Song s 
LEFT JOIN Artist art ON art.Id = s.ArtistId
LEFT JOIN Album a ON a.Id = s.AlbumId
Where a.Id = 23 

--11
SELECT
a.Title, Count(s.AlbumId) AS 'Song Count'
FROM Album a 
JOIN Song s ON s.AlbumId  = a.Id
GROUP BY (a.Title)

--12
SELECT
a.ArtistName, Count(s.ArtistId) AS 'Song Count'
FROM Artist a 
JOIN Song s ON s.ArtistId  = a.Id
GROUP BY (a.ArtistName)

--13
SELECT
g.[Label], Count(s.GenreId) AS 'Song Count'
FROM Genre g 
JOIN Song s ON s.GenreId  = g.Id
GROUP BY (g.Label)

--14
SELECT
a.ArtistName
FROM Artist a
JOIN Album al ON al.ArtistId = a.Id
GROUP BY a.ArtistName
HAVING COUNT(al.Label) > 1

--15
SELECT
Title,
AlbumLength
FROM Album
WHERE AlbumLength = (SELECT MAX(AlbumLength) FROM Album)

--The ex code I found ^^^^^^^^^^^^^^^^^^^^^^^
--SELECT Name, Score
--FROM Scoring
--WHERE Score = (SELECT MAX(Score) FROM Scoring);


--16
SELECT
Title,
SongLength
FROM Song
WHERE SongLength = (SELECT MAX(SongLength) FROM Song)

--17
SELECT
s.Title,
s.SongLength,
a.Title
FROM Song s
JOIN Album a ON a.Id = s.AlbumId
WHERE SongLength = (SELECT MAX(SongLength) FROM Song)






