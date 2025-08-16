/*markdown
# Laboratorio Práctico: Normalización, Claves y Restricciones en Bases de Datos Relacionales
*/

/*markdown
## Instrucciones
En este laboratorio, explorarás la normalización, las claves y las restricciones en Datasette. Inicialmente, aprenderás a minimizar la redundancia y la inconsistencia de datos en una base de datos normalizando tablas. A continuación, aprenderás a usar claves para identificar de manera única un registro en una tabla, establecer una relación entre tablas e identificar la relación entre ellas. Finalmente, aprenderás sobre los diferentes tipos de restricciones del modelo relacional que ayudan a mantener la integridad de los datos en un modelo de datos relacional.

## Objetivos
Después de completar este laboratorio, podrás:

- Minimizar la redundancia y la inconsistencia de datos en una base de datos utilizando la normalización.
- Usar claves para identificar de manera única un registro en una tabla, establecer una relación entre tablas e identificar la relación entre ellas.
- Mantener la integridad de los datos en un modelo de datos relacional utilizando restricciones.


## Requisitos Previos
Software Utilizado en este Laboratorio

En este laboratorio, utilizarás Datasette , una herramienta multiuso de código abierto para explorar y publicar datos.

## Conjunto de datos utilizado en este Laboratorio
En este laboratorio, utilizarás un conjunto de datos de BookShop.


*/

/*markdown
# Ejercicio 1: Normalización
En este ejercicio, aprenderás sobre la primera forma normal (1NF) e implementarás la segunda forma normal (2NF).

## Tarea A: Primera forma normal (1NF)
En esta tarea de normalización, trabajarás con la tabla BookShop. La siguiente imagen muestra la tabla BookShop:

![alt text](image.png)
*/

/*markdown
Responderás algunas preguntas para determinar si la tabla anterior está en 1NF.

1. ¿La tabla anterior tiene filas únicas?

<details><summary>Pista</summary>
    Verifica si puedes identificar de manera única cada fila.
</details>


<details><summary>Respuesta</summary>
    Sí, puedes identificar de manera única cada fila.
</details>

2. ¿Cada celda de la tabla anterior tiene un valor único/atómico?

<details><summary>Pista</summary>
    Un valor único/atómico no puede ser dividido y no incluye ningún carácter delimitador.

</details>


<details><summary>Respuesta</summary>
    No. Las columnas AUTHOR_NAME y AUTHOR_ID contienen celdas con múltiples valores.

</details>

3. Por definición, una tabla está en 1NF si cada atributo en esa relación contiene datos de valor único y cada tupla en esa relación es única. ¿La tabla anterior está en primera forma normal?

<details><summary>Pista</summary>
    Sigue la definición de 1NF mencionada anteriormente. Tu respuesta a esta pregunta debe basarse en las respuestas de las dos preguntas anteriores.

</details>


<details><summary>Respuesta</summary>
   No, la tabla no está en 1NF ya que tiene filas únicas pero no todas las celdas son de valor único.

</details>

4. Si tu respuesta a la pregunta 3 es No, ¿cómo puedes normalizar la tabla para asegurar la primera forma normal?

<details><summary>Pista</summary>
    Mira el video sobre Normalización.
</details>


<details><summary>Respuesta</summary>
   Para normalizar esta tabla, añade una fila extra y separa los nombres de autores múltiples así como los ID de autores múltiples de la fila que contiene datos con múltiples valores en su propia fila.
</details>

*/

