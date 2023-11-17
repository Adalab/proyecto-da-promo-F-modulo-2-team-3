--Creamos base de datos
CREATE SCHEMA BHO; 

USE BHO;

--Tabla Api
CREATE TABLE `informacion_moviedatabase`(tipo VARCHAR (25), titulo VARCHAR (100), año INT, mes INT,
genero VARCHAR (25), id VARCHAR(25),
PRIMARY KEY (id));


--Tabla Rotten tomatoes
CREATE TABLE `puntuacion_rottentomatoes` (nombre VARCHAR (25), puntuacion FLOAT)
ALTER TABLE `puntuacion_rottentomatoes` ADD PRIMARY KEY (nombre)
ALTER TABLE `puntuacion_rottentomatoes` ADD FOREIGN KEY (nombre) REFERENCES `caracteristicas_imdb` (titulo) ;


--Tabla IMDB
CREATE TABLE `caracteristicas_imdb` (id_imdb VARCHAR (25), titulo VARCHAR (100), tipo VARCHAR (25), 
director VARCHAR (250), guionistas VARCHAR (250), duracion VARCHAR (25), puntuacion FLOAT, argumento VARCHAR (370))
ALTER TABLE `caracteristicas_imdb` ADD FOREIGN KEY (id_imdb) REFERENCES `informacion_moviedatabase` (id);
ALTER TABLE `caracteristicas_imdb` ADD PRIMARY KEY (titulo);


--Tabla carateristicas actores
CREATE TABLE `datos_actores` (nombre_apellido VARCHAR (50), fecha_nacimiento VARCHAR (5), premios_oscar VARCHAR (50),
peliculas_relevantes VARCHAR (500), profesiones VARCHAR (100)); 
ALTER TABLE `datos_actores`  ADD PRIMARY KEY (nombre_apellido);

--Tabla oscars
CREATE TABLE `oscars` (ceremonia VARCHAR (5), mejor_pelicula VARCHAR (100), mejor_director VARCHAR (100),
mejor_actor VARCHAR (100), mejor_actriz VARCHAR (100), mejor_actor_reparto VARCHAR (100), mejor_actriz_reparto VARCHAR (100));
ALTER TABLE `oscars` ADD FOREIGN KEY (mejor_actor) REFERENCES `datos_actores` (nombre_apellido);
ALTER TABLE `oscars` ADD FOREIGN KEY (mejor_actriz) REFERENCES `datos_actores` (nombre_apellido);
ALTER TABLE `oscars` ADD FOREIGN KEY (mejor_actriz_reparto) REFERENCES `datos_actores` (nombre_apellido);
ALTER TABLE `oscars` ADD FOREIGN KEY (mejor_actor_reparto) REFERENCES `datos_actores` (nombre_apellido);
