# Proyecto CinemExtract: Explorando el Séptimo Arte a través de Datos y Tecnología

# Introducción: 

Nuestro proyecto consiste en aplicar técnicas de análisis de datos para identificar cuáles son las películas y cortometrajes más populares y mejor valorados desde 1990 hasta la fecha para un cliente ficticio de streaming: BHO. 

Las técnicas aplicadas de extracción utilizadas han sido el uso de la API de MovieDatabase (https://rapidapi.com/SAdrian/api/moviesdatabase) en una primera fase y en una segunda, tercera y cuarta fase mediante *scrapping* usando Beautiful Soup y Selenium. 

En una quinta fase se ha elaborado una base de datos en lenguaje SQL y extraido mediante las queries correspondientes la información necesaria para satisfacer los objetivos del proyecto. 

Todos los códigos han sido probados previamente a la fase de extracción y corregidos durante la propia fase de extracción de datos quedando pendiente su optimización y mejora para futuras extracciones. 


# Funciones

Se han definido 5 funciones para la extracción de datos y su ejecución en las diferentes fases del proyecto: 

        FASE 1: Extracción de Datos de API de MoviesDataset: 

    En esta fase se ha realizado la extracción de información de peliculas y cortos de entre 1990-2023. La extracción se ha realizado a través de la API de MovieDataset. 
    La información obtenida ha sido la siguiente:
     
        - Tipo (si es corto o película).
        - Nombre de la película o el corto.
        - Año de estreno de la película o corto.
        - Mes de estreno de la película o corto.
        - Id de la película (Identificativo de IMDB)
        - Género: Drama, Comedy, Action, Fantasy, Horror, Mystery, Romance, Thriller.

        FASE 2:Extracción de Detalles de Películas con Selenium: 

    En esta fase se ha obtenido información de las peliculas y cortos extraidos de la FASE 1. Mediante la ténica Selenium se ha obtenido la siguiente información de las páginas IMDB y Rotten Tomatoes: 

        - Puntuacion de IMDB (en caso de que la tenga).
        - Puntuación de Rotten Tomatoes (Tomatometer).
        - Dirección (director/a o directore/as de cada película).
        - Gionistas (de cada película).
        - Argumento.
        - Duración (en minutos).
        - Nombre de la película.