/*markdown
## Tarea B: Segunda forma normal (2NF)
1. Descarga el script BookShop-CREATE-INSERT.sql a continuación, cópialo y pégalo en el laboratorio de Datasette, y ejecútalo. El script eliminará cualquier tabla BookShop anterior que exista, creará la nueva tabla BookShop y la poblará con los datos de muestra requeridos para este laboratorio.

![alt text](image-1.png)

- [BookShop-CREATE-INSERT.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/Datasetteoptionallabs/Week2/data/BookShop-CREATE-INSERT.sql)



<details><summary>Haz clic aquí para ver las consultas dentro del script</summary>
    ```sql

    -- Eliminar las tablas en caso de que existan

    DROP TABLE IF EXISTS BookShop;
    DROP TABLE IF EXISTS BookShop_AuthorDetails;

    -- Crear la tabla

    CREATE TABLE BookShop (
        BOOK_ID VARCHAR(4) NOT NULL, 
        TITLE VARCHAR(100) NOT NULL, 
        AUTHOR_NAME VARCHAR(30) NOT NULL, 
        AUTHOR_BIO VARCHAR(250),
        AUTHOR_ID INTEGER NOT NULL, 
        PUBLICATION_DATE DATE NOT NULL, 
        PRICE_USD DECIMAL(6,2) CHECK(Price_USD>0) NOT NULL
        );

    -- Insertar datos de muestra en la tabla

    INSERT INTO BookShop VALUES
    ('B101', 'Introduction to Algorithms', 'Thomas H. Cormen', 'Thomas H. Cormen es coautor de Introduction to Algorithms, junto con Charles Leiserson, Ron Rivest y Cliff Stein. Es profesor titular de ciencias de la computación en Dartmouth College y actualmente presidente del Programa de Escritura de Dartmouth College.', 123 , '2001-09-01', 125),
    ('B201', 'Structure and Interpretation of Computer Programs', 'Harold Abelson', ' Harold Abelson, Ph.D., es profesor de ciencias de la computación e ingeniería en el Departamento de Ingeniería Eléctrica y Ciencias de la Computación del MIT y miembro del IEEE.', 456, '1996-07-25', 65.5),
    ('B301', 'Deep Learning', 'Ian Goodfellow', 'Ian J. Goodfellow es un investigador que trabaja en aprendizaje automático, actualmente empleado en Apple Inc. como director de aprendizaje automático en el Grupo de Proyectos Especiales. Anteriormente trabajó como científico investigador en Google Brain.', 369, '2016-11-01', 82.7),
    ('B401', 'Algorithms Unlocked', 'Thomas H. Cormen', 'Thomas H. Cormen es coautor de Introduction to Algorithms, junto con Charles Leiserson, Ron Rivest y Cliff Stein. Es profesor titular de ciencias de la computación en Dartmouth College y actualmente presidente del Programa de Escritura de Dartmouth College.', 123, '2013-05-15', 36.5),
    ('B501', 'Machine Learning: A Probabilistic Perspective', 'Kevin P. Murphy', '', 157, '2012-08-24', 46);

    -- Recuperar todos los registros de la tabla

    SELECT * FROM BookShop;
    ```
</details>


**Consejo**: Si no estás seguro de cómo subir y ejecutar el script en Datasette, sigue los pasos dados:

- Descarga el archivo del script a tu computadora:

    BookShop-CREATE-INSERT.sql


- Abre el archivo del script usando Notepad o cualquier editor de texto.
- Copia el contenido del archivo script y pégalo en el área de texto de datasette.
- Haz clic en el botón Enviar consulta.
- Las consultas se ejecutan.

![alt text](image-2.png)
![alt text](image-3.png)


*/

-- Drop the tables in case they exist
USE prueba;

DROP TABLE IF EXISTS BookShop;
DROP TABLE IF EXISTS BookShop_AuthorDetails;

-- Create the table

CREATE TABLE BookShop (
	BOOK_ID VARCHAR(4) NOT NULL, 
	TITLE VARCHAR(100) NOT NULL, 
	AUTHOR_NAME VARCHAR(30) NOT NULL, 
	AUTHOR_BIO VARCHAR(300),
	AUTHOR_ID INTEGER NOT NULL, 
	PUBLICATION_DATE DATE NOT NULL, 
	PRICE_USD DECIMAL(6,2) CHECK(Price_USD>0) NOT NULL
	);

-- Insert sample data into the table

INSERT INTO BookShop VALUES
('B101', 'Introduction to Algorithms', 'Thomas H. Cormen', 'Thomas H. Cormen is the co-author of Introduction to Algorithms, along with Charles Leiserson, Ron Rivest, and Cliff Stein. He is a Full Professor of computer science at Dartmouth College and currently Chair of the Dartmouth College Writing Program.', 123 , '2001-09-01', 125),
('B201', 'Structure and Interpretation of Computer Programs', 'Harold Abelson', 'Harold Abelson, Ph.D., is Class of 1922 Professor of Computer Science and Engineering in the Department of Electrical Engineering and Computer Science at MIT and a fellow of the IEEE.', 456, '1996-07-25', 65.5),
('B301', 'Deep Learning', 'Ian Goodfellow', 'Ian J. Goodfellow is a researcher working in machine learning, currently employed at Apple Inc. as its director of machine learning in the Special Projects Group. He was previously employed as a research scientist at Google Brain.', 369, '2016-11-01', 82.7),
('B401', 'Algorithms Unlocked', 'Thomas H. Cormen', 'Thomas H. Cormen is the co-author of Introduction to Algorithms, along with Charles Leiserson, Ron Rivest, and Cliff Stein. He is a Full Professor of computer science at Dartmouth College and currently Chair of the Dartmouth College Writing Program.', 123, '2013-05-15', 36.5),
('B501', 'Machine Learning: A Probabilistic Perspective', 'Kevin P. Murphy', '', 157, '2012-08-24', 46);

