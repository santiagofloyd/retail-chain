-- ══════════════════════════════════════════
-- RetailChain — UNION y UNION ALL
-- Autor: Santiago Martin
-- Fecha: 11/10/2026
-- ══════════════════════════════════════════

--CONSULTA 1: UNION ----------
-- Reporte de Catálogo Unificado
-- Pregunta de negocio: ¿Qué productos únicos comercializa
-- la empresa en toda su red de sucursales?
-- Operador: UNION (elimina filas completamente duplicadas)

select distinct nombre_producto
from inventario_sucursal_norte
union
select distinct nombre_producto
from inventario_sucursal_sur;

-- ── CONSULTA 2: UNION ALL ────────────────
-- Auditoría de Stock Total
-- Pregunta de negocio: ¿Cuántos registros físicos de stock
-- existen en total entre ambas sucursales?
-- Operador: UNION ALL (mantiene todos los registros incluyendo duplicados)

SELECT COUNT(*) AS total_registros
FROM (
SELECT nombre_producto, stock FROM inventario_sucursal_norte
UNION ALL
SELECT nombre_producto, stock FROM inventario_sucursal_sur
) AS combinadas;

-- ── CONSULTA 3: COMPARACIÓN DE RESULTADOS ─
-- Ejecutá estas dos consultas para comparar cuántas filas
-- devuelve cada operador y explicá la diferencia en tu README
SELECT COUNT() AS filas_union FROM (/ tu UNION aquí /) AS resultado_union;
SELECT COUNT() AS filas_union_all FROM (/* tu UNION ALL aquí */) AS resultado_union_all;

-- Consulta: Conteo usando UNION (Elimina duplicados exactos)
SELECT COUNT(*) AS filas_union
FROM (
SELECT nombre_producto, stock FROM inventario_sucursal_norte
UNION
SELECT nombre_producto, stock FROM inventario_sucursal_sur
) AS resultado_union;

-- Consulta: Conteo usando UNION ALL (Mantiene todos los registros físicos)
SELECT COUNT(*) AS filas_union_all
FROM (
SELECT nombre_producto, stock FROM inventario_sucursal_norte
UNION ALL
SELECT nombre_producto, stock FROM inventario_sucursal_sur
) AS resultado_union_all;

