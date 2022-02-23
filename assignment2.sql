

SELECT X.customer_id,X.first_name,X.last_name, ISNULL(NULLIF(ISNULL(Y.first_name,'No'),Y.first_name),'Yes') AS first_product,ISNULL(NULLIF(ISNULL(Z.first_name,'No'),Z.first_name),'Yes') AS second_product, ISNULL(NULLIF(ISNULL(T.first_name,'No'),T.first_name),'Yes') AS third_product
FROM
(SELECT D.customer_id,D.first_name,D.last_name
FROM product.product A,sale.order_item B,sale.orders C,sale.customer D
WHERE A.product_id = B.product_id 
AND B.order_id = C.order_id 
AND C.customer_id = D.customer_id
AND A.product_name = '2TB Red 5400 rpm SATA III 3.5 Internal NAS HDD') AS X
LEFT JOIN (SELECT D.customer_id,D.first_name,D.last_name
FROM product.product A,sale.order_item B,sale.orders C,sale.customer D
WHERE A.product_id = B.product_id 
AND B.order_id = C.order_id 
AND C.customer_id = D.customer_id
AND A.product_name = 'Polk Audio - 50 W Woofer - Black') AS Y
ON X.customer_id = Y.customer_id
LEFT JOIN (SELECT D.customer_id,D.first_name,D.last_name
FROM product.product A,sale.order_item B,sale.orders C,sale.customer D
WHERE A.product_id = B.product_id 
AND B.order_id = C.order_id 
AND C.customer_id = D.customer_id
AND A.product_name = 'SB-2000 12 500W Subwoofer (Piano Gloss Black)') AS Z
ON X.customer_id = Z.customer_id
LEFT JOIN (SELECT D.customer_id,D.first_name,D.last_name
FROM product.product A,sale.order_item B,sale.orders C,sale.customer D
WHERE A.product_id = B.product_id 
AND B.order_id = C.order_id 
AND C.customer_id = D.customer_id
AND A.product_name = 'Virtually Invisible 891 In-Wall Speakers (Pair)') AS T
ON X.customer_id = T.customer_id
ORDER BY X.customer_id