-- Retrieve all records from the table

SELECT * FROM BookShop;


/*markdown
2. Por definición, una relación está en segunda forma normal si ya está en 1NF y no contiene dependencias parciales. Si miras la tabla BookShop, encontrarás que cada columna en la tabla tiene un valor único o atómico, pero tiene múltiples libros del mismo autor. Esto significa que los detalles de AUTHOR_ID, AUTHOR_NAME y AUTHOR_BIO para BOOK_ID B101 y B401 son los mismos. A medida que aumenta el número de filas en la tabla, estarás almacenando innecesariamente más y más ocurrencias de esta misma información. Y si un autor actualiza su biografía, debes actualizar todas estas ocurrencias.

![alt text](image-4.png)
*/

/*markdown
3. En este escenario, para hacer cumplir la 2NF puedes sacar la información del autor, como AUTHOR_ID, AUTHOR_NAME y AUTHOR_BIO de la tabla BookShop a otra tabla, por ejemplo, una tabla llamada BookShop_AuthorDetails. Luego vinculas cada libro en la tabla BookShop a la fila relevante en la tabla BookShop_AuthorDetails, utilizando una columna común única como AUTHOR_ID para vincular las tablas. Para crear la nueva tabla BookShop_AuthorDetails, copia el código a continuación y pégalo en el área de texto de datasette. Haz clic en el botón Enviar consulta.

```sql
CREATE TABLE BookShop_AuthorDetails
(AUTHOR_ID INTEGER NOT NULL,AUTHOR_NAME VARCHAR(30) NOT NULL,
 AUTHOR_BIO VARCHAR(250),PRIMARY KEY (AUTHOR_ID)) ;

-----Insertar los registros de Bookshop en esta tabla.

insert into BookShop_AuthorDetails select DISTINCT AUTHOR_ID, AUTHOR_NAME, AUTHOR_BIO FROM BookShop;

select * from BookShop_AuthorDetails;
```


![alt text](image-5.png)
*/

/*Eliminar la tabla si existe*/
DROP TABLE IF EXISTS BookShop_AuthorDetails;

/*crear la tabla BookShop_AuthorDetails*/
CREATE TABLE BookShop_AuthorDetails
(
    AUTHOR_ID INTEGER NOT NULL,AUTHOR_NAME VARCHAR(30) NOT NULL,
    AUTHOR_BIO VARCHAR(300),PRIMARY KEY (AUTHOR_ID)
);


/*Insertar valores de las columnas AUTHOR_ID, AUTHOR_NAME, AUTHOR_BIO traidos de la tabla BookShop*/
insert into BookShop_AuthorDetails select DISTINCT AUTHOR_ID, AUTHOR_NAME, AUTHOR_BIO FROM BookShop;


select * from BookShop_AuthorDetails;

/*markdown
4. Ahora solo estás almacenando la información del autor una vez por autor y solo tienes que actualizarla en un lugar; reduciendo la redundancia y aumentando la consistencia de los datos. Así se asegura la 2NF.

![alt text](image-6.png)

![alt text](image-7.png)

*/

