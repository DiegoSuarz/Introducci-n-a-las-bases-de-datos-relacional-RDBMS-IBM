/*markdown
# Laboratorio Práctico: Vistas en PostgreSQL

En este laboratorio, aprenderás a crear, ejecutar y materializar vistas en el servicio de base de datos PostgreSQL utilizando la herramienta de interfaz gráfica de usuario (GUI) pgAdmin. Las vistas materializadas se comportan de manera diferente en comparación con las vistas regulares. El conjunto de resultados se materializa o guarda para su uso futuro en las vistas materializadas. No puedes insertar, actualizar o eliminar filas como en las vistas regulares. Las vistas materializadas almacenan los resultados de una consulta de base de datos como un objeto separado similar a una tabla para que alguien pueda acceder a los resultados más tarde sin tener que volver a ejecutar la consulta. Como resultado, las vistas materializadas pueden mejorar el rendimiento de la base de datos en comparación con las vistas regulares.

## Software utilizado en este laboratorio
En este laboratorio, utilizarás la Base de Datos PostgreSQL. PostgreSQL es un sistema de gestión de bases de datos relacional (RDBMS) diseñado para almacenar, manipular y recuperar datos de manera eficiente.



Para completar este laboratorio, utilizarás el servicio de base de datos relacional PostgreSQL disponible como parte de IBM Skills Network Labs (SN Labs) Cloud IDE. SN Labs es un entorno de laboratorio virtual utilizado en este curso.

## Base de datos utilizada en este laboratorio
Utilizarás la base de datos de eBooks en el laboratorio.

El siguiente diagrama ERD muestra el esquema de la base de datos completa de eBooks utilizada en este laboratorio:

![alt text](image.png)

## Objetivos
Después de completar este laboratorio, podrás usar pgAdmin con PostgreSQL para:

- Restaurar un esquema de base de datos y datos
- Crear y ejecutar una vista
- Crear y ejecutar una vista materializada

## Estructura del laboratorio
En este ejercicio, pasarás por tres tareas para aprender a crear y ejecutar vistas y vistas materializadas en el servicio de base de datos PostgreSQL utilizando la herramienta de interfaz gráfica de usuario (GUI) pgAdmin.

## Tarea A: Restaurar un esquema de base de datos y datos
Para comenzar con este laboratorio, primero descargarás el archivo de volcado de la base de datos eBooks, luego iniciarás PostgreSQL y pgAdmin utilizando el Cloud IDE. Puedes hacer esto siguiendo estos pasos:

1. Descarga el siguiente archivo de volcado de PostgreSQL eBooks (que contiene el esquema y los datos de la base de datos eBooks) a tu computadora local.

[eBooks_pgsql_dump.tar](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/datasets/eBooks/eBooks_pgsql_dump.tar)

2. Haz clic en el botón de extensión de Skills Network en el lado izquierdo de la ventana.

3. Abre el menú DATABASES y haz clic en PostgreSQL.

4. Haz clic en Crear. PostgreSQL puede tardar unos momentos en iniciarse.

![alt text](image-1.png)

5. A continuación, abre la Interfaz Gráfica de Usuario de pgAdmin haciendo clic en pgAdmin en la interfaz del Cloud IDE.

![alt text](image-2.png)

6. Una vez que se abra la GUI de pgAdmin, haz clic en la pestaña Servers en el lado izquierdo de la página. Se te pedirá que ingreses una contraseña.

![alt text](image-3.png)

7. Para recuperar tu contraseña, haz clic en la pestaña PostgreSQL cerca de la parte superior de la interfaz y selecciona la pestaña Connection Information.

![alt text](image-4.png)

8. Desplázate hacia abajo y haz clic en el ícono de Copiar a la izquierda de tu contraseña para copiar la contraseña de la sesión en tu portapapeles.

![alt text](image-5.png)

9. Regresa a la pestaña pgAdmin y pega tu contraseña, luego haz clic en OK.

10. Entonces podrás acceder a la herramienta GUI de pgAdmin.

![alt text](image-6.png)

11. En la vista de árbol, expande Servers > postgres > Databases. Ingresa tu contraseña de sesión del servicio PostgreSQL si se te solicita durante el proceso. Haz clic derecho en Databases y ve a Create > Database. Escribe eBooks como el nombre de la base de datos y haz clic en Guardar.

![alt text](image-7.png)

![alt text](image-8.png)

12. En la vista de árbol, expande eBooks. Haz clic derecho en eBooks y selecciona Restore.

![alt text](image-9.png)

13. Sigue las instrucciones a continuación para restaurar y proceder a la Tarea B:

- En la pestaña General, haz clic en Select file junto al cuadro Filename.

    ![alt text](image-10.png)

- Asegúrate de que subes los archivos a esta ruta: /var/lib/pgadmin/. Para hacerlo, puedes navegar manualmente a la ruta (o) copiar /var/lib/pgadmin/, reemplazar /home/ con ella y presionar Enter. Deberías ver algunos archivos predeterminados en esa ruta, como se muestra a continuación.

![alt text](image-11.png)

- Haz clic en los tres puntos, luego selecciona Upload.

![alt text](image-12.png)

- Haz doble clic en el área de archivos de drop y carga el eBooks_pgsql_dump.tar que descargaste anteriormente en tu computadora local.

![alt text](image-13.png)

- Cuando la carga esté completa, cierra el área de archivos de drop haciendo clic en X.

![alt text](image-14.png)

- Asegúrate de que Format esté configurado en All Files, selecciona el archivo eBooks_pgsql_dump.tar subido de la lista y luego haz clic en Select.

![alt text](image-15.png)

- En la pestaña General, asegúrate de que la ruta del nombre de archivo coincida con la que se muestra a continuación. Si ves una ruta diferente que incluye “None”, modifícala en consecuencia.

![alt text](image-16.png)

- Ahora cambia a la pestaña Options. Bajo Disable, activa la opción Triggers, y luego haz clic en Restore.

![alt text](image-17.png)

## Tarea B: Crear y ejecutar una vista
1. En la vista de árbol, expande eBooks > Schemas > public. Haz clic derecho en Views y ve a Create > View.

![alt text](image-18.png)

2. En la pestaña General, escribe publisher_and_rating_view como el nombre de la vista. Luego, cambia a la pestaña Code.

![alt text](image-19.png)

3. En la pestaña Code, copia y pega el siguiente código. Luego haz clic en Save.

```sql
SELECT books.title, books.rating, publishers.name
FROM books INNER JOIN publishers ON books.publisher_id = publishers.publisher_id
```

![alt text](image-20.png)

4. En la vista de árbol, expande Views. Haz clic derecho en publisher_and_rating_view y ve a View/Edit Data > All Rows.

![alt text](image-21.png)

5. Accederás a la vista que creaste. Esta acción te permite acceder y ver las tablas en tu base de datos.

![alt text](image-22.png)

## Tarea C: Crear y ejecutar una vista materializada
1. En la vista de árbol, expande eBooks > Schemas > public. Haz clic derecho en Materialized Views y ve a Create > Materialized View.

![alt text](image-23.png)

2. En la pestaña General, escribe publisher_and_rating_materialized_view como nombre de la vista. Luego cambia a la pestaña Code.

![alt text](image-24.png)

3. En la pestaña code, copia y pega el siguiente código. Luego haz clic en Save.

```sql
SELECT books.title, books.rating, publishers.name
FROM books INNER JOIN publishers ON books.publisher_id = publishers.publisher_id
```

![alt text](image-25.png)

4. En la vista de árbol, expande Materialized Views. Haz clic derecho en publisher_and_rating_materialized_view y ve a Refresh View > With data.

![alt text](image-26.png)

5. Haz clic derecho en publisher_and_rating_materialized_view nuevamente y ve a View/Edit Data > All Rows.

![alt text](image-27.png)

6. Accederás a la vista materializada que creaste.

![alt text](image-28.png)

A primera vista, no se ve muy diferente de la vista regular que creaste anteriormente en este laboratorio. Desde la perspectiva del usuario, es esencialmente lo mismo: ves los resultados de una consulta mostrados en un formato similar a una tabla. La diferencia es que esta vista materializada está almacenada en caché en la base de datos, por lo que alguien puede volver a acceder a los datos en el futuro sin volver a ejecutar la consulta de la base de datos.

## Conclusión
¡Felicidades! Has completado este laboratorio y has aprendido a restaurar un esquema de base de datos y datos, crear y ejecutar una vista, y crear y ejecutar una vista materializada.
*/