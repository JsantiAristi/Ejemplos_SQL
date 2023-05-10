--seleccionar todos los registros de tienda
SELECT * FROM tienda

--seleccionar cuanto suma la antiguedad de todas las tiendas
SELECT SUM(antiguedad) FROM tienda

--seleccionar cuántas tiendas hay
SELECT COUNT(*) FROM tienda

--seleccionar la tienda con 25 años de antiguedad
SELECT * FROM tienda WHERE antiguedad = 25

--selecionar la tienda cuyo año de fundación es el 2000 (tip: usar función extract)
SELECT * FROM tienda WHERE EXTRACT(YEAR FROM fecha_creacion) = 2000

SELECT * FROM tienda WHERE EXTRACT(DAY FROM fecha_creacion) = 20

--seleccionar de todas las tiendas nombre,rut y telefono
SELECT tienda.nombre, tienda.rut, tienda_telefono.telefono FROM tienda INNER JOIN tienda_telefono ON tienda.rut=tienda_telefono.rut;

--seleccionar la tienda con el telefono 119995566
SELECT * FROM tienda INNER JOIN tienda_telefono ON tienda.rut = tienda_telefono.rut 
WHERE telefono = '119995566'

--seleccionar las tiendas que no tienen telefono
SELECT * FROM tienda LEFT JOIN tienda_telefono ON tienda.rut=tienda_telefono.rut 
WHERE tienda_telefono.telefono IS NULL

--seleccionar nombre,descripción, nombre de tienda de todos los video juegos de la tienda con rut RUT12343
SELECT juego.nombre, juego.descripcion, tienda.nombre, tienda.rut FROM tienda 
JOIN juego_tienda ON juego_tienda.rut = tienda.rut 
JOIN juego ON juego_tienda.nombre = juego.nombre WHERE tienda.rut='RUT12343';

--selecionar nombre de juego, genero y descripción del género de los juegos cuyo género es FPS
SELECT juego.nombre, genero_juego.nombre, genero_juego.descripcion FROM juego
JOIN genero_juego ON juego.nombre_genero_juego = genero_juego.nombre
WHERE juego.nombre_genero_juego = 'FPS'

--seleccionar los juegos y los detalles de juego de los juegos con el serial 123456
SELECT detalles_juego.nombre, detalles_juego.serial, detalles_juego.numero_jugadores, detalles_juego.edad_minima , juego.descripcion, juego.nombre_genero_juego FROM detalles_juego
INNER JOIN juego ON juego.nombre = detalles_juego.nombre
WHERE serial = '123456'

--seleccionar cuántos juegos por genero de juego existen (tip: group by y count())
SELECT nombre_genero_juego , COUNT(nombre_genero_juego) FROM juego 
GROUP BY nombre_genero_juego

--seleccionar los generos de juego que tienen más de un juego asociado (group by, count(), having count())
SELECT nombre_genero_juego , COUNT(nombre_genero_juego) from juego 
GROUP BY nombre_genero_juego HAVING count(nombre_genero_juego) > 1

--selecione todos los juegos y todas las tiendas, si un juego no está asociado a una tienda debe verse si una tienda no está asociada a un juego debe verse (tip: full join)
SELECT tienda.rut,tienda.nombre,juego_tienda.nombre,juego_tienda.rut,juego.descripcion,juego.nombre_genero_juego FROM tienda 
FULL JOIN juego_tienda ON juego_tienda.rut = tienda.rut 
FULL JOIN juego ON juego_tienda.nombre = juego.nombre
