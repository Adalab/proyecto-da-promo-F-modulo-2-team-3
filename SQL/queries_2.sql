SELECT * FROM bho.oscars;

use bho; 

#¿QUE GENEROS HAN RECIBIDO MÁS PREMIOS OSCARS?

#Esto parece incongruente pero hay varias peliculas etiquetadas en diferentes géneros y además con diferentes tt's lo que genera multiples resultados cuando, como mucho deberían aparecer 23 resultados (1990, 2023)
SELECT
    informacion_moviedatabase.genero AS Género,
	total_peliculas_por_genero.total_pelis_por_genero AS Total_títulos
FROM
    oscars
INNER JOIN informacion_moviedatabase ON oscars.mejor_pelicula = informacion_moviedatabase.titulo
INNER JOIN (
    SELECT
        informacion_moviedatabase.genero,
        COUNT(DISTINCT oscars.mejor_pelicula) AS total_pelis_por_genero
    FROM
        oscars
    INNER JOIN informacion_moviedatabase ON oscars.mejor_pelicula = informacion_moviedatabase.titulo
    GROUP BY
        informacion_moviedatabase.genero
) total_peliculas_por_genero ON informacion_moviedatabase.genero = total_peliculas_por_genero.genero
GROUP BY
    informacion_moviedatabase.genero, total_peliculas_por_genero.total_pelis_por_genero
    ORDER BY Total_títulos DESC
    LIMIT 3;
    

#¿QUE GÉNERO ES EL MEJOR VALORADO EN IMDB?

SELECT im.genero AS Género, ROUND(AVG(ci.puntuacion),2) AS Media_puntuación
FROM informacion_moviedatabase AS im
INNER JOIN caracteristicas_imdb AS ci
ON im.id=ci.id_imdb
WHERE ci.puntuacion<> 0
GROUP BY im.genero
ORDER BY Media_puntuación DESC
LIMIT 1; 

#¿QUE GÉNERO ES EL PEOR VALORADO EN IMDB?

SELECT im.genero AS Género, ROUND(AVG(ci.puntuacion),2) AS Media_puntuación
FROM informacion_moviedatabase AS im
INNER JOIN caracteristicas_imdb AS ci
ON im.id=ci.id_imdb
WHERE ci.puntuacion<> 0
GROUP BY im.genero
ORDER BY Media_puntuación ASC
LIMIT 1; 


# ¿EN QUÉ AÑO SE ESTRENARON MÁS PELICULAS?

SELECT DISTINCT COUNT(titulo) AS Número_peliculas, año AS Año
FROM informacion_moviedatabase
WHERE tipo='Movie'
GROUP BY año
ORDER BY Número_peliculas DESC 
LIMIT 1; 

# ¿EN QUÉ AÑO SE ESTRENARON MENOS PELICULAS?

SELECT DISTINCT COUNT(titulo) AS numero_peliculas, año
FROM informacion_moviedatabase
WHERE tipo='Movie'
GROUP BY año
ORDER BY numero_peliculas ASC
LIMIT 1; 

# ¿EN QUE AÑO SE ESTRENARON MAS CORTOS?

SELECT DISTINCT COUNT(titulo) AS Número_cortos, año AS Año
FROM informacion_moviedatabase
WHERE tipo='Short'
GROUP BY año
ORDER BY Número_cortos DESC 
LIMIT 1; 

# ¿EN QUÉ AÑO SE ESTRENARON MENOS CORTOS?

SELECT DISTINCT COUNT(titulo) AS numero_peliculas, año
FROM informacion_moviedatabase
WHERE tipo='Short'
GROUP BY año
ORDER BY numero_peliculas ASC
LIMIT 1; 

# ¿CUÁL ES LA PELÍCULA MEJOR VALORADA EN IMDB?

SELECT titulo, puntuacion
FROM caracteristicas_imdb
WHERE tipo= "Movie"
ORDER BY puntuacion DESC
LIMIT 1;

# ¿CUÁL ES EL CORTO MEJOR VALORADO EN IMDB?

SELECT titulo, puntuacion
FROM caracteristicas_imdb
WHERE tipo= "Short"
ORDER BY puntuacion DESC
LIMIT 1;

# ¿QUÉ ACTOR/ACTRIZ HA RECIBIDO MÁS PREMIOS ÓSCAR?

#ACTOR 

SELECT
  Actor,
  SUM(Numero_oscars) AS Total_oscars
FROM (
  SELECT CONCAT_WS(' ', mejor_actor_reparto, '') AS actor, COUNT(*) AS Numero_oscars
  FROM oscars
  WHERE mejor_actor_reparto IS NOT NULL
  GROUP BY actor

  UNION ALL

  SELECT CONCAT_WS(' ', mejor_actor, '') AS actor, COUNT(*) AS Numero_oscars
  FROM oscars
  WHERE mejor_actor IS NOT NULL
  GROUP BY actor
) AS subquery
GROUP BY Actor
ORDER BY Total_oscars DESC
limit 3;

#ACTRIZ

SELECT
  Actriz,
  SUM(Numero_oscars) AS Total_oscars
FROM (
  SELECT CONCAT_WS(' ', mejor_actriz_reparto, '') AS Actriz, COUNT(*) AS Numero_oscars
  FROM oscars
  WHERE mejor_actriz_reparto IS NOT NULL AND mejor_actriz_reparto <> 'Sin datos'
  GROUP BY actriz

  UNION ALL

  SELECT CONCAT_WS(' ', mejor_actriz, '') AS Actriz, COUNT(*) AS Numero_oscars
  FROM oscars
  WHERE mejor_actriz IS NOT NULL
  GROUP BY Actriz
) AS subquery
GROUP BY actriz
ORDER BY Total_oscars DESC
LIMIT 3;


# ¿QUÉ ACTOR/ACTRIZ HA RECIBIDO MÁS PREMIOS ÓSCAR? (Según nuestra muestra)
 
 #ACTOR
 
SELECT
  Actor,
  SUM(Numero_oscars) AS Total_oscars
  
FROM (
  SELECT CONCAT_WS(' ', mejor_actor_reparto, '') AS actor, COUNT(*) AS Numero_oscars
  FROM oscars
  WHERE mejor_actor_reparto IS NOT NULL AND ceremonia BETWEEN 1990 AND 2023
  GROUP BY Actor

  UNION ALL

  SELECT CONCAT_WS(' ', mejor_actor, '') AS actor, COUNT(*) AS Numero_oscars
  FROM oscars
  WHERE mejor_actor IS NOT NULL AND ceremonia BETWEEN 1990 AND 2023
  GROUP BY Actor
) AS subquery
GROUP BY Actor
ORDER BY Total_oscars DESC
LIMIT 1;

#ACTRIZ

SELECT
  Actriz,
  SUM(Numero_oscars) AS Total_oscars
FROM (
  SELECT CONCAT_WS(' ', mejor_actriz_reparto, '') AS Actriz, COUNT(*) AS Numero_oscars
  FROM oscars
  WHERE mejor_actriz_reparto IS NOT NULL AND ceremonia BETWEEN 1990 AND 2023 
  GROUP BY Actriz

  UNION ALL

  SELECT CONCAT_WS(' ', mejor_actriz, '') AS Actriz, COUNT(*) AS Numero_oscars
  FROM oscars
  WHERE mejor_actriz IS NOT NULL AND ceremonia BETWEEN 1990 AND 2023
  GROUP BY Actriz
) AS subquery
GROUP BY Actriz
ORDER BY Total_oscars DESC
LIMIT 1;


