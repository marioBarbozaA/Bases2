-- POR FAVOR EJECUTAR CADA ESTRACTO DE CODIGO INDIVIDUALMENTE!

-- Ejercicio #1 cuál es el ranking semestral año con año, de los 10 mejores puntajes aprobados en cada semestre para cualquier ejercicio. Genere el ranking con y sin empates.
-- RANK TOP 10 Aprobados con empates
-- Se aprueba con 85

SELECT * FROM(

	SELECT DATEPART ( year , posttime ) AS 'year', 
	CASE WHEN DATEPART ( quarter , posttime )<3 THEN 1
	ELSE 2 END  AS semester, [username], [exercise],  points,
	RANK() OVER(PARTITION BY DATEPART ( year , posttime ), CASE WHEN DATEPART ( quarter , posttime )<3 THEN 1
	ELSE 2 END ORDER BY points DESC) AS position 

	FROM dbo.hackerranklog WHERE result='Approved'

	) AS results
WHERE results.position<=10;

-- RANK TOP 10 Aprobados sin empates
GO
SELECT * FROM(
	SELECT DATEPART ( year , posttime ) AS 'year', 
	CASE WHEN DATEPART ( quarter , posttime )<3 THEN 1
	ELSE 2 END  AS semester, [username], [exercise], points,
	ROW_NUMBER() OVER(PARTITION BY DATEPART ( year , posttime ), CASE WHEN DATEPART ( quarter , posttime )<3 THEN 1
	ELSE 2 END ORDER BY points DESC) AS position 

	FROM dbo.hackerranklog WHERE result='Approved'

	) AS results
WHERE results.position<=10;

-- Ejercicio #2: clasifque a los usuarios en quintilos basándose en los puntajes obtenidos en promedio de cada usuario dentro de un mismo nivel.
-- Se espera que se creen quintilos para basic, medium y advance. Utilice solo los datos del 2022.
GO
SELECT *
	FROM (

	  SELECT  [level], username, YEAR(posttime) as anno, avg(points) as puntos,
	  ROW_NUMBER() OVER (PARTITION BY [level] ORDER BY avg(points) DESC) AS userRank

	  FROM dbo.hackerranklog

	  where YEAR(posttime) = 2022
	  group by username, [level], YEAR(posttime)
	) AS ranked_users
	WHERE userRank <= 5
	order by [level], userRank

--EJERCICIO 3: determinar si los usuarios mayormente van subiendo de nivel en el tiempo conforme avanzan en los algoritmos de una misma dificultad o no.
GO
SELECT  B.username, B.level, Mejoro
FROM (SELECT A.username,  A.level, A.Nota_Inicial, A.Nota_Final, 
       (CASE WHEN A.Nota_Inicial < A.Nota_Final THEN 1 ELSE 0 END) AS 'Mejoro'
FROM (SELECT DISTINCT h.username, h.level,
       FIRST_VALUE(h.points) OVER (PARTITION BY h.username, h.level ORDER BY h.posttime DESC) AS 'Nota_Inicial', 
       LAST_VALUE(h.points) OVER (PARTITION BY h.username, h.level ORDER BY h.posttime DESC RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS 'Nota_Final'
       FROM [dbo].[hackerranklog] h
     ) A
) B
GROUP BY B.username, B.level, Mejoro ORDER BY B.username, B.level DESC


-- Ejercicio #4: determine el ranking de los top 3 puntajes obtenidos, sacando el ranking por complejidad de los ejercicios y por cada año
GO
SELECT *
FROM (
  SELECT YEAR(posttime) AS year, [level], username, points,
  ROW_NUMBER() OVER (PARTITION BY [level], YEAR(posttime) ORDER BY points DESC) AS userRank
  FROM dbo.hackerranklog
) AS ranked_users
WHERE userRank <= 3
ORDER BY [level], year, userRank


-- Ejercicio #5

/*
Se quiere generar un pie chart porcentual basado en las duraciones de la resolución de los algoritmos,
el objetivo es visualizar solo 5 slides en el chart con su respectivo porcentaje y cantidades, 
cada slide es el porcentaje de personas que en promedio han durado cierto rango de duración considerando basic, medium y advance. 
Es importante al ver un slide del chart saber la cantidad de cada nivel que están en ese rango de duración.*/
GO
WITH duration_ranges AS (
  SELECT 
    CASE 
		WHEN duration <= 30 THEN 30
		WHEN duration <= 40 and duration > 30 THEN 40
		WHEN duration <= 50 and duration > 40 THEN 50
		WHEN duration > 50 and duration <= 55 THEN 55
		WHEN duration >55 THEN 59
	ELSE 0
		END AS 'range',
	level,
    COUNT(*) AS count,
    CUME_DIST() OVER (PARTITION BY 'range' ORDER BY COUNT(*) DESC) AS cum_dist
  FROM hackerranklog
  GROUP BY 
    CASE 
WHEN duration <= 30 THEN 30
WHEN duration <= 40 and duration > 30 THEN 40
WHEN duration <= 50 and duration > 40 THEN 50
WHEN duration > 50 and duration <= 55 THEN 55
WHEN duration >55 THEN 59
ELSE 0
    END,
    level
),
selected_ranges AS (
  SELECT range, level, count
  FROM duration_ranges
),
total_counts AS (
  SELECT level, SUM(count) AS total_count
  FROM selected_ranges
  GROUP BY level
),
percentages AS (
  SELECT selected_ranges.range, selected_ranges.level, selected_ranges.count / CAST(total_counts.total_count AS FLOAT) AS percentage,
    selected_ranges.count AS count
	FROM selected_ranges INNER JOIN total_counts ON selected_ranges.level = total_counts.level
)
SELECT 
  percentages.range, 
  SUM(CASE WHEN percentages.level = 'basic' THEN percentages.count ELSE 0 END) AS basic_count,
  SUM(CASE WHEN percentages.level = 'basic' THEN percentages.percentage ELSE 0 END) AS basic_percentage,
  SUM(CASE WHEN percentages.level = 'medium' THEN percentages.count ELSE 0 END) AS medium_count,
  SUM(CASE WHEN percentages.level = 'medium' THEN percentages.percentage ELSE 0 END) AS medium_percentage,
  SUM(CASE WHEN percentages.level = 'advance' THEN percentages.count ELSE 0 END) AS advance_count,
  SUM(CASE WHEN percentages.level = 'advance' THEN percentages.percentage ELSE 0 END) AS advance_percentage
FROM percentages
GROUP BY percentages.range
ORDER BY COUNT(*) DESC;