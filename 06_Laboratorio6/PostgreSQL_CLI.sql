/*markdown

# Laboratorio práctico: Introducción a la línea de comandos de PostgreSQL

En este laboratorio, utilizarás la interfaz de línea de comandos (CLI) de PostgreSQL para crear una base de datos y restaurar la estructura y el contenido de sus tablas. Luego, aprenderás a explorar y consultar tablas. Finalmente, aprenderás a volcar/resguardar tablas de una base de datos.

## Software utilizado en este laboratorio
En este laboratorio, utilizarás una [Base de Datos PostgreSQL](https://www.postgresql.org/). PostgreSQL es un sistema de gestión de bases de datos relacional (RDBMS) diseñado para almacenar, manipular y recuperar datos de manera eficiente.

Para completar este laboratorio, utilizarás el servicio de base de datos relacional PostgreSQL disponible como parte de IBM Skills Network Labs (SN Labs) Cloud IDE. SN Labs es un entorno de laboratorio virtual utilizado en este curso.

 ## Base de datos utilizada en este laboratorio
La base de datos Sakila utilizada en este laboratorio proviene de la siguiente fuente: https://dev.mysql.com/doc/sakila/en/ bajo Nueva licencia BSD [Copyright 2021 - Oracle Corporation].

Utilizarás una versión modificada de la base de datos para el laboratorio. Para seguir las instrucciones del laboratorio con éxito, utiliza la base de datos proporcionada por el laboratorio en lugar de la base de datos de la fuente.

El siguiente diagrama de relación de entidades (ERD) muestra la estructura del esquema de la base de datos Sakila:

![alt text](image.png)

## Objetivos
Después de completar este laboratorio, podrás utilizar la línea de comandos de PostgreSQL para:

- Crear una base de datos
- Restaurar la estructura y los datos de una tabla
- Explorar y consultar tablas
- Volcar/resguardar tablas de una base de datos

## Estructura del laboratorio
En este ejercicio, pasarás por varias subtareas donde utilizarás la interfaz de línea de comandos (CLI) de PostgreSQL para crear una base de datos y restaurar la estructura y el contenido de las tablas. Luego, aprenderás a explorar y consultar tablas. Finalmente, aprenderás a volcar/resguardar tablas de una base de datos.

## Tarea A: Crear una base de datos
Para comenzar con este laboratorio, inicia PostgreSQL utilizando el Cloud IDE. Puedes hacerlo siguiendo estos pasos:

1. Haz clic en el botón de extensión de Skills Network en el lado izquierdo de la ventana.

2. Abre el menú DATABASES y haz clic en PostgreSQL.

3. Haz clic en Create. PostgreSQL puede tardar unos momentos en iniciarse.

![alt text](image-1.png)

4. Abre una nueva terminal de comandos haciendo clic en New Terminal.

![alt text](image-2.png)

5. Copia el comando a continuación haciendo clic en el pequeño botón de copiar a la derecha del bloque de código y luego pégalo en la terminal usando Ctrl + V (Mac: ⌘ + V) para obtener el archivo sakila_pgsql_dump.sql en el Cloud IDE.

```terminal
    wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/datasets/sakila/sakila_pgsql_dump.sql
```

![alt text](image-3.png)

6. Ahora, abre la Interfaz de Línea de Comandos de PostgreSQL (CLI) haciendo clic en PostgreSQL CLI.

![alt text](image-4.png)

7. Crea una nueva base de datos llamada sakila utilizando el siguiente comando en la terminal:

```terminal
    create database sakila;
```

![alt text](image-5.png)

> Nota: Estás utilizando el comando create database para crear una nueva base de datos dentro de la CLI de PostgreSQL. Para crear una nueva base de datos llamada sakila fuera de la interfaz de línea de comandos, puedes usar el siguiente comando directamente en una ventana de terminal: createdb --username=postgres --host=postgres --password sakila después de salir de la sesión del prompt de psql con el comando \q.

## Tarea B: Restaurar la estructura y los datos de una tabla
1. Para conectarte a la nueva base de datos sakila vacía creada, utiliza el siguiente comando en la terminal e ingresa tu contraseña de sesión del servicio PostgreSQL:

```terminal
    \connect sakila;
```

![alt text](image-6.png)

2. Restaura el archivo de volcado de PostgreSQL sakila (que contiene las definiciones de las tablas y los datos de la base de datos sakila) en la nueva base de datos vacía sakila utilizando el siguiente comando en la terminal:

```terminal
\include sakila_pgsql_dump.sql;
```
![alt text](image-7.png)

> Nota: Estás utilizando el comando \include para restaurar el archivo de volcado de la base de datos dentro de la CLI de PostgreSQL. Para restaurar el archivo de volcado de la base de datos fuera de la Interfaz de Línea de Comandos, puedes usar el comando <code>pg_restore --username=postgres --host=postgres --password --dbname=sakila < sakila_pgsql_dump.tar</code> después de salir de la sesión del prompt de la CLI con el comando <code>\q.</code> Los volúmenes de formato no texto .tar se restauran utilizando el comando pg_restore. Así que, antes de usar el comando pg_restore, primero obtén la versión .tar de este archivo de volcado utilizando el comando <code>wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/datasets/sakila/sakila_pgsql_dump.tar</code>

3. Repite el Paso 1 para reconectarte a la base de datos sakila después de restaurar el archivo de volcado.

## Tarea C: Explorar y consultar tablas
1. Para listar todos los nombres de las tablas de la base de datos sakila, utiliza el siguiente comando en la terminal:

```terminal
    \dt
```
![alt text](image-8.png)

Copied!

2. Explora la estructura de la tabla store utilizando el siguiente comando en la terminal:

```terminal
    \d store;
```

3. Recupera todos los registros de la tabla store utilizando el siguiente comando en la terminal:

```terminal
    SELECT * FROM store;
```
![alt text](image-9.png)

4. Sal de la sesión del prompt de comandos de PostgreSQL utilizando el siguiente comando en la terminal.

```terminal
\q
```
Copied!

![alt text](image-10.png)


## Tarea D: Volcar/resguardar tablas de una base de datos
1. Finalmente, para volcar/resguardar la tabla store de la base de datos, utiliza el siguiente comando en la terminal e ingresa tu contraseña de sesión del servicio PostgreSQL:

```terminal
pg_dump --username=postgres --host=postgres --password --dbname=sakila --table=store --format=plain > sakila_store_pgsql_dump.sql
```

> Nota: Para solo volcar/resguardar la tabla store de la base de datos en formato no texto .tar, puedes usar el comando <code>pg_dump --username=postgres --host=postgres --password --dbname=sakila --table=store --format=tar > sakila_store_pgsql_dump.tar</code>

2. Para ver el archivo de volcado dentro de la terminal, utiliza el siguiente comando:

```terminal
    cat sakila_store_pgsql_dump.sql
```

![alt text](image-11.png)

## Conclusión
¡Felicidades! Has completado este laboratorio y ahora has aprendido a crear una base de datos, restaurar la estructura y los datos de una tabla, explorar y consultar tablas, y volcar/resguardar tablas de una base de datos.


*/