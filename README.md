# Proyecto CinemExtract: Explorando el Séptimo Arte a través de Datos y Tecnología

# Introducción: 

Nuestro proyecto consiste en aplicar técnicas de análisis de datos para identificar cuáles son las películas y cortometrajes más populares y mejor valorados desde 1990 hasta la fecha, 2023, para el cliente ficticio de streaming: BHO. Dicho cliente nos presenta como objetivos mejorar la calidad de su contenido y la satisfaccion de sus usuarios.

Como equipo de trabajo tenemos el objetivo de identificar las películas y cortos más populares en la plataforma BHO, basándonos en criterios como las calificaciones, el número de visualizaciones, y las reseñas de los usuarios. Analizar la evolución de las preferencias de los usuarios a lo largo de los años y determinar las tendencias en la industria cinematográfica.

Las técnicas de extracción que hemos aplicado para desarrollar el proyecto han sido, en la primera fase, el uso de la API de MovieDatabase (https://rapidapi.com/SAdrian/api/moviesdatabase) y en una segunda, tercera y cuarta fase  mediante *scrapping* usando las herramientas *Beautiful Soup y Selenium*. 

En la quinta fase se ha diseñado una base de datos en *lenguaje SQL* y se ha extraido mediante las queries correspondientes la información necesaria para satisfacer los objetivos del proyecto. 

Todos los códigos han sido probados previamente a la fase de extracción y corregidos durante la propia fase, quedando pendiente su optimización y mejora para futuras extracciones. 


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


        FASE 3: Extracción de detalles de actores con Selenium:

    En esta fase se ha obtenido información detallada de los 10 principales actores de cada una de las peliculas extraidas en la fase 1 utilizando Selenium. Dicha información se ha obtenido de la página de IMDB.

        - Nombre
        - Año de nacimiento
        - ¿Por qué es conocido?
        - ¿Qué hace?
        - Premios

        FASE 4: Extracción de la tabla de los premios Oscar con Beautiful Soup
    
    En esta fase se trabajó con la biblioteca Beautiful Soup para extrar información relevante de la tabla de los premios Oscars desde 1990 hasta la actualidad. La tabla fue extraída del siguiente link: https://es.wikipedia.org/wiki/Premios_Óscar 
       
        - Fecha de la ceremonia
        - Mejor película
        - Mejor director
        - Mejor actor
        - Mejor actriz 

        
        FASE 5: Creación e inserción en la base de datos

    Se pensó y diseñó la estructura de la base de datos donde se insertó toda la información obtenida en las fases anteriores.
    El pasó final del proyecto fue la creación de las queries para obtener los resultados de las consultas propuestas.