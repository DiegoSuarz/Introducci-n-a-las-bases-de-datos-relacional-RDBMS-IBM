/*markdown
# Laboratorio Práctico: Crear Tablas y Cargar Datos en MySQL usando phpMyAdmin


En este laboratorio, aprenderás a crear tablas y cargar datos en el servicio de base de datos MySQL utilizando la herramienta de interfaz gráfica de usuario (GUI) phpMyAdmin.

## Objetivos
Después de completar este laboratorio, podrás usar phpMyAdmin con MySQL para:

Crear una base de datos.
Crear tablas.
Cargar datos en tablas manualmente usando la GUI de phpMyAdmin.
Cargar datos en tablas usando un archivo de texto/script.

## Software Utilizado en este Laboratorio
En este laboratorio, utilizarás MySQL. MySQL es un Sistema de Gestión de Bases de Datos Relacional (RDBMS) diseñado para almacenar, manipular y recuperar datos de manera eficiente.


Para completar este laboratorio, utilizarás el servicio de base de datos relacional MySQL disponible como parte de IBM Skills Network Labs (SN Labs) Cloud IDE. SN Labs es un entorno de laboratorio virtual utilizado en este curso.

## Base de Datos Utilizada en este Laboratorio
Se ha utilizado la base de datos Books en este laboratorio.

El siguiente diagrama muestra la estructura de la tabla myauthors de la base de datos Books:

![alt text](image.png)

En la tabla, author_id es un entero, first_name es una cadena que almacena un máximo de 100 caracteres, middle_name es una cadena que almacena un máximo de 50 caracteres, y last_name es una cadena que almacena un máximo de 100 caracteres.

## Tarea A: Crear una base de datos
Inicie la sesión del servicio MySQL utilizando la directiva Start MySQL in IDE button.

 Open MySQL Page in IDE

Si el ícono no inicia la base de datos MySQL, siga los pasos a continuación.

1. Haga clic en el botón de extensión de Skills Network en el lado izquierdo de la ventana.

2. Abra el menú BASES DE DATOS y haga clic en MySQL.

3. Haga clic en Crear. MySQL puede tardar unos momentos en iniciarse.

![alt text](image-1.png)

4. Abra la herramienta phpMyAdmin en una nueva pestaña de su navegador.

![alt text](image-2.png)

5. Verá la herramienta GUI de phpMyAdmin.

![alt text](image-3.png)

6. En la vista de árbol, haga clic en Nuevo para crear una nueva base de datos vacía. Luego ingrese Books como el nombre de la base de datos y haga clic en Crear.

La codificación se dejará como utf8mb4_0900_ai_ci. UTF-8 es la codificación de caracteres más comúnmente utilizada para contenido o datos.

![alt text](image-4.png)

## Tarea B: Crear tablas
1. En la interfaz de Crear tabla para la base de datos vacía Books, ingresa myauthors como el nombre de la tabla y 4 para el Número de columnas. Este es el primer paso para crear la tabla myauthors que se mostró anteriormente en este laboratorio.

Luego haz clic en Go.

![alt text](image-5.png)

2. Ingresa la definición de la tabla para la tabla myauthors como se muestra en la imagen a continuación con las casillas resaltadas. Luego haz clic en Save.

![alt text](image-6.png)

3. La estructura de la tabla para la tabla myauthors aparecerá.

![alt text](image-7.png)

# Tarea C: Cargar datos en tablas manualmente usando la interfaz gráfica de phpMyAdmin
1. A veces, puede que desees cargar algunas filas de datos, pero puede que no tengas un script SQL a mano para hacerlo. En este caso, puedes cargar los datos manualmente en phpMyAdmin. Dado que este es un proceso manual, es mejor para insertar una pequeña cantidad de datos en lugar de una gran cantidad.

Para cargar datos manualmente, ve a la pestaña Insertar de la tabla myauthors. Ingresa datos para 2 filas de la tabla **myauthors** como se muestra en la imagen a continuación con los cuadros resaltados. Luego haz clic en Continuar en la parte inferior.

![alt text](image-8.png)

2. Aparecerá una notificación de la inserción exitosa de 2 filas en la tabla myauthors.

![alt text](image-9.png)

3. Ve a la pestaña Explorar de la tabla myauthors para verificar las filas recién insertadas.

![alt text](image-10.png)


## Tarea D: Cargar datos en tablas usando un archivo de texto/script
1. Ahora utilizarás un script SQL para importar el resto de los datos de la tabla myauthors. Un archivo de script SQL contiene comandos y declaraciones que realizan operaciones en tu base de datos, y puede ser útil al importar una gran cantidad de datos.

Descarga el script SQL a continuación en tu computadora local:

- mysql_table-myauthors_insert-data.sql
2. Ve a la pestaña Importar para la tabla myauthors. Haz clic en Elegir archivo y carga el archivo mysql_table-myauthors_insert-data.sql desde el almacenamiento de tu computadora local. El resto de la configuración puede dejarse como está porque estás importando un script SQL que está codificado en UTF-8.

Luego haz clic en Ir. Aparecerá una notificación de éxito en la importación.

![alt text](image-11.png)

![alt text](image-12.png)

3. Ve a la pestaña Explorar para la tabla myauthors nuevamente para verificar que las nuevas filas insertadas aparezcan junto con las 2 filas insertadas anteriormente.

![alt text](image-13.png)







*/

/*markdown

*/