/*markdown
# Ejercicio 2: Claves

En este ejercicio, aprenderás cómo utilizar una clave primaria para identificar de manera única los registros en una tabla, usar una clave foránea para establecer relaciones entre tablas y discernir las relaciones entre ellas.

## Tarea A: Clave Primaria
1. Por definición, una clave primaria es una columna o grupo de columnas que identifican de manera única cada fila en una tabla. Una tabla no puede tener más de una clave primaria. Las reglas para definir una clave primaria incluyen:

- No puede haber dos filas con un valor de clave primaria duplicado.
- Cada fila debe tener un valor de clave primaria.
- Ningún campo de clave primaria puede ser nulo.

2. Para identificar de manera única cada fila en las tablas BookShop y BookShop_AuthorDetails, crearás una clave primaria. Establece la columna BOOK_ID de la tabla BookShop y la columna AUTHOR_ID de la tabla BookShop_AuthorDetails como claves primarias para sus respectivas tablas. Ambas columnas se declararon como NOT NULL cuando se crearon las tablas (verifica esto en el script SQL o en la definición de la tabla). La tabla BookShop_AuthorDetails hereda los tipos de datos y las restricciones de columna, incluyendo NOT NULL, de la tabla padre BookShop).

3. Para establecer la columna BOOK_ID de la tabla BookShop como clave primaria para cada una de las tablas, copia el código a continuación y pégalo en el área de texto de datasette. Haz clic en el botón Enviar consulta.


```sql
--Eliminar la tabla.

DROP TABLE IF EXISTS BookShop;

-----Recrearla con Clave Primaria -------

CREATE TABLE BookShop (
 BOOK_ID VARCHAR(4) NOT NULL, 
 TITLE VARCHAR(100) NOT NULL, 
 AUTHOR_NAME VARCHAR(30) NOT NULL, 
 AUTHOR_BIO VARCHAR(250),
 AUTHOR_ID INTEGER NOT NULL, 
 PUBLICATION_DATE DATE NOT NULL, 
 PRICE_USD DECIMAL(6,2) CHECK(Price_USD>0) NOT NULL,PRIMARY KEY (BOOK_ID));

INSERT INTO BookShop VALUES
('B101', 'Introducción a los Algoritmos', 'Thomas H. Cormen', 'Thomas H. Cormen es coautor de Introducción a los Algoritmos, junto con Charles Leiserson, Ron Rivest y Cliff Stein. Es profesor titular de ciencias de la computación en Dartmouth College y actualmente es el presidente del Programa de Escritura de Dartmouth College.', 123 , '2001-09-01', 125),
('B201', 'Estructura e Interpretación de Programas de Computadora', 'Harold Abelson', 'Harold Abelson, Ph.D., es profesor de ciencias de la computación e ingeniería en el Departamento de Ingeniería Eléctrica y Ciencias de la Computación en MIT y miembro del IEEE.', 456, '1996-07-25', 65.5),
('B301', 'Deep Learning', 'Ian Goodfellow', 'Ian J. Goodfellow es un investigador que trabaja en aprendizaje automático, actualmente empleado en Apple Inc. como director de aprendizaje automático en el Grupo de Proyectos Especiales. Anteriormente fue científico investigador en Google Brain.', 369, '2016-11-01', 82.7),
('B401', 'Algoritmos Desbloqueados', 'Thomas H. Cormen', 'Thomas H. Cormen es coautor de Introducción a los Algoritmos, junto con Charles Leiserson, Ron Rivest y Cliff Stein. Es profesor titular de ciencias de la computación en Dartmouth College y actualmente es el presidente del Programa de Escritura de Dartmouth College.', 123, '2013-05-15', 36.5),
('B501', 'Machine Learning: A Probabilistic Perspective', 'Kevin P. Murphy', '', 157, '2012-08-24', 46);

-- Recuperar todos los registros de la tabla

SELECT * FROM BookShop;
```


![alt text](image-8.png)
*/


/*Eliminar la tabla si existe*/
DROP TABLE IF EXISTS BookShop;  

/*Recrear la tabla incluyendo la clave primaria*/
CREATE TABLE BookShop 
(  
    BOOK_ID VARCHAR(4) NOT NULL, 
    TITLE VARCHAR(100) NOT NULL, 
    AUTHOR_NAME VARCHAR(30) NOT NULL, 
    AUTHOR_BIO VARCHAR(300),
    AUTHOR_ID INTEGER NOT NULL, 
    PUBLICATION_DATE DATE NOT NULL, 
    PRICE_USD DECIMAL(6,2) CHECK(Price_USD>0) NOT NULL,PRIMARY KEY (BOOK_ID)
);

