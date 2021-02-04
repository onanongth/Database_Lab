-- การเรียกใช้
EXECUTE test_2;
EXEC test_2;
BEGIN
	test_2;
END;
/

CREATE OR REPLACE PROCEDURE test_2
IS
--DECLARE
	vpid	product.pid%type;
	vpname	product.pname%type;
	vprice	product.price%type;
	vlname	location.lname%type;
BEGIN
	SELECT pid,pname,price,lname
	INTO vpid,vpname,vprice,vlname
	FROM Product,Location
	WHERE pid = 'P10'
	AND Product.lid = Location.lid;
	
	DBMS_OUTPUT.PUT_LINE('Product ID : '||vpid);
	DBMS_OUTPUT.PUT_LINE('Product Name : '||vpname);
	DBMS_OUTPUT.PUT_LINE('Product Price : '||vprice);
	DBMS_OUTPUT.PUT_LINE('Location Name : '||vlname);
END;
/


DECLARE
	vpid	product.pid%type;
	vpname	product.pname%type;
	vprice	product.price%type;
	vlname	location.lname%type;
BEGIN
	SELECT pid,pname,price,lname
	INTO vpid,vpname,vprice,vlname
	FROM Product,Location
	WHERE pid = 'P10'
	AND Product.lid = Location.lid;
	
	DBMS_OUTPUT.PUT_LINE('Product ID : '||vpid);
	DBMS_OUTPUT.PUT_LINE('Product Name : '||vpname);
	DBMS_OUTPUT.PUT_LINE('Product Price : '||vprice);
	DBMS_OUTPUT.PUT_LINE('Location Name : '||vlname);
END;
/


DECLARE
	vpid	CHAR(3);
	vpname	VARCHAR2(30);
	vprice	NUMBER(6,2);
	vlname	VARCHAR2(30);
BEGIN
	SELECT pid,pname,price,lname
	INTO vpid,vpname,vprice,vlname
	FROM Product,Location
	WHERE pid = 'P10'
	AND Product.lid = Location.lid;
	
	DBMS_OUTPUT.PUT_LINE('Product ID : '||vpid);
	DBMS_OUTPUT.PUT_LINE('Product Name : '||vpname);
	DBMS_OUTPUT.PUT_LINE('Product Price : '||vprice);
	DBMS_OUTPUT.PUT_LINE('Location Name : '||vlname);
END;
/
--เอาไปเก็บไว้ในตัวแปรใช้ INTO

SELECT pid,pname,price
FROM Product
WHERE pid = 'P10';

--รับค่าผ่านคีย์บอร์ด ใช้ &
DECLARE
	A number(5) := &A;
	B number(5) := &B;
	C number(6);
BEGIN
	C := A+B;
	DBMS_OUTPUT.PUT_LINE('A : '||A);
	DBMS_OUTPUT.PUT_LINE('B : '||B);
	DBMS_OUTPUT.PUT_LINE('C : '||C);
END;
/


DECLARE
	A number(5) := 10;
	B number(5) := 90;
	C number(6);
BEGIN
	C := A+B;
	DBMS_OUTPUT.PUT_LINE('A : '||A);
	DBMS_OUTPUT.PUT_LINE('B : '||B);
	DBMS_OUTPUT.PUT_LINE('C : '||C);
END;
/

--แสดงผล server ตอบกลับ ให้เซ็ตไว้ก่อนตลอด
SET SERVEROUTPUT ON 

BEGIN
	DBMS_OUTPUT.PUT_LINE('My name is Fufu');
END;
/