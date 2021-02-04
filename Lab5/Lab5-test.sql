
SELECT product.tid,tname,AVG(price)
FROM product,ptype
WHERE product.tid(+) = ptype.tid
GROUP BY product.tid,tname
ORDER BY product.tid;

SELECT COUNT(*) TOTAL_COUNT,
	MIN(price) maxP,
	MAX(price) minP,
	AVG(price) AVERAGE
FROM product;

SELECT COUNT(*) ,
	MIN(price),
	MAX(price),
	AVG(price) 
FROM product;

SELECT COUNT(tid) FROM product;
SELECT COUNT(*) FROM product;

AVG(col_name)
SUM(col_name)
MAX(col_name)
MIN(col_name)
COUNT(col_name)