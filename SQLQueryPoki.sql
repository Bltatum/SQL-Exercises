--1--
SElECT [Name]
FROM Grade;
--Answer: 1st-5th--

--2--
SELECT [Name]
FROM Emotion 
--Answer: Anger, Fear, Sadness, Joy

--3--
SELECT COUNT(Id) as 'Poem Count'
FROM Poem
--Answer: 32842

--4--
SELECT TOP 76 [Name]
FROM Author
ORDER BY [Name]


--5--
SELECT TOP 76 a.[Name], g.[Name]
FROM Author a
JOIN Grade g ON a.GradeId = g.Id
ORDER BY a.[Name]

--6--
SELECT TOP 76 a.[Name], g.[Name], gender.[Name]
FROM Author a
JOIN Grade g ON a.GradeId = g.Id
JOIN Gender gender ON gender.Id = a.GenderId
ORDER BY a.[Name]


--7--
SELECT SUM(WordCount) AS 'Total NUmber Of Words' 
FROM Poem

--8--
SELECT MIN(CharCount) AS 'The Least Characters'
FROM Poem 

--9--
SELECT g.[Name], COUNT(a.Id) AS 'Number of 3rd Grade Authors'
FROM Author a
JOIN Grade g ON a.GradeId = g.Id
WHERE g.Id = 3
GROUP BY g.[Name]

--10--
SELECT g.[Name], COUNT(a.Id) AS 'Number of 3rd Grade Authors'
FROM Author a
JOIN Grade g ON a.GradeId = g.Id
WHERE g.id = 3 OR g.Id = 1 OR g.Id = 2
GROUP BY g.[Name]

--11--
SELECT g.[Name], COUNT(p.Id) AS '4th Grade Auhtors'
FROM Poem p
JOIN Author a ON a.Id = p.AuthorId
JOIN Grade g ON g.Id = a.GradeId
WHERE g.Id = 4
GROUP BY g.[Name]

--12--
SELECT g.[Name], COUNT(p.Id)
FROM Poem p
JOIN Author a ON a.Id = p.AuthorId
JOIN Grade g ON a.GradeId = g.Id
GROUP BY g.[Name]

--13--
SELECT g.[Name], COUNT(a.Id)
FROM Author a
JOIN Grade g ON a.GradeId = g.Id
GROUP BY g.[Name]


--14--
SELECT TOP 1 Title AS 'Longest Title'
FROM Poem 
ORDER BY LEN(Title) DESC

--15--
SELECT TOP 1 a.[NAME], SUM(p.AuthorId) AS 'Auhtors with most Poems'
FROM Author a
JOIN Poem p ON a.Id = p.AuthorId
GROUP BY a.[Name]
ORDER BY a.[Name] DESC


