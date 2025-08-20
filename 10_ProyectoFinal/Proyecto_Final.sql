/*markdown
# Proyecto Final: Diseño e Implementación de Base de Datos

¡Felicidades! Has terminado los módulos. Ahora es el momento de poner a prueba tus habilidades. Lee el escenario a continuación.

## Escenario
En este escenario, has sido contratado recientemente como Ingeniero de Datos por una cadena de cafeterías con sede en Nueva York que busca expandirse a nivel nacional abriendo varias ubicaciones de franquicias. Quieren optimizar las operaciones y renovar su infraestructura de datos como parte de su proceso de expansión.

Tu trabajo es diseñar sus sistemas de bases de datos relacionales para mejorar la eficiencia operativa y facilitar que sus ejecutivos tomen decisiones basadas en datos.

Actualmente, sus datos residen en varios sistemas: software de contabilidad, bases de datos de proveedores, sistemas de punto de venta (POS) e incluso hojas de cálculo. Revisarás los datos en todos estos sistemas y diseñarás una base de datos central para albergar todos los datos. Luego, crearás los objetos de la base de datos y los cargarás con datos de origen. Finalmente, crearás subconjuntos de datos que requieren tus socios comerciales, los exportarás y los cargarás en bases de datos de preparación utilizando varios RDBMS.

## Software utilizado en este proyecto
En este proyecto, utilizarás PostgreSQL Database, MySQL. Estos son sistemas de gestión de bases de datos relacionales (RDBMS) diseñados para almacenar, manipular y recuperar datos de manera eficiente.

## Datos utilizados en este proyecto
En este proyecto, trabajarás con un subconjunto de datos del ejemplo de datos de cafetería.

Utilizarás una versión modificada de los datos para el proyecto, así que para tener éxito en el proyecto, descarga los archivos enlazados cuando se indique en las instrucciones. No necesitas usar ningún dato de la fuente.

En tu escenario, trabajarás con datos de las siguientes fuentes:

- Información del personal contenida en una hoja de cálculo en la sede (HQ)
- Información de puntos de venta contenida en una hoja de cálculo en la sede (HQ)
- Datos de ventas generados como un archivo CSV desde el sistema POS en los puntos de venta
- Datos de clientes generados como un archivo CSV desde un sistema de gestión de relaciones con clientes personalizado
- Información de productos mantenida en una hoja de cálculo exportada de la base de datos de tu proveedor

## Objetivos
Después de completar este laboratorio, podrás:

- Identificar entidades
- Identificar atributos
- Crear un diagrama de relación de entidades (ERD) utilizando la herramienta ERD de pgAdmin
- Normalizar tablas
- Definir claves y relaciones
- Crear objetos de base de datos generando y ejecutando el script SQL desde la herramienta ERD
- Crear una vista y exportar los datos
- Crear una vista materializada y exportar los datos
- Importar datos en una base de datos MySQL utilizando la herramienta GUI phpMyAdmin

## Tarea 1: Identificar entidades
El primer paso al diseñar una nueva base de datos es revisar cualquier dato existente e identificar las entidades para su nuevo sistema.

1. La siguiente imagen muestra datos de muestra de cada fuente con la que estará trabajando para diseñar su nueva base de datos central. Revise la imagen e identifique las entidades que planea crear.

![alt text](image.png)


- Nota: Puede descargar una copia de esta imagen o abrirla en otra pestaña del navegador para referencia más adelante en el laboratorio.

2. Haga una lista de las entidades que ha identificado. Tome una captura de pantalla y guárdela como Task1.jpg o Task1.png.

## Tarea 2: Identificar atributos
En esta tarea, identificarás los atributos de una de las entidades que planeas crear.

Usando la información de los datos de muestra en la imagen de la Tarea 1, identifica los atributos de la entidad que almacenarán los datos de la transacción de ventas.

Haz una lista de los atributos de la transacción de ventas que identificaste. Toma una captura de pantalla y guárdala como Task2.jpg o Task2.png.

## Tarea 3: Crear un ERD
Ahora que has definido algunos de tus atributos y entidades, puedes determinar las tablas y columnas para ellos y crear un diagrama de entidad-relación (ERD).

1. Abre una nueva terminal desde el IDE en la nube en vista lado a lado.

2. Usa el botón de abajo para iniciar una sesión del servicio PostgreSQL en el IDE en la nube.

- Open and Start PostgreSQL in IDE

3. Usa el enlace de pgAdmin para abrir pgAdmin en una nueva pestaña de tu navegador.

4. Crea una nueva base de datos llamada <code>COFFEE</code>, visualiza los esquemas en la nueva base de datos <code>COFFEE</code> y luego inicia un nuevo proyecto ERD.

5. Agrega una tabla al ERD para la entidad de transacciones de venta utilizando la información en la siguiente tabla. Considera la convención de nombres a utilizar para que tus colegas puedan entender tus datos y asegúrate de que los nombres sean válidos en otros RDBMS. Usa los datos de ejemplo mostrados en la imagen de la Tarea 1 para determinar los tipos de datos apropiados para cada columna.

![alt text](image-1.png)

6. Toma una captura de pantalla de tu ERD y guárdala como Task3A.png o Task3A.jpg.

7. Agrega una tabla al ERD para la entidad de producto utilizando la información en la siguiente tabla.

![alt text](image-2.png)

8. Toma una captura de pantalla de tu ERD y guárdala como Task3B.png o Task3B.jpg.

## Tarea 4: Normalizar tablas
Al revisar tu ERD, notas que no se ajusta a la segunda forma normal. En esta tarea, normalizarás algunas de las tablas dentro de la base de datos.

1. Revisa los datos en la tabla de transacciones de ventas. Ten en cuenta que la columna de id de transacción no contiene valores únicos porque algunas transacciones incluyen múltiples productos.

2. Determina qué columnas deberían almacenarse en una tabla separada para eliminar las filas repetidas y llevar esta tabla a la segunda forma normal.

3. Agrega una nueva tabla llamada <code>sales_detail</code> al ERD, define las columnas en la nueva tabla y elimina las columnas trasladadas de la tabla de transacciones de ventas, dejando una columna coincidente en cada una de las dos tablas para crear una relación entre ellas más adelante.

4. Toma una captura de pantalla de tu ERD y guárdala como Task4A.png o Task4A.jpg.

5. Revisa los datos en la tabla de productos. Ten en cuenta que las columnas de categoría de producto y tipo de producto contienen datos redundantes.

6. Determina qué columnas deberían almacenarse en una tabla separada para reducir los datos redundantes y llevar esta tabla a una segunda forma normal.

7. Agrega una nueva tabla llamada <code>product_type</code> al ERD, define las columnas en la nueva tabla y elimina las columnas trasladadas de la tabla de productos, dejando una columna coincidente en cada una de las dos tablas para crear una relación entre ellas más adelante.

8. Toma una captura de pantalla de tu ERD y guárdala como Task4B.png o Task4B.jpg.

## Tarea 5: Definir claves y relaciones
Después de normalizar tus tablas, puedes definir sus claves primarias y las relaciones entre las tablas en tu diagrama de entidad-relación (ERD).

1. Identifica una columna apropiada en cada tabla para ser una clave primaria y crea las claves primarias en las tablas de tu diagrama de entidad-relación (ERD).

2. Toma una captura de pantalla de tu ERD y guárdala como Task5A.png o Task5A.jpg.

3. Identifica las relaciones entre los siguientes pares de tablas y luego crea las relaciones en tu ERD:

<code>sales_detail</code> a <code>sales_transaction</code>
<code>sales_detail</code> a <code>product</code>
<code>product</code> a <code>product_type</code>

4. Toma una captura de pantalla de tu ERD y guárdala como Task5B.png o Task5B.jpg.

## Tarea 6: Crear objetos de base de datos generando y ejecutando el script SQL desde la herramienta ERD
Ahora que tu diseño está completo, generarás un script SQL a partir de tu ERD, que podrás usar para crear tu esquema de base de datos. Para este proyecto, luego usarás un script SQL dado para asegurarte de que puedes cargar los datos de muestra en el esquema. Finalmente, cargarás los datos existentes de varias fuentes en tu nuevo esquema de base de datos.

1. Usa la funcionalidad Generar SQL en la herramienta ERD para crear un script SQL a partir de tu ERD.

2. Descarga el siguiente archivo <code>GeneratedScript.sql</code> en tu computadora local.

- GeneratedScript.sql

3. En pgAdmin, abre la herramienta de consultas, sube y abre el archivo <code>GeneratedScript.sql</code> desde tu computadora local, y luego ejecuta el script para crear las tablas definidas en el ERD. Verifica que las tablas existan en el esquema público de la base de datos COFFEE ahora.

4. Toma una captura de pantalla de las tablas mostradas en el panel de vista de árbol en el lado izquierdo de la página y guárdala como Task6A.png o Task6A.jpg.

5. Descarga el siguiente archivo </code>CoffeeData.sql</code> en tu computadora local.

- CoffeeData.sql

6. En pgAdmin, abre otra instancia de la herramienta de consultas, sube y abre el archivo <code>CoffeeData.sql</code> desde tu computadora local, y luego ejecuta el script para poblar las tablas que acabas de crear.

7. En pgAdmin, visualiza las primeras 100 filas de la tabla <code>sales_detail</code>.

8. Toma una captura de pantalla del panel de salida de datos y guárdala como Task6B.png o Task6B.jpg.

## Tarea 7: Crear una vista y exportar los datos
La empresa de nómina externa ha solicitado una lista de empleados y las ubicaciones donde trabajan. Esta lista no debe incluir al CEO ni al CFO que son propietarios de la empresa. En esta tarea, crearás una vista en tu base de datos PostgreSQL que devuelva esta información y exportarás los resultados a un archivo CSV.

1. En tu base de datos <code>COFFEE</code>, crea una nueva vista llamada <code>staff_locations_view</code> utilizando el siguiente SQL:

```sql
SELECT staff.staff_id,
staff.first_name,
staff.last_name,
staff.location
FROM staff
WHERE "position" NOT IN ('CEO', 'CFO');
```

2. Visualiza todas las filas devueltas por la vista.

3. Guarda los resultados de la consulta en un archivo llamado <code>staff_locations_view.csv</code> en tu computadora local.

4. Toma una captura de pantalla de la vista mostrada en el panel de vista en árbol en el lado izquierdo de la página con los resultados en el panel de Salida de Datos, y guárdala como Task7.png o Task7.jpg.

## Tarea 8: Crear una vista materializada y exportar los datos
Un consultor de marketing requiere acceso a los datos de su producto en su base de datos MySQL para una campaña de marketing. Creará una vista materializada en su base de datos PostgreSQL que devuelva esta información y exportará los resultados a un archivo CSV.

1. En su base de datos <code>COFFEE</code>, cree una nueva vista materializada llamada <code>product_info_m-view</code> utilizando el siguiente SQL:

```sql
SELECT product.product_name, product.description, product_type.product_category
FROM product
JOIN product_type
ON product.product_type_id = product_type.product_type_id;
```

2. Actualice la vista materializada con datos.

3. Vea todas las filas devueltas de la vista.

4. Guarde los resultados de la consulta en un archivo llamado product_info_m-view.csv en su computadora local.

5. Tome una captura de pantalla de la vista mostrada en el panel de vista en árbol en el lado izquierdo de la página con los resultados en el panel de Salida de Datos, y guárdela como Task8.png o Task8.jpg.

## Tarea 9: Importar datos de staff_location en una base de datos MySQL
La empresa externa de nómina te ha pedido que subas la información de ubicación del personal a su base de datos MySQL.

1. Haz clic en el botón de abajo para iniciar una instancia de MySQL en el Cloud IDE.
- Open and Start MySQL in IDE

2. Abre phpMyAdmin en una nueva pestaña de tu navegador.

3. En phpMyAdmin, crea una nueva base de datos llamada <code>STAFF_LOCATIONS</code>, luego importa la información de ubicación guardada en el archivo <code>staff_locations_view.csv</code> que exportaste de la vista que creaste en la Tarea 7.

4. Explora la nueva tabla y luego visualiza los datos en ella.

5. Toma una captura de pantalla del contenido de la nueva tabla y guárdala como Task9.png o Task9.jpg.

## Tarea 10: Importar datos de coffee_shop_products en una base de datos MySQL
El consultor de marketing te ha pedido que subas la información del producto a su base de datos MySQL.

1. En phpMyAdmin, crea una nueva base de datos llamada <code>coffee_shop_products</code>, y luego importa la información del producto guardada en el archivo <code>product_info_m-view.csv</code> desde tu vista materializada en una nueva tabla en la base de datos <code>coffee_shop_products</code>.

2. Navega por el contenido de la nueva tabla.

3. Toma una captura de pantalla del contenido de la nueva tabla y guárdala como Task10.png o Task10.jpg.

## Tarea 11[Opcional]: Importar datos de staff_location en la base de datos Db2
La empresa de nómina externa te ha solicitado que subas la información de ubicación del personal a su base de datos Db2.

1. En una nueva pestaña del navegador, ve a cloud.ibm.com/login, inicia sesión con tus credenciales y luego abre una consola para tu instancia de Db2 en la Nube que creaste anteriormente en este curso.

2. Utiliza la función Cargar Datos para cargar una nueva tabla llamada STAFF_LOCATIONS con la información de ubicación del personal guardada en el archivo staff_locations_view.csv que exportaste de la vista que creaste en la Tarea 7.

3. Explora la nueva tabla y luego visualiza los datos en ella.

4. Toma una captura de pantalla del contenido de la nueva tabla y guárdala como Task9.png o Task9.jpg.

## Resumen
En este proyecto, creaste los objetos y vistas que exportaste en una base de datos MySQL.
*/

/*markdown

*/