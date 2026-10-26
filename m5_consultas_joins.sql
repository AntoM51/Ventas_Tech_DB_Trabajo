/* CONSULTA 1: Vista base del proyecto (INNER JOIN) */
--Propósito: Unir ventas, clientes, productos y categorías en una sola vista para Power BI.

SELECT 
    v.fecha_venta,
    c.id_cliente,
    c.nombre AS nombre_cliente,
    c.ciudad,
    p.nombre_producto,
    cat.nombre_categoria,
    v.cantidad,
    v.precio_unitario,
    (v.cantidad * v.precio_unitario) AS total_venta
FROM ventas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN productos p ON v.id_producto = p.id_producto
INNER JOIN categorias cat ON p.id_categoria = cat.id_categoria;

--Hallazgo: Nos permite ver con éxito la transaccionalidad completa del negocio en una sola fila por ítem, permitiendo analizar y agrupar las ventas según la ciudad del cliente y la categoría del producto.

/* CONSULTA 2: Clientes sin ventas (LEFT JOIN) */
--Propósito: Detectar clientes registrados sin compras para el área de CRM.

SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM Clientes c
LEFT JOIN ventas v ON c.id_cliente = v.id_cliente
WHERE v.id_cliente IS NULL;

--Hallazgo: Indica que no hay clientes sin compras. Toda la base registrada ya realizó al menos una venta.

/* CONSULTA 3: Productos sin ventas (LEFT JOIN) */
--Propósito: Identificar productos del catálogo que no registraron ventas para el área de Producto.

SELECT 
    p.nombre_producto,
    cat.nombre_categoria,
    p.precio
FROM productos p
INNER JOIN Categorias cat ON p.id_categoria = cat.id_categoria
LEFT JOIN ventas v ON p.id_producto = v.id_producto
WHERE v.id_producto IS NULL;

--Hallazgo: Como vimos en la anterior consulta, no hay clientes sin compras, por lo tanto, tampoco hay productos que no se hayan vendido. Todos los artículos del catálogo registran movimiento comercial, por lo que el área de Producto no detecta stock inactivo o sin rotación.

/* CONSULTA 4: Consolidado por canal (UNION ALL) */
--Propósito: Crear la columna de canal ('Online' y 'Presencial') y sumar sus ventas totales usando UNION ALL.

SELECT canal, SUM(total) AS total_canal
FROM (
    SELECT fecha_venta, (cantidad * precio_unitario) AS total, 'Online' AS canal
    FROM ventas 
    WHERE fecha_venta < '2024-03-10' 
    
    UNION ALL
    
    SELECT fecha_venta, (cantidad * precio_unitario) AS total, 'Presencial' AS canal
    FROM ventas 
    WHERE fecha_venta >= '2024-03-10' 
) AS consolidado
GROUP BY canal;

--Hallazgo: El canal 'Online' registró la mayor facturación con $3230, superando al canal 'Presencial' $3214, dandonos métricas clave para la distribución de presupuestos y estrategias de venta futuras.