/*Insertar valores a la tabla*/
INSERT INTO BookShop VALUES
('B101', 'Introducción a los Algoritmos', 'Thomas H. Cormen', 'Thomas H. Cormen es coautor de Introducción a los Algoritmos, junto con Charles Leiserson, Ron Rivest y Cliff Stein. Es profesor titular de ciencias de la computación en Dartmouth College y actualmente es el presidente del Programa de Escritura de Dartmouth College.', 123 , '2001-09-01', 125),
('B201', 'Estructura e Interpretación de Programas de Computadora', 'Harold Abelson', 'Harold Abelson, Ph.D., es profesor de ciencias de la computación e ingeniería en el Departamento de Ingeniería Eléctrica y Ciencias de la Computación en MIT y miembro del IEEE.', 456, '1996-07-25', 65.5),
('B301', 'Deep Learning', 'Ian Goodfellow', 'Ian J. Goodfellow es un investigador que trabaja en aprendizaje automático, actualmente empleado en Apple Inc. como director de aprendizaje automático en el Grupo de Proyectos Especiales. Anteriormente fue científico investigador en Google Brain.', 369, '2016-11-01', 82.7),
('B401', 'Algoritmos Desbloqueados', 'Thomas H. Cormen', 'Thomas H. Cormen es coautor de Introducción a los Algoritmos, junto con Charles Leiserson, Ron Rivest y Cliff Stein. Es profesor titular de ciencias de la computación en Dartmouth College y actualmente es el presidente del Programa de Escritura de Dartmouth College.', 123, '2013-05-15', 36.5),
('B501', 'Machine Learning: A Probabilistic Perspective', 'Kevin P. Murphy', '', 157, '2012-08-24', 46);

SELECT * FROM BookShop;     

/*markdown
4. Para establecer la columna AUTHOR_ID de la tabla BookShop_AuthorDetails como clave primaria para cada una de las tablas, copia el código a continuación y pégalo en el área de texto de datasette. Haz clic en el botón Enviar consulta.

```sql

--Eliminar la tabla.

DROP TABLE IF EXISTS BookShop_AuthorDetails;

-----Recrear otra tabla BookShop_AuthorDetails con el id del autor como clave primaria

CREATE TABLE BookShop_AuthorDetails(AUTHOR_ID INTEGER NOT NULL,AUTHOR_NAME VARCHAR(30) NOT NULL,AUTHOR_BIO VARCHAR(250),PRIMARY KEY (AUTHOR_ID)) ;

-----Insertar los registros de Bookshop en esta tabla.

insert into BookShop_AuthorDetails select DISTINCT AUTHOR_ID, AUTHOR_NAME, AUTHOR_BIO FROM BookShop;

select * from BookShop_AuthorDetails;
```

![alt text](image-9.png)
*/

        

DROP TABLE IF EXISTS BookShop_AuthorDetails; /*eliminar tabla*/


/*Recrear otra tabla BookShop_AuthorDetails con el id del autor como clave primaria*/
CREATE TABLE BookShop_AuthorDetails
(
    AUTHOR_ID INTEGER NOT NULL,
    AUTHOR_NAME VARCHAR(30) NOT NULL,
    AUTHOR_BIO VARCHAR(300),
    PRIMARY KEY (AUTHOR_ID)
); 

/*Insertar los registros de Bookshop en esta tabla.*/
insert into BookShop_AuthorDetails select DISTINCT AUTHOR_ID, AUTHOR_NAME, AUTHOR_BIO FROM BookShop;

select * from BookShop_AuthorDetails;

/*markdown
5. Después de agregar la clave primaria, intentemos agregar el mismo registro en la tabla BookShop, copia el código a continuación y pégalo en el área de texto de datasette. Haz clic en el botón Enviar consulta.

```sql
INSERT INTO BookShop VALUES
('B101', 'Introducción a los Algoritmos', 'Thomas H. Cormen', 'Thomas H. Cormen es coautor de Introducción a los Algoritmos, junto con Charles Leiserson, Ron Rivest y Cliff Stein. Es profesor titular de ciencias de la computación en Dartmouth College y actualmente es el presidente del Programa de Escritura de Dartmouth College.', 123 , '2001-09-01', 125)

---Recibirás una violación de restricción única.

select * from BookShop;

```

![alt text](image-10.png)
*/

INSERT INTO BookShop VALUES
('B101', 'Introducción a los Algoritmos', 'Thomas H. Cormen', 'Thomas H. Cormen es coautor de Introducción a los Algoritmos, junto con Charles Leiserson, Ron Rivest y Cliff Stein. Es profesor titular de ciencias de la computación en Dartmouth College y actualmente es el presidente del Programa de Escritura de Dartmouth College.', 123 , '2001-09-01', 125)

/*Recibirás una violación de restricción única.*/

/*markdown
6. Ahora puedes usar la columna BOOK_ID para identificar de manera única cada fila en la tabla BookShop y la columna AUTHOR_ID para identificar de manera única cada fila en la tabla BookShop_AuthorDetails.
*/

