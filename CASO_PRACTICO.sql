-- b) Explorar la tabla “menu_items” para conocer los productos del menú.
SELECT * FROM MENU_ITEMS
	
-- Encontrar el número de artículos en el menú.
SELECT * FROM MENU_ITEMS
SELECT COUNT (*) FROM MENU_ITEMS
-- TOTAL DE ARTÍCULOS: 32

-- ¿Cuál es el artículo menos caro y el más caro en el menú?
SELECT PRICE, ITEM_NAME FROM MENU_ITEMS
ORDER BY PRICE ASC
-- ARTÍCULO MENOS CARO: EDAMAME
SELECT PRICE, ITEM_NAME FROM MENU_ITEMS
ORDER BY PRICE DESC
-- ARTÍCULO MAS CARO: SHRIMP SCAMPI

-- ¿Cuántos platos americanos hay en el menú?
SELECT category, COUNT(category)
FROM menu_items
GROUP BY CATEGORY
-- 6

-- ¿Cuál es el precio promedio de los platos?
SELECT AVG(price) AS promedio_platillos FROM menu_items
-- 13.2859375000000000

-- c) Explorar la tabla “order_details” para conocer los datos que han sido recolectados.
SELECT * FROM order_details

-- ¿Cuántos pedidos únicos se realizaron en total?
SELECT COUNT (DISTINCT order_id) FROM order_details
-- 5370

-- ¿Cuáles son los 5 pedidos que tuvieron el mayor número de artículos?
SELECT order_id, COUNT(item_id)
FROM order_details
GROUP BY order_id
ORDER BY COUNT(item_id) DESC
LIMIT 5
-- 440, 2675, 3473, 4305, 443

-- ¿Cuándo se realizó el primer pedido y el último pedido?
SELECT order_date FROM order_details
ORDER BY order_date ASC
LIMIT 1
-- PRIMER PEDIDO: 2023-01-01
SELECT order_date FROM order_details
ORDER BY order_date DESC
LIMIT 1
-- ÚLTIMO PEDIDO: 2023-03-31

-- ¿Cuántos pedidos se hicieron entre el '2023-01-01' y el '2023-01-05'?
SELECT COUNT (order_details_id) FROM order_details
WHERE order_date between '2023-01-01' and '2023-01-05'
-- 702
	
-- Realizar un left join entre entre order_details y menu_items con el identificador
--item_id(tabla order_details) y menu_item_id(tabla menu_items).
SELECT *
FROM order_details AS o
LEFT JOIN menu_items AS m
ON item_id=menu_item_id

-- ¿CUÁLES ES LA CATEGORÍA MAS PEDIDA DEL MENÚ?
SELECT count(o.order_id), m.category
FROM order_details AS o
LEFT JOIN menu_items AS m
ON o.item_id=m.menu_item_id
GROUP BY m.category
ORDER BY count(o.order_id) desc
LIMIT 1
-- ASIAN

-- ¿CUÁL ES EL PLATILLO MENOS PEDIDO DEL MENÚ?
SELECT count(o.order_id), m.item_name
FROM order_details AS o
LEFT JOIN menu_items AS m
ON o.item_id=m.menu_item_id
GROUP BY m.item_name
ORDER BY count(o.order_id) ASC
LIMIT 1
-- CHICKEN TACOS

-- ¿CUÁL ES EL PLATILLO MAS PEDIDO DEL MENÚ?
SELECT count(o.order_id), m.item_name
FROM order_details AS o
LEFT JOIN menu_items AS m
ON o.item_id=m.menu_item_id
GROUP BY m.item_name
ORDER BY count(o.order_id) desc
LIMIT 1
-- Hamburger

-- ¿CUÁL FUE EL PRIMER PLATILLO QUE SE VENDIÓ?
SELECT (m.item_name), o.order_date
FROM order_details AS o
LEFT JOIN menu_items AS m
ON o.item_id=m.menu_item_id
ORDER BY (o.order_date) asc
LIMIT 1
-- Korean Beef Bowl

-- ¿CUÁLES FUERON LOS ÚLTIMOS 3 PLATILLOS QUE SE VENDIERON?
SELECT (m.item_name), o.order_date
FROM order_details AS o
LEFT JOIN menu_items AS m
ON o.item_id=m.menu_item_id
ORDER BY (o.order_date) DESC
LIMIT 3
-- Cheese Lasagna, Spaghetti, French Fries