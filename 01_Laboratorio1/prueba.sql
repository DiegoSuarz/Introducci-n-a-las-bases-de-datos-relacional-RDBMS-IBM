USE prueba;

/*markdown

*/

/*markdown
/**/
## Laboratorio práctico: Crear tablas y cargar datos en Datasette

En este laboratorio, aprenderás a crear tablas y cargar datos en Datasette.

## Objetivos
Después de completar este laboratorio, podrás:

- Crear y cargar datos en una tabla desde un archivo CSV
- Crear y cargar datos en una tabla desde un archivo de script SQL

## Requisitos previos
En este laboratorio, utilizarás Datasette, una herramienta de código abierto para explorar y publicar datos.

## Conjuntos de datos
PETSHOP y BookShop son los dos conjuntos de datos que utilizarás en este laboratorio.

- PETSHOP:

![alt text](image.png)

- BookShop:

![alt text](image-1.png)

## Ejercicio 1: Cargar un archivo CSV y crear una tabla usando la herramienta Datasette
En este ejercicio, aprenderás cómo cargar un archivo CSV y crear una tabla usando la herramienta Datasette.

1. Primero, selecciona Abrir herramienta, luego haz clic en el Panel de Navegación en la esquina derecha, y luego selecciona Agregar Conjuntos de Datos.

![alt text](image-2.png)

2. Serás redirigido a una página donde necesitas ingresar la URL completa del conjunto de datos [CSV](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/datasets/PET_Tables/PETSHOP.csv) en el cuadro de texto.

Haz clic derecho en el enlace PETSHOP.csv y copia la dirección del enlace. Ingresa la URL copiada en el cuadro de texto y selecciona el botón crear.

![alt text](image-3.png)

3. Los datos cargados desde el archivo CSV crearán la tabla PETSHOP. Por defecto, aparecerá una consulta SELECT relacionada con la tabla en la sección área de texto de la siguiente página web. Haz clic en Enviar Consulta para ver los resultados.

![alt text](image-4.png)

4. A continuación, modifica la consulta SELECT de la siguiente manera:

```sql
select count(*) from PETSHOP

```

Una vez que hayas completado este paso, deberías ver las cinco filas de la tabla PETSHOP.

![alt text](image-5.png)

5. Has creado y cargado con éxito la tabla PETSHOP.

*/


use  prueba;
select * from petshop;

/*markdown
## Ejercicio 2: Crear y cargar datos en la tabla utilizando un archivo de script SQL
En este ejercicio, aprenderás cómo crear y cargar datos en una tabla ejecutando un script que contiene los comandos SQL CREATE e INSERT.

1. Descarga el archivo de script en tu computadora:

[BookShop-CREATE-INSERT.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/Datasetteoptionallabs/Week2/data/BookShop-CREATE-INSERT.sql)

2. Abre el archivo de script utilizando un bloc de notas o cualquier editor de texto.
- Copia el contenido del archivo de script y pégalo en el área de texto de Datasette.
- Selecciona Enviar consulta.

![alt text](image-6.png)

3. A continuación, haz clic en el enlace inicio en la parte superior de la página.

![alt text](image-7.png)

4. Este paso te redirigirá a una página que muestra Bases de datos y Tablas.

- Selecciona la tabla BookShop en la base de datos PetShop.

v![alt text](image-8.png)

5. Podrás ver las columnas y datos de la tabla Bookshop.

![alt text](image-9.png)
*/

use  prueba;
-- Drop the tables in case they exist

DROP TABLE IF EXISTS BookShop;
DROP TABLE IF EXISTS BookShop_AuthorDetails;

-- Create the table

CREATE TABLE BookShop
(
	BOOK_ID VARCHAR(4) NOT NULL,
	TITLE VARCHAR(100) NOT NULL,
	AUTHOR_NAME VARCHAR(30) NOT NULL,
	AUTHOR_BIO VARCHAR(250),
	AUTHOR_ID INTEGER NOT NULL,
	PUBLICATION_DATE DATE NOT NULL,
	PRICE_USD DECIMAL(6,2) CHECK(Price_USD>0) NOT NULL
);

-- Insert sample data into the table

INSERT INTO BookShop
VALUES
	('B101', 'Introduction to Algorithms', 'Thomas H. Cormen', 'Thomas H. Cormen is the co-author of Introduction to Algorithms, along with Charles Leiserson, Ron Rivest, and Cliff Stein. He is a Full Professor of computer science at Dartmouth College and currently Chair of the Dartmouth College Writing Program.', 123 , '2001-09-01', 125),
	('B201', 'Structure and Interpretation of Computer Programs', 'Harold Abelson', 'Harold Abelson, Ph.D., is Class of 1922 Professor of Computer Science and Engineering in the Department of Electrical Engineering and Computer Science at MIT and a fellow of the IEEE.', 456, '1996-07-25', 65.5),
	('B301', 'Deep Learning', 'Ian Goodfellow', 'Ian J. Goodfellow is a researcher working in machine learning, currently employed at Apple Inc. as its director of machine learning in the Special Projects Group. He was previously employed as a research scientist at Google Brain.', 369, '2016-11-01', 82.7),
	('B401', 'Algorithms Unlocked', 'Thomas H. Cormen', 'Thomas H. Cormen is the co-author of Introduction to Algorithms, along with Charles Leiserson, Ron Rivest, and Cliff Stein. He is a Full Professor of computer science at Dartmouth College and currently Chair of the Dartmouth College Writing Program.', 123, '2013-05-15', 36.5),
	('B501', 'Machine Learning: A Probabilistic Perspective', 'Kevin P. Murphy', '', 157, '2012-08-24', 46);




-- Retrieve all records from the table
SELECT *
FROM BookShop;
