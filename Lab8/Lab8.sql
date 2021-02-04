CREATE OR REPLACE PROCEDURE LAB8_Power2
IS
--DECLARE
	x	NUMBER(3) := 2;
	y	NUMBER(3) := 1;
BEGIN
	LOOP
		DBMS_OUTPUT.PUT_LINE(x||' ^ '||y||' = '||x**y);
		y := y+1;
	EXIT WHEN y > 10;
	END LOOP;
END;
/

CREATE TABLE StudentScore(
	ID		CHAR(11),
	Name	VARCHAR2(80),
	Mid		NUMBER(2),
	Final	NUMBER(2),
	WORK	NUMBER(2),
	CONSTRAINTS StdScore_pk PRIMARY KEY(ID)
);

----------------------------------------------------------------

INSERT INTO StudentScore(ID,Name,Mid,Final,Work) VALUES('553020621-7','สิทธิชัย สมทรัพย์','29','38','28');
INSERT INTO StudentScore(ID,Name,Mid,Final,Work) VALUES('555020270-4','พงษ์ศธร จันทร์ยอย','15','20','10');
INSERT INTO StudentScore(ID,Name,Mid,Final,Work) VALUES('603021712-4','อรอนงค์ ทะวงษ์ศรี','30','40','30');

----------------------------------------------------------------

CREATE OR REPLACE PROCEDURE LAB8_DBGrade
IS
--DECLARE
	VID		CHAR(11);
	VName	VARCHAR2(80);
	VWork	NUMBER(2);
	VMid	NUMBER(2);
	VFinal	NUMBER(2);
	Total	NUMBER(3);
	Grade	CHAR(1);
BEGIN
	SELECT ID,Name,Work,Mid,Final,Work+Mid+Final
	INTO VID,VName,VWork,VMid,VFinal,Total
	FROM StudentScore
	WHERE ID = '603021712-4'
	GROUP BY ID,Name,Work,Mid,Final;
	
	IF Total >= 80 THEN
		Grade := 'A';
	ELSIF Total BETWEEN 70 AND 79 THEN
		Grade := 'B';
	ELSIF Total BETWEEN 60 AND 69 THEN
		Grade := 'C';
	ELSIF Total BETWEEN 50 AND 59 THEN
		Grade := 'D';
	ELSE
		Grade := 'F';
	END IF;
	
	DBMS_OUTPUT.PUT_LINE('Student ID : '||VID);
	DBMS_OUTPUT.PUT_LINE('Name : '||VName);
	DBMS_OUTPUT.PUT_LINE('Work score : '||VWork);
	DBMS_OUTPUT.PUT_LINE('Midterm score : '||VMid);
	DBMS_OUTPUT.PUT_LINE('Final score : '||VFinal);
	DBMS_OUTPUT.PUT_LINE('Total score : '||Total);
	DBMS_OUTPUT.PUT_LINE('Getting grade is '||Grade);

END;
/

----------------------------------------------------------------


