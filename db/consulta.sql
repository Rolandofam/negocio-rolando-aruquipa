-- CONNECTION: url=jdbc:postgresql://localhost:5432/postgres

-- 1. Productos  con  el  nombre  de  su  categoría,  ordenados  por  nombre (JOIN, ORDER BY).

-- SELECT pro.nombre, cat.nombre
-- FROM producto AS pro
-- JOIN categoria AS cat ON pro.categoria_id=cat.id
-- ORDER BY cat.nombre;

SELECT pro.nombre, cat.nombre
FROM producto AS pro, categoria AS cat
WHERE pro.categoria_id=cat.id
ORDER BY cat.nombre;

-- 2. Productos con menos de 5 unidades en stock (WHERE).
SELECT nombre, precio, stock
FROM producto
WHERE stock<5;

-- 3. Precio promedio por categoría (GROUP BY, A VG).
-- SELECT cat.nombre, AVG(precio) AS promedio
-- FROM producto AS pro INNER JOIN categoria AS cat ON pro.categoria_id=cat.id
-- GROUP BY cat.nombre

SELECT cat.nombre, temp1.promedio
FROM categoria AS cat,
    (SELECT categoria_id, AVG(precio) AS promedio
    FROM producto
    GROUP BY categoria_id) AS temp1
WHERE temp1.categoria_id=cat.id

-- 4. Pedidos de un cliente con su fecha y estado (JOIN, WHERE).
-- SELECT cli.nombre, ped.fecha, ped.estado
-- FROM cliente AS cli
-- JOIN pedido AS ped ON cli.id=ped.cliente_id;

SELECT cli.nombre, ped.fecha, ped.estado
FROM cliente AS cli, pedido AS ped
WHERE cli.id=ped.cliente_id;

-- 5. Total en dinero de cada pedido (SUM, GROUP BY).
SELECT pedido_id, SUM(preciounitario*cantidad)
FROM detallepedido
GROUP BY pedido_id

-- 6. Clientes con más de 2 pedidos (GROUP BY, HA VING).
-- SELECT cli.nombre, COUNT(ped.cliente_id) AS cantidad
-- FROM pedido AS ped
-- INNER JOIN cliente AS cli ON cli.id=ped.cliente_id
-- GROUP BY cli.nombre
-- HAVING COUNT(ped.cliente_id)>2

SELECT cli.nombre, temp1.cantidad
FROM cliente AS cli,
    (SELECT cliente_id, COUNT(cliente_id) AS cantidad
    FROM pedido
    GROUP BY cliente_id) AS temp1
WHERE cli.id=temp1.cliente_id AND temp1.cantidad>2

SELECT cli.nombre, temp1.cantidad
FROM cliente AS cli,
    (SELECT cliente_id, COUNT(cliente_id) AS cantidad
    FROM pedido
    GROUP BY cliente_id
    HAVING COUNT(cliente_id)>2) AS temp1
WHERE cli.id=temp1.cliente_id

-- 7. Eliminar un cliente sin pedidos (DELETE).
SELECT cliente_id
FROM pedido
WHERE cliente_id NOT IN (SELECT id
                        FROM cliente)

DELETE FROM cliente WHERE id=13;