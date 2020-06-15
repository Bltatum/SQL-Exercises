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
SELECT TOP 1 a.[NAME], COUNT(p.Id) AS PoemCount
FROM Author a
JOIN Poem p ON a.Id = p.AuthorId
GROUP BY a.[Name]
ORDER BY PoemCount DESC

--16--
SELECT COUNT(p.Id),
            e.[Name]
       FROM Poem p
       JOIN PoemEmotion pm ON p.Id = pm.EmotionId
       JOIN Emotion e ON pm.EmotionId = e.Id
       WHERE  e.Id = 3
       GROUP BY e.Name
--17--
SELECT COUNT(p.Id) AS "no emotion" 
            FROM Poem p
            LEFT JOIN PoemEmotion pm ON p.Id = pm.PoemId
             WHERE pm.Id IS NULL

--18--
SELECT e.[Name] 
       FROM (SELECT EmotionId,
                    COUNT(pm.Id) AS EmotionCount 
                    FROM PoemEmotion pm
                    GROUP BY pm.EmotionId) AS EmotionCountQuery 
                    JOIN Emotion e ON e.Id = EmotionCountQuery.EmotionId 
       WHERE EmotionCountQuery.EmotionCount = (SELECT MIN(EmotionCount) 
	                                            FROM (
		                                       SELECT EmotionId, COUNT(PoemEmotion.Id) AS EmotionCount 
		                                       FROM PoemEmotion 
		                                       GROUP BY PoemEmotion.EmotionId) AS EmotionCountQuery);
--19--
SELECT TOP 1 Grade.Name, COUNT(PoemEmotion.EmotionId) AS PoemCount
FROM Poem 
JOIN Author ON Poem.AuthorId = Author.Id 
JOIN PoemEmotion ON PoemEmotion.PoemId = Poem.Id 
JOIN Emotion ON Emotion.Id = PoemEmotion.EmotionId 
JOIN Grade ON Grade.Id = Author.GradeId
WHERE Emotion.Name = 'joy' 
GROUP BY Grade.Name 
ORDER BY PoemCount DESC;

--20--
SELECT TOP 1 g.[Name], 
             COUNT(pm.EmotionId) AS PoemCount
             FROM Poem p
             JOIN Author a ON p.AuthorId = a.Id
             JOIN PoemEmotion pm ON pm.PoemId = p.Id
             JOIN Emotion e ON e.Id = pm.EmotionId
             JOIN Gender g ON g.Id = a.GenderId 
             WHERE e.[Name] = 'fear'
             GROUP BY g.[Name] 
             ORDER BY PoemCount DESC;