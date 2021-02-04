
EXECUTE calnewprice(988)

CREATE OR REPLACE PROCEDURE calnewprice(price NUMBER)
IS
	new_price NUMBER;
BEGIN
	new_price := price * 1.2;
	DBMS_OUTPUT.PUT_LINE('New Price : '||new_price);
END;
/


EXECUTE say_sawadee(5)

CREATE OR REPLACE PROCEDURE say_sawadee(n NUMBER)
IS
BEGIN
	FOR i IN 1..n
	LOOP
		DBMS_OUTPUT.PUT_LINE('sawadee teacher '||i);
	END LOOP;
END;
/



-- cursor เอาไว้ดึงข้อมูลหลายๆแถว
DECLARE
	CURSOR cprod IS SELECT pid,pname,price
	FROM Product;
	-- ใส่ WHERE ได้
	vPID	Product.pid%TYPE;
	vPNAME	Product.pname%TYPE;
	vPRICE	Product.price%TYPE;
BEGIN
	OPEN cprod;
	LOOP
		FETCH cprod INTO vpid,vPNAME,vPRICE;
	EXIT WHEN cprod%notfound;
		DBMS_OUTPUT.PUT_LINE(vPID||' '||vPNAME||' '||vPRICE);
		calnewprice(vPRICE);
	END LOOP;
	CLOSE cprod;
END;
/


DECLARE
	TYPE numType IS TABLE OF NUMBER(5)
	INDEX BY BINARY_INTEGER;
	nums numType;
BEGIN
	FOR i IN 1..12 LOOP
		nums(i) := 12 * i;
	END LOOP;
	FOR i in 1..12 LOOP
		DBMS_OUTPUT.PUT_LINE('12 x '||i||' = '||nums(i));
	END LOOP;
END;
/

-- ตั้งไทป์ให้ตัวแปรแบบ array
DECLARE
	TYPE nameType IS TABLE OF VARCHAR2(10)
	INDEX BY BINARY_INTEGER;
	friends nameType;
BEGIN
	friends(1) := 'Ooh Hwoo';
	friends(2) := 'Nor Ei Ni';
	friends(3) := 'Paw';
	friends(-1) := 'Maxzim';
	
	DBMS_OUTPUT.PUT_LINE('Friend 1 : '||friends(1));
	DBMS_OUTPUT.PUT_LINE('Friend -1 : '||friends(-1));
END;
/

-- ประกาศตัวแปร ( ต้องดึงข้อมูลทั้งหมด ) 
-- ถ้าเป็น * คือทุกคอลัมน์
DECLARE
	pp	Product%ROWTYPE;
BEGIN
	SELECT * INTO pp
	FROM Product
	WHERE pid='P01';
	DBMS_OUTPUT.PUT_LINE('ID : '||pp.PID);
	DBMS_OUTPUT.PUT_LINE('Name : '||pp.PNAME);
	DBMS_OUTPUT.PUT_LINE('Price : '||pp.PRICE);
END;
/


DECLARE
	TYPE prodtype IS RECORD(
		vPID	Product.pid%type,
		vPNAME	Product.pname%type,
		vPRICE	Product.price%type
	);
	pp	prodtype;
BEGIN
	SELECT pid,pname,price INTO pp
	FROM Product
	WHERE pid='P01';
	DBMS_OUTPUT.PUT_LINE('ID : '||pp.vPID);
	DBMS_OUTPUT.PUT_LINE('Name : '||pp.vPNAME);
	DBMS_OUTPUT.PUT_LINE('Price : '||pp.vPRICE);
END;
/