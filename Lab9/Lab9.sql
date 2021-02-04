CREATE OR REPLACE PROCEDURE LAB9_StudentGrade
IS
--DECLARE
	CURSOR abc IS SELECT ID,Name,Work,Mid,Final
	FROM StudentScore;
	vID		StudentScore.ID%TYPE;
	vNAME	StudentScore.Name%TYPE;
	vWork	StudentScore.Work%TYPE;
	vMid	StudentScore.Mid%TYPE;
	vFinal	StudentScore.Final%TYPE;
	vTotal	NUMBER(3);
	vGrade	VARCHAR2(2);
	
BEGIN
	OPEN abc;
	LOOP
		FETCH abc INTO vID,vNAME,vWork,vMid,vFinal;
	EXIT WHEN abc%notfound;
	vTotal := vWork+vMid+vFinal;
		IF vTotal BETWEEN 80 AND 100 THEN
			vGrade := 'A';
		ELSIF vTotal BETWEEN 75 AND 79 THEN
			vGrade := 'B+';
		ELSIF vTotal BETWEEN 70 AND 74 THEN
			vGrade := 'B';
		ELSIF vTotal BETWEEN 65 AND 69 THEN
			vGrade := 'C+';
		ELSIF vTotal BETWEEN 60 AND 64 THEN
			vGrade := 'C';
		ELSIF vTotal BETWEEN 55 AND 59 THEN
			vGrade := 'D+';
		ELSIF vTotal BETWEEN 50 AND 54 THEN
			vGrade := 'D';
		ELSE
			vGrade := 'F';
		END IF;
		
		DBMS_OUTPUT.PUT_LINE('*************** Row '||abc%ROWCOUNT||' *****************');
		DBMS_OUTPUT.PUT_LINE('Student ID : '||VID);
		DBMS_OUTPUT.PUT_LINE('Name : '||VName);
		DBMS_OUTPUT.PUT_LINE('Work score : '||VWork);
		DBMS_OUTPUT.PUT_LINE('Midterm score : '||VMid);
		DBMS_OUTPUT.PUT_LINE('Final score : '||VFinal);
		DBMS_OUTPUT.PUT_LINE('Total score : '||vTotal);
		DBMS_OUTPUT.PUT_LINE('Getting grade is '||vGrade);
	END LOOP;
	CLOSE abc;
END;
/


------------------------------------------------------------


CREATE OR REPLACE PROCEDURE LAB9_CALGRADE(StudentID VARCHAR2,TotalScore NUMBER)
IS
--DECLARE
	vGrade		VARCHAR2(2);
BEGIN

		IF TotalScore BETWEEN 80 AND 100 THEN
			vGrade := 'A';
		ELSIF TotalScore BETWEEN 75 AND 79 THEN
			vGrade := 'B+';
		ELSIF TotalScore BETWEEN 70 AND 74 THEN
			vGrade := 'B';
		ELSIF TotalScore BETWEEN 65 AND 69 THEN
			vGrade := 'C+';
		ELSIF TotalScore BETWEEN 60 AND 64 THEN
			vGrade := 'C';
		ELSIF TotalScore BETWEEN 55 AND 59 THEN
			vGrade := 'D+';
		ELSIF TotalScore BETWEEN 50 AND 54 THEN
			vGrade := 'D';
		ELSE
			vGrade := 'F';
		END IF;
		
		DBMS_OUTPUT.PUT_LINE('Input Student ID : '||StudentID);
		DBMS_OUTPUT.PUT_LINE('Output Grade : '||vGrade);

END;
/

EXECUTE LAB9_CALGRADE('5999999999-1',65)
-----------------------------------------------------------


CREATE OR REPLACE PROCEDURE LAB9_ExecuteGrade
IS
--DECLARE
	CURSOR abc IS SELECT ID,Name,Work,Mid,Final
	FROM StudentScore;
	vID		StudentScore.ID%TYPE;
	vNAME	StudentScore.Name%TYPE;
	vWork	StudentScore.Work%TYPE;
	vMid	StudentScore.Mid%TYPE;
	vFinal	StudentScore.Final%TYPE;
	vTotal	NUMBER(3);
	vGrade	VARCHAR2(2);
BEGIN
	OPEN abc;
	LOOP
		FETCH abc INTO vID,vNAME,vWork,vMid,vFinal;
	EXIT WHEN abc%notfound;
	vTotal := vWork+vMid+vFinal;
		
	DBMS_OUTPUT.PUT_LINE('*************** Row '||abc%ROWCOUNT||' *****************');
	DBMS_OUTPUT.PUT_LINE('Student ID : '||VID);
	DBMS_OUTPUT.PUT_LINE('Name : '||VName);
	DBMS_OUTPUT.PUT_LINE('Work score : '||VWork);
	DBMS_OUTPUT.PUT_LINE('Midterm score : '||VMid);
	DBMS_OUTPUT.PUT_LINE('Final score : '||VFinal);
	DBMS_OUTPUT.PUT_LINE('Total score : '||vTotal);
	LAB9_CALGRADE(vID,vTotal);
	
	END LOOP;
	CLOSE abc;
	

END;
/


-----------------------------------------------------------


ALTER TABLE StudentScore
ADD(
	FCode CHAR(3),
	CONSTRAINT StdScore_fk_Fact FOREIGN KEY(FCode)
		REFERENCES Fact(FCode)
);

UPDATE StudentScore SET FCode='F01';


-----------------------------------------------------------


CREATE OR REPLACE PROCEDURE LAB9_StudentData_Grade
IS
--DECLARE
	CURSOR abc IS SELECT ID,Name,Work,Mid,Final,FName_Tha
	FROM StudentScore,Fact
	WHERE StudentScore.FCode = Fact.FCode;
	
	vID			StudentScore.ID%TYPE;
	vNAME		StudentScore.Name%TYPE;
	vWork		StudentScore.Work%TYPE;
	vMid		StudentScore.Mid%TYPE;
	vFinal		StudentScore.Final%TYPE;
	vFName_Tha	Fact.FName_Tha%TYPE;
	vTotal		NUMBER(3);
	vGrade		VARCHAR2(2);
BEGIN
	OPEN abc;
	LOOP
		FETCH abc INTO vID,vNAME,vWork,vMid,vFinal,vFName_Tha;
	EXIT WHEN abc%notfound;
	vTotal := vWork+vMid+vFinal;
		
	DBMS_OUTPUT.PUT_LINE('*************** Row '||abc%ROWCOUNT||' *****************');
	DBMS_OUTPUT.PUT_LINE('Student ID : '||VID);
	DBMS_OUTPUT.PUT_LINE('Name : '||VName);
	DBMS_OUTPUT.PUT_LINE('Faculty Name : '||vFName_Tha);
	LAB9_CALGRADE(vID,vTotal);
	
	END LOOP;
	CLOSE abc;
	

END;
/
