/*markdown
# Laboratorio Práctico: Introducción a la Línea de Comando de MySQL

En este laboratorio, utilizarás la interfaz de línea de comando (CLI) de MySQL para crear una base de datos, restaurar la estructura y el contenido de las tablas, explorar y consultar tablas, y finalmente, aprender cómo volcar/resguardar tablas de la base de datos.

## Objetivos
Después de completar este laboratorio, podrás utilizar la línea de comando de MySQL para:

- Crear una base de datos.
- Restaurar la estructura y los datos de una tabla.
- Explorar y consultar tablas.
- Volcar/resguardar tablas de una base de datos.

## Software Utilizado en este Laboratorio
En este laboratorio, utilizarás MySQL. MySQL es un Sistema de Gestión de Bases de Datos Relacional (RDBMS) diseñado para almacenar, manipular y recuperar datos de manera eficiente.

Para completar este laboratorio, utilizarás el servicio de base de datos relacional MySQL disponible como parte de los Laboratorios de la Red de Habilidades de IBM (SN Labs) en el IDE de la nube. SN Labs es un entorno de laboratorio virtual utilizado en este curso.

## Base de Datos Utilizada en este Laboratorio
La base de datos Sakila utilizada en este laboratorio proviene de la siguiente fuente: https://dev.mysql.com/doc/sakila/en/ bajo la Nueva licencia BSD [Copyright 2021 - Oracle Corporation].

Utilizarás una versión modificada de la base de datos para el laboratorio, así que para seguir las instrucciones del laboratorio con éxito, por favor utiliza la base de datos proporcionada con el laboratorio, en lugar de la base de datos de la fuente original.

El siguiente diagrama de relación de entidad (ERD) muestra el esquema de la base de datos Sakila:

![alt text](image.png)

## Tarea A: Crear una base de datos
1. Ve a Terminal > Nuevo Terminal para abrir un terminal desde el Cloud IDE lanzado lado a lado.

![alt text](image-1.png)

2. Copia el comando a continuación haciendo clic en el pequeño botón de copiar en la parte inferior derecha del bloque de código y luego pégalo en el terminal usando Ctrl + V (Mac: ⌘ + V) para recuperar el archivo [sakila_mysql_dump.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/datasets/sakila/sakila_mysql_dump.sql) al Cloud IDE.

```terminal
    wget https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/datasets/sakila/sakila_mysql_dump.sql
```

![alt text](image-2.png)

3. Inicia la sesión del servicio MySQL usando la directiva <code>Start MySQL in IDE button</code>.

Open MySQL Page in IDE

Si el ícono no inicia la base de datos MySQL, sigue los pasos a continuación.

- Haz clic en el botón de extensión de Skills Network en el lado izquierdo de la ventana.

- Abre el menú DATABASES y haz clic en MySQL.

- Haz clic en Crear. MySQL puede tardar unos momentos en iniciarse.

![alt text](image-3.png)

5. Inicia la sesión del símbolo de comando mysql usando el comando a continuación en el terminal:

```terminal
    mysql --host=mysql --port=3306 --user=root --password
```

Cuando se te pida, ingresa la contraseña que se mostró en la sección Información de Conexión cuando MySQL se inició.

![alt text](image-4.png)

> Ten en cuenta que no podrás ver tu contraseña al escribirla. ¡No te preocupes, esto es normal!

![alt text](image-5.png)

6. Toma nota de la contraseña de tu sesión del servicio MySQL, ya que puede que la necesites más adelante en el laboratorio.

7. Crea una nueva base de datos sakila usando el comando a continuación en el terminal y procede a la Tarea B:

```terminal
    create database sakila;
```

![alt text](image-6.png)

## Tarea B: Restaurar la estructura y los datos de una tabla

1. Para usar la nueva base de datos vacía sakila, utiliza el siguiente comando en la terminal:

```terminal
    use sakila;
```

![alt text](image-7.png)

2. Restaura el archivo de volcado mysql de sakila (que contiene las definiciones de tablas y datos de la base de datos sakila) en la nueva base de datos vacía sakila. Un archivo de volcado es un archivo de texto que contiene los datos de una base de datos en forma de declaraciones SQL. Este archivo se puede importar utilizando la línea de comandos con el siguiente comando:

```terminal
    source sakila_mysql_dump.sql;
```

![alt text](image-8.png)

> Nota: Puedes usar el comando source para restaurar el archivo de volcado de la base de datos dentro del símbolo del sistema mysql. Para restaurar el archivo de volcado de la base de datos fuera del símbolo del sistema mysql, puedes usar el comando <code>mysql --host=mysql --port=3306 --user=root --password sakila < sakila_mysql_dump.sql</code> después de salir de la sesión del símbolo del sistema mysql con el comando <code>\q</code>.

## Tarea C: Explorar y consultar tablas
1. Para listar todos los nombres de las tablas de la base de datos sakila, utiliza el comando a continuación en la terminal:

```terminal
    SHOW FULL TABLES WHERE table_type = 'BASE TABLE';
```

![alt text](image-9.png)

El Table_type para estas tablas es BASE TABLE. BASE TABLE significa que es una tabla en oposición a una vista (VIEW) o una vista de <code>INFORMATION_SCHEMA</code> (SYSTEM VIEW).

2. Explora la estructura de la tabla staff utilizando el comando a continuación en la terminal:

```terminal
    DESCRIBE staff;
```

![alt text](image-10.png)

Para entender la salida, consulta la siguiente tabla:

![alt text](image-11.png)

3. Ahora recupera todos los registros de la tabla staff utilizando el comando a continuación en la terminal:

```terminal
    SELECT * FROM staff;
```

![alt text](image-12.png)

4. Sal de la sesión del prompt de comandos de MySQL utilizando el comando a continuación en la terminal y procede a la Tarea D:

```terminal
    \q
```

![alt text](image-13.png)

## Tarea D: Volcar/respaldar tablas de una base de datos

1. Finalmente, volcar/resguardar la tabla staff de la base de datos utilizando el comando a continuación en la terminal:

```terminal
    mysqldump --host=mysql --port=3306 --user=root --password sakila staff > sakila_staff_mysql_dump.sql
```

Este comando respaldará la tabla staff de la base de datos sakila en un archivo llamado **sakila_staff_mysql_dump.sql**.

2. Introduzca su contraseña de sesión del servicio MySQL.

![alt text](image-14.png)

3. Para ver el contenido del archivo de volcado en la terminal, utilice el comando a continuación:

```terminal
    cat sakila_staff_mysql_dump.sql
```

![alt text](image-15.png)
*/