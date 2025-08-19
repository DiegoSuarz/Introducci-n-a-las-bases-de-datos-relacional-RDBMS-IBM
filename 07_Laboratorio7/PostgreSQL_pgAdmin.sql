/*markdown
## Laboratorio práctico: Crear tablas y cargar datos en PostgreSQL usando pgAdmin


En este laboratorio, aprenderás cómo crear tablas y cargar datos en el servicio de base de datos PostgreSQL utilizando la herramienta de interfaz gráfica de usuario (GUI) pgAdmin. La GUI de pgAdmin proporciona una alternativa a la línea de comandos para interactuar con una base de datos PostgreSQL utilizando una interfaz gráfica. Esta GUI ofrece una serie de características clave para interactuar con una base de datos PostgreSQL de manera fácil de usar.

## Software utilizado en este laboratorio
En este laboratorio, utilizarás PostgreSQL Database. PostgreSQL es un Sistema de Gestión de Bases de Datos Relacionales (RDBMS) diseñado para almacenar, manipular y recuperar datos de manera eficiente.

Para completar este laboratorio, utilizarás el servicio de base de datos relacional PostgreSQL disponible como parte de IBM Skills Network Labs (SN Labs) Cloud IDE. SN Labs es un entorno de laboratorio virtual utilizado en este curso.

## Base de datos utilizada en este laboratorio
Usarás la base de datos Books en este laboratorio.

El siguiente diagrama muestra la estructura de la tabla "myauthors" de la base de datos Books:

![alt text](image.png)

## Objetivos
Después de completar este laboratorio, podrás utilizar pgAdmin con PostgreSQL para:
- Crear bases de datos y tablas en una instancia de PostgreSQL
- Cargar datos en tablas manualmente utilizando la interfaz gráfica de usuario (GUI) de pgAdmin
- Cargar datos en tablas desde un archivo de texto/script

## Estructura del Laboratorio
En este laboratorio, completarás varias tareas en las que aprenderás a crear tablas y cargar datos en el servicio de base de datos PostgreSQL utilizando la herramienta de interfaz gráfica de usuario (GUI) de pgAdmin.

## Tarea A: Crear una base de datos
Primero, para crear una base de datos en una instancia del servidor PostgreSQL, primero lanzarás una instancia del servidor PostgreSQL en Cloud IDE y abrirás la Interfaz Gráfica de Usuario pgAdmin.

1. Haz clic en el botón de extensión Skills Network en el lado izquierdo de la ventana.

2. Abre el menú BASE DE DATOS y haz clic en PostgreSQL.

3. Haz clic en Crear. PostgreSQL puede tardar unos momentos en iniciarse.

![alt text](image-1.png)

4. A continuación, abre la Interfaz Gráfica de Usuario pgAdmin haciendo clic en pgAdmin en la interfaz de Cloud IDE.

![alt text](image-2.png)

5. Una vez que se abra la GUI de pgAdmin, haz clic en la pestaña Servidores en el lado izquierdo de la página. Se te pedirá que ingreses una contraseña.

![alt text](image-3.png)

6. Para recuperar tu contraseña, haz clic en la pestaña PostgreSQL cerca de la parte superior de la interfaz y selecciona la pestaña Información de conexión.

![alt text](image-4.png)

7. Desplázate hacia abajo y haz clic en el icono de Copiar a la izquierda de tu contraseña para copiar la contraseña de sesión en tu portapapeles.

![alt text](image-5.png)

8. Regresa a la pestaña pgAdmin y pega tu contraseña, luego haz clic en OK.

9. Entonces podrás acceder a la herramienta GUI de pgAdmin.

![alt text](image-6.png)

10. En la vista de árbol, expande Servidores > postgres > Bases de datos. Si se te solicita, ingresa tu contraseña de sesión del servicio PostgreSQL. Haz clic derecho en Bases de datos y ve a Crear > Base de datos. En el cuadro Base de datos, escribe Libros como el nombre de tu nueva base de datos, y luego haz clic en Guardar. Procede a la Tarea B.

![alt text](image-7.png)

![alt text](image-8.png)

## Tarea B: Crear tablas
Ahora que tienes tu servicio de PostgreSQL activo y has creado la base de datos Books usando pgAdmin, vamos a crear algunas tablas para poblar la base de datos y almacenar los datos que deseas eventualmente cargar en ella.

1. En la vista de árbol, expande Books > Schemas > public. Haz clic derecho en Tables y ve a Create > Table.

![alt text](image-9.png)

2. En la pestaña General, en el cuadro Name, escribe myauthors como nombre de la tabla. No hagas clic en Save, procede al siguiente paso.

![alt text](image-10.png)

3. Cambia a la pestaña Columns y haz clic en el botón Add new row cuatro veces para agregar 4 marcadores de columna. No hagas clic en Save, procede al siguiente paso.

![alt text](image-11.png)

4. Ingresa la información de la estructura de definición de la tabla myauthors como se muestra en la imagen a continuación en los cuadros resaltados. Luego haz clic en Save. Procede a la Tarea C.

![alt text](image-12.png)

## Tarea C: Cargar datos en tablas manualmente usando la interfaz gráfica de pgAdmin
Ahora tienes una base de datos y has creado tablas dentro de ella. Con la interfaz gráfica de pgAdmin, puedes insertar valores en las tablas manualmente. Esto es útil si tienes algunas nuevas entradas que deseas agregar a la base de datos. Veamos cómo hacerlo.

1. En la vista de árbol, expande Tablas. Haz clic derecho en myauthors y ve a Ver/Editar Datos > Todas las Filas.

![alt text](image-13.png)

2. Insertarás 2 filas de datos en la tabla myauthors. En el panel inferior de Salida de Datos, ingresa la información de datos de la tabla myauthors para 2 filas como se muestra en los cuadros destacados en la imagen a continuación. Luego haz clic en el ícono de Guardar Cambios en los Datos. Procede a la Tarea D.

![alt text](image-14.png)

3. Ingresa los valores en la tabla como se muestra a continuación:

![alt text](image-15.png)

![alt text](image-16.png)

4. Guarda los valores.

![alt text](image-17.png)


## Tarea D: Cargar datos en tablas usando un archivo de texto/script
En la tarea anterior, ingresaste algunas entradas de datos en una tabla manualmente con pgAdmin. Aunque este método puede ser útil para pequeñas adiciones, si deseas cargar grandes cantidades de datos a la vez, el proceso se vuelve tedioso. Una alternativa es cargar datos en tablas desde un archivo de texto o script que contenga los datos que deseas ingresar. Veamos cómo hacerlo.

1. Importarás el resto de los datos de la tabla myauthors desde un archivo de texto csv. Descarga el archivo csv a tu computadora local:

- [myauthors.csv](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/datasets/Books/myauthors.csv)

2. En la vista de árbol, haz clic derecho en myauthors y ve a Importar/Exportar.

![alt text](image-18.png)

3. Sigue las instrucciones a continuación para importar:

    1. Asegúrate de que Importar/Exportar esté configurado en Importar,
    2. Formato = csv.
    3. Luego haz clic en el ícono Seleccionar archivo junto al cuadro de Nombre de archivo.

    ![alt text](image-19.png)

    4. Pasos para Cargar Archivo.
        - Paso 1: Inicialmente asegúrate de que los detalles de la carpeta estén vacíos y selecciona la opción var de la lista como se muestra en la captura de pantalla a continuación. Selecciona la carpeta var

        ![alt text](image-20.png)

        - Paso 2: Selecciona la carpeta lib.

        ![alt text](image-21.png)

        - Paso 3: Selecciona la carpeta pgadmin. Aquí podrías notar que las carpetas están bloqueadas excepto la carpeta pgadmin.
        
        ![alt text](image-22.png)

        - Paso 4: Ahora selecciona cargar como se menciona aquí.

        ![alt text](image-23.png)

        - Paso 5: Ahora arrastra y suelta el archivo desde tus descargas en tu máquina local.
        ![alt text](image-24.png)

        - Paso 6: Finalmente, la carga es exitosa. Cuando la carga se complete, cierra el área de archivos arrastrados haciendo clic en X.

        ![alt text](image-25.png)

        - Selecciona el archivo myauthors.csv cargado de la lista y haz clic en Seleccionar.

        ![alt text](image-26.png)

        - Asegúrate de que el archivo esté seleccionado.

        ![alt text](image-27.png)


        - Bajo Opciones habilita Encabezado y haz clic en Aceptar; aparecerá una notificación de éxito de importación.

        ![alt text](image-28.png)

        ![alt text](image-29.png)


4. Repite la Tarea C Paso 1 para verificar que las nuevas filas de datos importadas aparezcan junto con tus 2 filas previamente insertadas.

![alt text](image-30.png)

Como puedes ver, los datos contenidos en el archivo csv se cargaron exitosamente en la tabla y no tuviste que ingresar manualmente cientos de entradas.

## Conclusión
¡Felicidades! Has completado este laboratorio y has aprendido cómo crear bases de datos y tablas en una instancia de PostgreSQL, cargar datos en tablas manualmente utilizando la interfaz gráfica de pgAdmin y cargar datos en tablas desde un archivo de texto/script.



*/

/*markdown

*/