-- RANK TOP 10 Aprobados con empates
-- Se aprueba con 85
SELECT * FROM(
	SELECT
	DATEPART ( year , posttime ) AS 'year', 
	CASE WHEN DATEPART ( quarter , posttime )<3 THEN 1
	ELSE 2 END  AS semester,
	[username],
	[exercise], 
	points,
	RANK() OVER(PARTITION BY DATEPART ( year , posttime ), CASE WHEN DATEPART ( quarter , posttime )<3 THEN 1
	ELSE 2 END ORDER BY points DESC) AS position 
	FROM dbo.hackerranklog WHERE result='Approved'
	) AS results
WHERE results.position<=10;

-- RANK TOP 10 Aprobados sin empates

SELECT * FROM(
	SELECT
	DATEPART ( year , posttime ) AS 'year', 
	CASE WHEN DATEPART ( quarter , posttime )<3 THEN 1
	ELSE 2 END  AS semester,
	[username],
	[exercise], 
	points,
	ROW_NUMBER() OVER(PARTITION BY DATEPART ( year , posttime ), CASE WHEN DATEPART ( quarter , posttime )<3 THEN 1
	ELSE 2 END ORDER BY points DESC) AS position 
	FROM dbo.hackerranklog WHERE result='Approved'
	) AS results
WHERE results.position<=10;