-- ══════════════════════════════════════════
-- RetailChain — UNION y UNION ALL
-- Autor: Santiago Martin
-- Fecha: 11/10/2026
-- ══════════════════════════════════════════

***¿Cuántas filas devuelve cada consulta y por qué son distintas?
El operador `UNION` elimina automáticamente las filas completamente duplicadas (es decir, registros donde coinciden de forma exacta todas las columnas seleccionadas, como `nombre_producto` y `stock`). Si ambas sucursales tienen productos con el mismo nombre pero diferente cantidad de stock, `UNION` los interpretará como registros distintos y los mantendrá, arrojando el mismo resultado que `UNION ALL`.

*** ¿Por qué UNION ALL es más eficiente que UNION?
UNION ALL es más eficiente en términos de recursos y velocidad de procesamiento porque no realiza ninguna validación adicional.
toma los bloques de datos de la primera consulta y les "pega" o concatena de forma secuencial los datos de la segunda consulta, sin comparar nada. Al evitar la fase de ordenamiento y filtrado de duplicados, consume menos CPU y memoria.

*** ¿En qué casos de negocio usarías cada uno? 
UNION ALL: Cuando estoy analizando ventas cada producto de dos períodos distintos y necesito saber la totalidad de las ventas de ambos. También podría usarlo para comparar ventas cada cliente en ambos períodos.

UNION: Podría usarlo para hacer un listado consolidado de productos y también podría usarlo para detallar los clientes y sus mail de cada sucursal, para enviar promociones.

***¿Qué pasa si las columnas de ambas consultas no coinciden en número o tipo? ¿Qué error genera SQL?
El motor de base de datos genera un error de sintaxis y rechaza la ejecución.

