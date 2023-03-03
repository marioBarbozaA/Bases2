-- Ejercicio #4: determine el ranking de los top 3 puntajes obtenidos, sacando el ranking por complejidad de los ejercicios y por cada año
SELECT *
FROM (
  SELECT YEAR(posttime) AS year, [level], username, points,
         ROW_NUMBER() OVER (PARTITION BY [level], YEAR(posttime) ORDER BY points DESC) AS userRank
  FROM dbo.hackerranklog
) AS ranked_users
WHERE userRank <= 3
ORDER BY [level], year, userRank
