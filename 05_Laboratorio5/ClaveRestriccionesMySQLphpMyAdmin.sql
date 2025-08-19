/*markdown
# Laboratorio práctico: Claves y restricciones en MySQL usando phpMyAdmin


## Introducción
En este laboratorio, aprenderás cómo agregar claves para crear relaciones entre las tablas y utilizar restricciones para hacer cumplir reglas en la entrada de datos en el servicio de base de datos MySQL utilizando la herramienta de interfaz gráfica de usuario (GUI) phpMyAdmin.

## Software utilizado en este laboratorio
En este laboratorio, utilizarás MySQL. MySQL es un sistema de gestión de bases de datos relacional (RDBMS) diseñado para almacenar, manipular y recuperar datos de manera eficiente.

Para completar este laboratorio, utilizarás el servicio de base de datos relacional MySQL disponible como parte de los Laboratorios de IBM Skills Network (SN Labs) en la nube. SN Labs es un entorno de laboratorio virtual utilizado en este curso.

## Base de datos utilizada en este laboratorio
Para este laboratorio, utilizarás la base de datos eBooks.

El siguiente diagrama de relación de entidades (ERD) muestra el estado actual del esquema de la base de datos eBooks utilizada en este laboratorio:

![alt text](image.png)

## Objetivos
Después de completar este laboratorio, podrás utilizar phpMyAdmin de MySQL para:
- Crear claves primarias y foráneas
- Agregar restricciones a las columnas de datos

## Ejercicio
En este ejercicio, aprenderás cómo agregar claves para crear relaciones entre las tablas. Utilizarás restricciones para hacer cumplir reglas en la entrada de datos en el servicio de base de datos MySQL utilizando la herramienta de interfaz gráfica de usuario (GUI) phpMyAdmin.

1. Haz clic en el botón de extensión de Skills Network en el lado izquierdo de la ventana.
2.  Abre el menú DATABASES y haz clic en MySQL.
3. Haz clic en Crear. MySQL puede tardar unos momentos en iniciarse.

![alt text](image-1.png)

4. Abre la herramienta phpMyAdmin en una nueva pestaña en tu navegador.

![alt text](image-2.png)

5. Verás la herramienta GUI de phpMyAdmin.

![alt text](image-3.png)

6. Descarga el archivo de volcado de MySQL eBooks (que contiene la tabla de base de datos eBooks, definiciones y datos) a tu almacenamiento local.

- [eBooks_mysql_dump.sql](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/datasets/eBooks/eBooks_mysql_dump.sql)

7. Ve a la pestaña Importar. Haz clic en Elegir archivo y carga el archivo eBooks_mysql_dump.sql. Luego, desmarca Habilitar comprobaciones de clave externa y selecciona SQL como Formato. Luego haz clic en Ir.

![alt text](image-4.png)

8. El sistema te notificará que la importación se ha completado con éxito. Selecciona la base de datos eBooks para expandir la imagen (si es necesario, haz clic en el icono + al lado de eBooks). Verás la lista de tablas de la base de datos eBooks.

![alt text](image-5.png)

9. **Claves primarias**: Crear una clave primaria en una tabla crea automáticamente un índice en la clave. Crearás una clave primaria para la tabla author para identificar de manera única cada fila en la tabla. Establecerás la columna **author_id** de la tabla **author** como clave primaria.

- En la vista de árbol, haz clic en la tabla **authors**.

- Cambia a la pestaña Estructura y asegúrate de estar dentro de la subtaba **Estructura de la tabla**.

- Marca la columna **author_id**.

- Haz clic en la opción **Primaria**.


![alt text](image-6.png)

10. **Auto-incremento**: Establecerás la función de auto-incremento para la clave primaria de la tabla **author**.

- En la vista de árbol, haz clic en la tabla **authors**. Cambia a la pestaña **Estructura** y asegúrate de estar dentro de la subtaba **Estructura de la tabla**.
- Marca la columna **author_id**.
- Haz clic en la opción **Cambiar**.
- Marca la opción **A_I** (A_I = Auto_Increment).
- Haz clic en Guardar.

![alt text](image-7.png)

![alt text](image-8.png)

11. **Restricciones de NULL**: Restringirás la columna **first_name** de la tabla authors para que no tenga un valor NULL.

- En la vista de árbol, haz clic en la tabla **authors**. Cambia a la pestaña **Estructura** y asegúrate de estar dentro de la subtaba **Estructura de la tabla**.
- Marca la columna **first_name**.
- Haz clic en la opción **Cambiar**.
- Desmarca la opción **Null**.
- Haz clic en **Guardar**.

![alt text](image-9.png)


![alt text](image-10.png)

12. **Claves foráneas**: Crearás una clave foránea para la tabla **book_authors** estableciendo su columna **author_id** como clave foránea para establecer una relación entre las tablas **book_authors** y **authors**.

- En la vista de árbol, haz clic en la tabla book_authors. Cambia a la pestaña Estructura y asegúrate de estar dentro de la subtaba Vista de relación.
- Si es necesario, haz clic en Agregar restricción para crear un nuevo marcador de posición de restricción de clave foránea.
- Completa los marcadores de posición como se muestra en la imagen siguiente.
- Haz clic en Guardar.

![alt text](image-11.png)


![alt text](image-12.png)


![alt text](image-13.png)

**CASCADE** significa que cuando se eliminan o actualizan filas en la tabla principal, las filas correspondientes en la tabla secundaria también se eliminarán o actualizarán.

**RESTRICT** significa que no se pueden eliminar o actualizar filas en la tabla principal si hay filas correspondientes en la tabla secundaria.

13. Después de crear/agregar todas las claves primarias, claves foráneas y restricciones necesarias, el esquema de la base de datos eBooks completa se verá como el siguiente diagrama ERD:

> Nota: No necesitas generar ningún diagrama ERD como el de abajo para este laboratorio. Comparando el diagrama ERD del esquema eBooks anterior (mostrado en la sección “Base de datos utilizada en este laboratorio”) y este diagrama ERD del esquema eBooks completo, solo intenta entender cómo todas las operaciones que realizaste anteriormente hicieron que la base de datos eBooks estuviera completa.

![alt text](image-14.png)

## ¡Felicidades! Has completado este laboratorio y estás listo para el siguiente tema.
*/

/*markdown

*/