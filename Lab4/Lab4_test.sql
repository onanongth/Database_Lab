SELECT pid,pname,price,tname,lname
FROM product,ptype,location
WHERE product.tid = ptype.tid 
AND product.lid = location.lid
ORDER BY price,tname DESC;

SELECT * FROM test_product3;

CREATE VIEW test_product3 AS
SELECT pid,pname,price,tname 
FROM product,ptype
WHERE product.tid = ptype.tid(+)
ORDER BY price,tname DESC;

SELECT pid,pname,price,tid FROM product;

SELECT pid,pname,price*1.2 NEW_Price FROM product;

select pid,pname,price*1.2 FROM product;

select pid,pname,price+100 FROM product; 'เพิ่มราคาสินค้าอีก 100'

select pid,pname,price FROM product WHERE pid = 'P01' OR pid = 'P05';

select pid,pname,price FROM product WHERE pid IN ('P01','P05','P20');

select pid,pname,price FROM product WHERE price BETWEEN 400 AND 700;

select pid,pname,price FROM product WHERE price >= 400 AND price <= 700;

select pid,pname,price FROM product WHERE price > 500 AND pname LIKE 'r%'; " % คือมีกี่ตัวก็ได้ด้านหลัง"

select pid,pname,price FROM product WHERE price > 500;

select col_name FROM table_name WHERE coll op col2/value;

select pid,pname,price FROM product;