/*markdown
## Tarea B: Clave Foránea
1. Por definición, una clave foránea es una columna que establece una relación entre dos tablas. Actúa como una referencia cruzada entre dos tablas porque apunta a la clave primaria de otra tabla. Una tabla puede tener múltiples claves foráneas que hacen referencia a claves primarias de otras tablas. Reglas para definir una clave foránea:

- Una clave foránea en la tabla de referencia debe coincidir con la estructura y el tipo de datos de la clave primaria existente en la tabla referenciada.
- Una clave foránea solo puede tener valores presentes en la clave primaria referenciada.
- Las claves foráneas no necesitan ser únicas. La mayoría de las veces no lo son.
- Las claves foráneas pueden ser nulas.

2. Para crear una clave foránea para la tabla BookShop, establece su columna AUTHOR_ID como una clave foránea, para establecer una relación entre las tablas BookShop y BookShop_AuthorDetails. Copia el código a continuación y pégalo en el área de texto de datasette. Haz clic en el botón Enviar consulta.

```sql
-----Adición de clave foránea en bookshop

DROP TABLE IF EXISTS BookShop;

CREATE TABLE BookShop (
 BOOK_ID VARCHAR(4) NOT NULL, 
 TITLE VARCHAR(100) NOT NULL, 
 AUTHOR_NAME VARCHAR(30) NOT NULL, 
 AUTHOR_BIO VARCHAR(250),
 AUTHOR_ID INTEGER NOT NULL, 
 PUBLICATION_DATE DATE NOT NULL, 
 PRICE_USD DECIMAL(6,2) CHECK(Price_USD>0) NOT NULL,PRIMARY KEY (BOOK_ID),
FOREIGN KEY (AUTHOR_ID)
REFERENCES BookShop_AuthorDetails(AUTHOR_ID)
ON UPDATE NO ACTION
ON DELETE NO ACTION);
```


> Nota: La cláusula ON DELETE junto con la clave foránea se utiliza para configurar las acciones que ocurren al eliminar filas de la tabla de referencia. ON UPDATE junto con la clave foránea se utilizan para realizar las acciones establecidas al modificar los valores de clave de referencia de filas existentes.

> NO ACTION simplemente significa que cuando una clave padre se actualiza, modifica o elimina de la base de datos, no se tomará ninguna acción especial.

> Si la acción configurada se establece en RESTRICT, entonces la aplicación está prohibida de eliminar y modificar una clave padre donde ya hay una o más claves hijo presentes.

> Al configurar la acción en SET NULL cuando se elimina o actualiza una clave padre, la columna de todas las claves hijo que están mapeadas a la clave padre se establecerá para contener valores NULL en SQL.

> SET DEFAULT es similar a SET NULL, excepto que las columnas de las claves hijo se establecerán para contener un valor predeterminado en lugar de nulo.

![alt text](image-11.png)

3. Ahora que has creado la relación, cada libro en la tabla BookShop está vinculado a la fila relevante en la tabla BookShop_AuthorDetails a través de AUTHOR_ID.
*/

/*markdown
## Ejercicio 3: Restricciones
En este ejercicio, revisarás diferentes tipos de restricciones del modelo relacional que son cruciales para mantener la integridad de los datos en un modelo de datos relacional.

1. **Restricción de Integridad de Entidad**: La integridad de entidad asegura que no existan registros duplicados dentro de una tabla y que la columna que identifica cada registro dentro de la tabla no sea un duplicado ni nula. La existencia de una clave primaria en las tablas BookShop y BookShop_AuthorDetails satisface esta restricción de integridad porque una clave primaria impone la restricción NOT NULL y asegura que cada fila en la tabla tenga un valor que denote de manera única la fila.

2. **Restricción de Integridad Referencial**: La integridad referencial asegura la existencia de un valor referenciado si un valor de una columna de una tabla hace referencia a un valor de otra columna. La existencia de la clave foránea (AUTHOR_ID) en la tabla BookShop satisface esta restricción de integridad porque existe una relación de referencia cruzada entre las tablas BookShop y BookShop_AuthorDetails. Como resultado de esta relación, cada libro en la tabla BookShop está vinculado a la fila relevante en la tabla BookShop_AuthorDetails a través de las columnas AUTHOR_ID.

3. **Restricción de Integridad de Dominio**: La integridad de dominio asegura la claridad del propósito de la columna y la consistencia de los valores válidos. La tabla BookShop se adhiere a esta restricción a través de la especificación de tipos de datos, longitud, formato de fecha, restricciones de verificación y restricciones nulas en su declaración CREATE. Este enfoque integral garantiza que los valores en cada columna no solo sean válidos, sino que también se ajusten a las restricciones de dominio especificadas.

![alt text](image-12.png)
*/