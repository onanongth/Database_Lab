
-- การใช้ LOOP FOR // .. คือ จากไหนถึงไหน
DECLARE
	y	NUMBER(3) := &y;
BEGIN
	FOR x IN 1..12
	LOOP
		DBMS_OUTPUT.PUT_LINE(y||' x '||x||' = '||x*y);
	END LOOP;
END;
/


-- การใช้ WHILE
DECLARE
	x	NUMBER(3) := 1;
	y	NUMBER(3) := &y;
BEGIN
	WHILE (x <= 12)
	LOOP
		DBMS_OUTPUT.PUT_LINE(y||' x '||x||' = '||x*y);
		x := x+1;
	END LOOP;
END;
/


-- การใช้ LOOP
DECLARE
	x	NUMBER(3) := 1;
	y	NUMBER(3) := 13;
	-- y	CONSTANT NUMBER(3) := 13;
BEGIN
	LOOP
		DBMS_OUTPUT.PUT_LINE(y||' x '||x||' = '||x*y);
		x := x+1;
	EXIT WHEN x > 12;
	END LOOP;
END;
/


-- BETWEEN นับเป็นตั้งแต่ - ถึง
DECLARE
	score	NUMBER(3) := &score;
BEGIN
	IF score BETWEEN 80 AND 85 THEN
		DBMS_OUTPUT.PUT_LINE('Score : '||score||' Grade : A');
	ELSE
		DBMS_OUTPUT.PUT_LINE('Score : '||score||' Grade : F');
	END IF;
END;
/


--การเขียน if , else
DECLARE
	score	NUMBER(3) := &score;
BEGIN
	IF score > 80 THEN
		DBMS_OUTPUT.PUT_LINE('Score : '||score||' Grade : A');
	ELSE
		DBMS_OUTPUT.PUT_LINE('Score : '||score||' Grade : F');
	END IF;
END;
/


-- ถ้าตัวที่รับค่าเป็น charactor ให้ใส่ ' ' ด้วย
DECLARE
	status	CHAR(1) := '&status';
BEGIN
	IF status = 'A' THEN
		DBMS_OUTPUT.PUT_LINE('Active student.');
	ELSE
		DBMS_OUTPUT.PUT_LINE('Not Active student.');
	END IF;
END;
/


DECLARE
	vcharge	NUMBER(2) := &charge;
BEGIN
	DBMS_OUTPUT.PUT_LINE('Service charge : '||vcharge||'%');
END;
/


-- อย่าลืม set server
SET SERVEROUTPUT ON