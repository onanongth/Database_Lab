CREATE OR REPLACE PROCEDURE LAB7_Student
IS
--DECLARE
	vstdid		CHAR(11);
	vstdfname	VARCHAR2(40);
	vstdlname	VARCHAR2(40);
	vstdaddress	VARCHAR2(40);
	vfcode		CHAR(3);
	vdcode		CHAR(3);
	vtcode		CHAR(3);
BEGIN
	SELECT stdid,stdfname,stdlname,stdaddress,fcode,dcode,tcode
	INTO vstdid,vstdfname,vstdlname,vstdaddress,vfcode,vdcode,vtcode
	FROM Student
	WHERE stdid = '603021712-4';
	
	DBMS_OUTPUT.PUT_LINE('Student ID : '||vstdid);
	DBMS_OUTPUT.PUT_LINE('FirstName : '||vstdfname);
	DBMS_OUTPUT.PUT_LINE('LastName  : '||vstdlname);
	DBMS_OUTPUT.PUT_LINE('Address : '||vstdaddress);
	DBMS_OUTPUT.PUT_LINE('FCODE : '||vfcode);
	DBMS_OUTPUT.PUT_LINE('DCODE : '||vdcode);
	DBMS_OUTPUT.PUT_LINE('TCODE : '||vtcode);
END;
/

EXECUTE LAB7_Student;

----------------------------------------------------------

CREATE OR REPLACE PROCEDURE LAB7_StudentDept
IS
--DECLARE
	vstdid		CHAR(11);
	vstdfname	VARCHAR2(40);
	vstdlname	VARCHAR2(40);
	vstdaddress	VARCHAR2(40);
	vfname_tha	VARCHAR2(80);
	vdname_tha	VARCHAR2(80);

BEGIN
	SELECT stdid,stdfname,stdlname,stdaddress,fname_tha,dname_tha
	INTO vstdid,vstdfname,vstdlname,vstdaddress,vfname_tha,vdname_tha
	FROM Student,Fact,Dept
	WHERE stdid = '603021712-4'
	AND Fact.fcode = Dept.fcode
	AND Fact.fcode = Student.fcode
	AND Dept.dcode = Student.dcode;
	
	DBMS_OUTPUT.PUT_LINE('Student ID : '||vstdid);
	DBMS_OUTPUT.PUT_LINE('FirstName : '||vstdfname);
	DBMS_OUTPUT.PUT_LINE('LastName  : '||vstdlname);
	DBMS_OUTPUT.PUT_LINE('Address : '||vstdaddress);
	DBMS_OUTPUT.PUT_LINE('Faculty Name : '||vfname_tha);
	DBMS_OUTPUT.PUT_LINE('Department Name : '||vdname_tha);
END;
/

EXECUTE LAB7_StudentDept;

----------------------------------------------------------

CREATE OR REPLACE PROCEDURE LAB7_Register
IS
--DECLARE
	vstdid		CHAR(11);
	vstdfname	VARCHAR2(40);
	vstdlname	VARCHAR2(40);
	vcredit		NUMBER(2);
	vregisfee	NUMBER(5);
BEGIN
	SELECT Student.stdid,stdfname,stdlname,SUM(credit),(SUM(credit)*1000)
	INTO vstdid,vstdfname,vstdlname,vcredit,vregisfee
	FROM Student,Subject,Register
	WHERE Student.stdid = '603021712-4'
	AND Student.stdid = Register.stdid
	AND Subject.subjcode = Register.subjcode
	GROUP BY Student.stdid,stdfname,stdlname;
	
	DBMS_OUTPUT.PUT_LINE('Student ID : '||vstdid);
	DBMS_OUTPUT.PUT_LINE('FirstName : '||vstdfname);
	DBMS_OUTPUT.PUT_LINE('LastName  : '||vstdlname);
	DBMS_OUTPUT.PUT_LINE('Credit : '||vcredit);
	DBMS_OUTPUT.PUT_LINE('Register Fee : '||vregisfee);
END;
/

EXECUTE LAB7_Register;