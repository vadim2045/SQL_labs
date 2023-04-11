SELECT UPPER(name)
FROM cities
ORDER BY name
LIMIT 5 OFFSET 5



SELECT name AS Name, CHAR_LENGTH(name) AS Length
FROM cities
WHERE CHAR_LENGTH(name) < 8 OR
       CHAR_LENGTH(name) > 10
ORDER BY Length



SELECT SUM(population) AS Count
FROM cities
WHERE region = 'C' OR region = 'S'



SELECT SUM(population)/COUNT(population) AS AVG
FROM cities
WHERE region = 'W'



SELECT COUNT(name) AS Count_E
FROM cities
WHERE region = 'E'