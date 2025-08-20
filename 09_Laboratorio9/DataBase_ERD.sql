/*markdown
# Laboratorio práctico: Diseño de bases de datos usando ERD

En este laboratorio, aprenderás a diseñar una base de datos creando un diagrama de relación de entidades (ERD) en el servicio de base de datos PostgreSQL utilizando la herramienta de interfaz gráfica de usuario (GUI) pgAdmin. Primero, crearás un ERD de una base de datos. A continuación, generarás y ejecutarás un script SQL para crear el esquema de la base de datos a partir de su ERD. Finalmente, cargarás el esquema de la base de datos creado con datos.

## Software utilizado en este laboratorio
En este laboratorio, utilizarás PostgreSQL Database. PostgreSQL es un Sistema de Gestión de Bases de Datos Relacionales (RDBMS) diseñado para almacenar, manipular y recuperar datos de manera eficiente.

Para completar este laboratorio, utilizarás el servicio de base de datos relacional PostgreSQL disponible como parte de IBM Skills Network Labs (SN Labs) Cloud IDE. SN Labs es un entorno de laboratorio virtual utilizado en este curso.

## Base de datos utilizada en este laboratorio
La base de datos de RRHH utilizada en este laboratorio proviene de la siguiente fuente: HR Sample Database [Copyright 2021 - Oracle Corporation](https://docs.oracle.com/en/database/oracle/oracle-database/19/comsc/introduction-to-sample-schemas.html#GUID-4DE9844F-0B28-4713-9AFC-CCD8D6249D76).

Utilizarás una versión modificada de la base de datos para el laboratorio. Para seguir las instrucciones del laboratorio con éxito, utiliza la base de datos proporcionada con el laboratorio, en lugar de la base de datos de la fuente original.

El siguiente ERD muestra las tablas de la base de datos de RRHH:

![alt text](image.png)

## Objetivos
Después de completar este laboratorio, podrás usar pgAdmin con PostgreSQL para:

- Crear un ERD de una base de datos.
- Generar y ejecutar un script SQL a partir de un ERD para crear un esquema.
- Cargar el esquema de la base de datos con datos.

Este laboratorio se divide en dos ejercicios, Ejercicio de Ejemplo y Ejercicio de Práctica.

## Ejercicio de Ejemplo
En este ejercicio de ejemplo, primero crearás un ERD parcial de la base de datos de RRHH. A continuación, generarás y ejecutarás un script SQL para crear el esquema parcial de la base de datos de RRHH a partir de su ERD. Finalmente, cargarás el esquema de base de datos creado con datos utilizando la función de Restaurar.

## Tarea A: Crear un Diagrama de Relación de Entidades (ERD) de una base de datos
En esta tarea del Ejercicio de Ejemplo, crearás un ERD parcial de la base de datos de RRHH.

Para comenzar con este laboratorio, inicia PostgreSQL utilizando el Cloud IDE. Puedes hacerlo siguiendo estos pasos:

1. Haz clic en el botón de la extensión Skills Network en el lado izquierdo de la ventana.

2. Abre el menú DATABASES y haz clic en PostgreSQL.

3. Haz clic en Create. PostgreSQL puede tardar unos momentos en iniciarse.

![alt text](image-1.png)

4. Anota tu contraseña de sesión del servicio PostgreSQL porque puede que la necesites más adelante en el laboratorio.

5. Haz clic en el botón pgAdmin en la misma ventana donde iniciaste PostgreSQL.

6. Verás la herramienta GUI de pgAdmin.

![alt text](image-2.png)

7. En la vista de árbol, expande Servers > postgres > Databases. Ingresa tu contraseña de sesión del servicio PostgreSQL si se te solicita durante el proceso. Haz clic derecho en Databases y ve a Create > Database. Escribe HR como el nombre de la base de datos y haz clic en Save.

![alt text](image-3.png)

![alt text](image-4.png)

8. En la vista de árbol, expande HR. Haz clic derecho en HR y selecciona Generate ERD (Beta).

![alt text](image-5.png)

9. Haz clic en Add table. En la pestaña General, en el cuadro Name, escribe employees como el nombre de la tabla. No hagas clic en OK, procede al siguiente paso.

![alt text](image-7.png)

![alt text](image-6.png)

10. Cambia a la pestaña Columns y haz clic en Add new row para agregar los marcadores de columna necesarios. Ahora ingresa la información de definición de la tabla employees como se muestra en la imagen a continuación para crear su diagrama de entidad. Luego haz clic en OK.

![alt text](image-8.png)


![alt text](image-9.png)

11. De manera similar, crea diagramas de entidad para las otras tres tablas siguiendo los pasos 9 y 10:

<details><summary>[Haz clic aquí] Crea un diagrama de entidad para la tabla jobs </summary>
> Haz clic en el ícono Add table. En la pestaña General, en el cuadro Name, escribe jobs como el nombre de la tabla. No hagas clic en OK. Cambia a la pestaña Columns y haz clic en Add new row para agregar los marcadores de columna necesarios. Ahora ingresa la información de definición de la tabla jobs como se muestra en la imagen a continuación para crear su diagrama de entidad. Luego haz clic en OK.

![alt text](image-10.png)

![alt text](image-11.png)
</details>

<details><summary>[Haz clic aquí] Crea un diagrama de entidad para la tabla departments </summary>
> Haz clic en el ícono Add table. En la pestaña General, en el cuadro Name, escribe departments como el nombre de la tabla. No hagas clic en OK. Cambia a la pestaña Columns y haz clic en Add new row para agregar los marcadores de columna necesarios. Ahora ingresa la información de definición de la tabla departments como se muestra en la imagen a continuación para crear su diagrama de entidad. Luego haz clic en OK.

![alt text](image-12.png)

![alt text](image-13.png)

</details>

<details><summary>[Haz clic aquí] Crea un diagrama de entidad para la tabla locations</summary>
> Haz clic en el ícono Add table. En la pestaña General, en el cuadro Name, escribe locations como el nombre de la tabla. No hagas clic en OK. Cambia a la pestaña Columns y haz clic en Add new row para agregar los marcadores de columna necesarios. Ahora ingresa la información de definición de la tabla locations como se muestra en la imagen a continuación para crear su diagrama de entidad. Luego haz clic en OK.

![alt text](image-14.png)

![alt text](image-15.png)

</details>

12. Después de crear todos los cuatro diagramas de entidad, las entidades del ERD están completas.

![alt text](image-16.png)

13. A continuación, crearás relaciones entre las entidades agregando claves foráneas a las tablas. Selecciona el diagrama de entidad employees y haz clic en One-to-Many link. Ahora ingresa la información de definición para una clave foránea en la tabla employees como se muestra en la imagen a continuación para crear la relación. Luego haz clic en OK.

![alt text](image-17.png)

![alt text](image-18.png)

14. De manera similar, crea las otras relaciones entre las tablas siguiendo las instrucciones en el paso 13:

<details><summary>[Haz clic aquí] Crea una relación entre employees y jobs</summary>
> Selecciona el diagrama de entidad employees y haz clic en One-to-Many link. Ahora ingresa la información de definición para una clave foránea en la tabla employees como se muestra en la imagen a continuación para crear la relación. Luego haz clic en OK.

![alt text](image-19.png)

</details>


<details><summary>[Haz clic aquí] Crea una relación entre departments y locations</summary>
> Selecciona el diagrama de entidad departments y haz clic en One-to-Many link. Ahora ingresa la información de definición para una clave foránea en la tabla departments como se muestra en la imagen a continuación para crear la relación. Luego haz clic en OK.

![alt text](image-20.png)
</details>

<details><summary>[Haz clic aquí] Crea una relación entre departments y employees </summary>
> Selecciona el diagrama de entidad departments y haz clic en One-to-Many link. Ahora ingresa la información de definición para una clave foránea en la tabla departments como se muestra en la imagen a continuación para crear la relación. Luego haz clic en OK.

![alt text](image-21.png)

</details>

13. Colocar como columnas unicas (unique) a job_id y  manager_id en la tabla "employees"

![alt text](image-44.png)

14. Después de crear todas las cuatro relaciones, has completado el ERD para este ejercicio. Procede a la Tarea B.

![alt text](image-22.png)


## Tarea B: Generar y ejecutar un script SQL a partir del ERD para crear el esquema
En esta tarea del Ejercicio de Ejemplo, generarás y ejecutarás un script SQL a partir del ERD que creaste en la Tarea A del Ejercicio de Ejemplo.

1. En la ventana Generar ERD (Beta), haz clic en Generar SQL.

![alt text](image-23.png)

2. Se abrirá una nueva ventana del Editor de Consultas que contendrá un script SQL generado a partir del ERD. Haz clic en Ejecutar/Actualizar para ejecutar el script. Procede a la Tarea C.

![alt text](image-24.png)

## Tarea C: Cargar el esquema de la base de datos con datos
En esta tarea del Ejercicio de Ejemplo, cargarás el esquema de la base de datos que creaste en la Tarea B del Ejercicio de Ejemplo con datos utilizando la función de Restaurar de pgAdmin.

1. Descarga el archivo de volcado de PostgreSQL HR_pgsql_dump_data_for_example-exercise.tar (que contiene los datos parciales de la base de datos HR) usando el enlace a continuación en tu computadora local.

- [HR_pgsql_dump_data_for_example-exercise.tar](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/datasets/HR_Database/HR_Proper/HR_pgsql_dump_data_for_example-exercise.tar)

2. Sigue las instrucciones a continuación para importar/restaurar los datos:

- En la vista de árbol, expande HR. Haz clic derecho en HR y selecciona Restaurar.

![alt text](image-25.png)

- En la pestaña General, haz clic en Seleccionar archivo junto al cuadro de Nombre de archivo.

![alt text](image-26.png)

- Inicialmente asegúrate de que los detalles de la carpeta estén vacíos y selecciona la opción var de la lista como se muestra en la captura de pantalla a continuación. Selecciona la carpeta var.

![alt text](image-27.png)

- Selecciona la carpeta lib.

![alt text](image-28.png)

- Selecciona la carpeta pgadmin. Aquí notarás que las carpetas están bloqueadas excepto la carpeta pgadmin.

![alt text](image-29.png)

- Haz clic en Subir archivo. Ahora selecciona subir como se menciona aquí.

![alt text](image-30.png)

- Haz doble clic en el área de drop files y carga el HR_pgsql_dump_data_for_example-exercise.tar que descargaste anteriormente en tu computadora local.

> Nota: Asegúrate de que subes los archivos a esta ruta: /var/lib/pgadmin/

![alt text](image-31.png)

- Cuando la carga esté completa, cierra el área de drop files haciendo clic en X.

![alt text](image-32.png)

- Asegúrate de que Formato esté configurado en Todos los archivos, selecciona el archivo HR_pgsql_dump_data_for_example-exercise.tar subido de la lista y luego haz clic en Seleccionar.

![alt text](image-33.png)

- Ahora cambia a la pestaña Opciones de restauración.

![alt text](image-34.png)

- En Deshabilitar, establece la opción Trigger en Sí. Luego haz clic en Restaurar.

![alt text](image-35.png)

## Ejercicio Práctico
En este ejercicio práctico, primero terminarás de crear un ERD parcialmente completo para la base de datos de RRHH. A continuación, generarás y ejecutarás un script SQL para construir el esquema completo de la base de datos de RRHH a partir de su ERD. Finalmente, cargarás el esquema completo de la base de datos con datos utilizando la función de Restaurar.

1. Descarga el archivo ERD HR_pgsql_ERD_for_practice-exercise.pgerd (que contiene un ERD parcial de la base de datos de RRHH basado en el que creaste en la Tarea A del Ejercicio de Ejemplo) a tu computadora local.

- [HR_pgsql_ERD_for_practice-exercise.pgerd](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/datasets/HR_Database/HR_Proper/HR_pgsql_ERD_for_practice-exercise.pgerd)

2. En pgAdmin, crea una nueva base de datos llamada HR_Complete.

3. Abre la herramienta ERD y utiliza Cargar desde archivo para cargar el archivo HR_pgsql_ERD_for_practice-exercise.pgerd.

![alt text](image-36.png)

> Consejo: Sigue la Tarea C del Ejercicio de Ejemplo para saber cómo cargar cualquier archivo en pgAdmin.

4. Verás los cuatro diagramas de entidad anteriores junto con las relaciones que creaste en el Ejercicio de Ejemplo. También verás tres nuevos diagramas de entidad para las tablas job_history, regions y countries, y una nueva relación dentro del diagrama de entidad de la tabla employees entre manager_id como columna local y employee_id como columna referenciada.

![alt text](image-37.png)

5. Crea las relaciones restantes entre las tablas:

<details><summary>[Haz clic aquí] Crea una relación entre countries y regions </summary>
> Selecciona el diagrama de entidad countries y haz clic en Enlace Uno-a-Muchos. Ahora ingresa la información de definición para una clave externa en la tabla countries como se muestra en la imagen a continuación para crear la relación. Luego haz clic en OK.

![alt text](image-38.png)
</details>

<details><summary>[Haz clic aquí] Crea una relación entre job_history y departments</summary>
> Selecciona el diagrama de entidad job_history y haz clic en el botón Enlace Uno-a-Muchos. Ahora ingresa la información de definición para una clave externa en la tabla job_history como se muestra en la imagen a continuación para crear la relación. Luego haz clic en OK.

![alt text](image-39.png)
</details>

<details><summary>[Haz clic aquí] Crea una relación entre job_history y employees </summary>
> Selecciona el diagrama de entidad job_history y haz clic en Enlace Uno-a-Muchos. Ahora ingresa la información de definición para una clave externa en la tabla job_history como se muestra en la imagen a continuación para crear la relación. Luego haz clic en OK.

![alt text](image-40.png)
</details>

<details><summary>[Haz clic aquí] Crea una relación entre job_history y jobs </summary>
> Selecciona el diagrama de entidad job_history y haz clic en Enlace Uno-a-Muchos. Ahora ingresa la información de definición para una clave externa en la tabla job_history como se muestra en la imagen a continuación para crear la relación. Luego haz clic en OK.

![alt text](image-41.png)
</details>

<details><summary>[Haz clic aquí] Crea una relación entre locations y countries </summary>
> Selecciona el diagrama de entidad locations y haz clic en Enlace Uno-a-Muchos. Ahora ingresa la información de definición para una clave externa en la tabla locations como se muestra en la imagen a continuación para crear la relación. Luego haz clic en OK.

![alt text](image-42.png)
</details>

>Consejo: Sigue la Tarea A del Ejercicio de Ejemplo para saber cómo crear relaciones entre las entidades agregando claves externas a las tablas.

6. Después de crear las relaciones restantes, el ERD completo de la base de datos de RRHH se verá como la imagen siguiente:

![alt text](image-43.png)

7. Genera y ejecuta un script SQL desde el ERD para crear el esquema de la base de datos HR_Complete.

> Consejo: Sigue la Tarea B del Ejercicio de Ejemplo.

8. Descarga el archivo de volcado de PostgreSQL HR_pgsql_dump_data.tar (que contiene los datos completos de la base de datos de RRHH) a tu computadora local. Utiliza el archivo de volcado para restaurar/importar los datos a la base de datos HR_Complete.

- [HR_pgsql_dump_data.tar](https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DB0110EN-SkillsNetwork/datasets/HR_Database/HR_Proper/HR_pgsql_dump_data.tar)

> Consejo: Sigue la Tarea C del Ejercicio de Ejemplo.

## Conclusión
¡Felicidades! Has completado este laboratorio y has aprendido a crear un ERD de una base de datos, generar y ejecutar un script SQL a partir de un ERD para crear un esquema, y cargar el esquema de la base de datos con datos.
*/