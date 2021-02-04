CREATE TABLE Fact(
	Fcode		CHAR(3),
	FName_Tha	VARCHAR2(80),
	FName_Eng	VARCHAR2(80),
	CONSTRAINTS Fact_pk PRIMARY KEY(Fcode)
);

CREATE TABLE Dept(
	Fcode		CHAR(3),
	Dcode		CHAR(3),
	DName_Tha	VARCHAR2(80),
	DName_Eng	VARCHAR2(80),
	CONSTRAINTS Dept_pk PRIMARY KEY(Fcode,Dcode),
	CONSTRAINTS Dept_fk_Fact FOREIGN KEY(Fcode)
		REFERENCES Fact(Fcode)
);

CREATE TABLE Student(
	StdID		CHAR(11),
	StdFName	VARCHAR2(40),
	StdLName	VARCHAR2(40),
	StdAddress	VARCHAR2(80),
	Fcode		CHAR(3),
	Dcode		CHAR(3),
	CONSTRAINTS Student_pk PRIMARY KEY(StdID),
	CONSTRAINTS Student_fk_Fact FOREIGN KEY(Fcode)
		REFERENCES Fact(Fcode),
	CONSTRAINTS std_fk_dept FOREIGN KEY(Fcode,Dcode)
		REFERENCES Dept(Fcode,Dcode)
);

INSERT INTO Fact(Fcode,FName_Tha,FName_Eng) VALUES('F01','คณะวิทยาศาสตร์','Science');
INSERT INTO Fact(Fcode,FName_Tha,FName_Eng) VALUES('F02','คณะวิศวกรรมศาสตร์','Engineer');
INSERT INTO Fact(Fcode,FName_Tha,FName_Eng) VALUES('F03','คณะเทคโนโลยี','Technology');
INSERT INTO Fact(Fcode,FName_Tha,FName_Eng) VALUES('F04','คณะมนุษยศาสตร์และสังคมศาสตร์','Humanities and Social Sciences');
INSERT INTO Fact(Fcode,FName_Tha,FName_Eng) VALUES('F05','คณะศึกษาศาสตร์','Education');
ปล. commit; ด้วย

INSERT INTO Dept(Fcode,Dcode,DName_Tha,DName_Eng) VALUES('F01','D01','คณิตศาสตร์','Mathematics');
INSERT INTO Dept(Fcode,Dcode,DName_Tha,DName_Eng) VALUES('F01','D02','สถิติ','Statistics');
INSERT INTO Dept(Fcode,Dcode,DName_Tha,DName_Eng) VALUES('F01','D03','วิทยาการคอมพิวเตอร์','Computer Science');
INSERT INTO Dept(Fcode,Dcode,DName_Tha,DName_Eng) VALUES('F02','D01','วิศวกรรมคอมพิวเตอร์','Computer Engineer');
INSERT INTO Dept(Fcode,Dcode,DName_Tha,DName_Eng) VALUES('F03','D01','เทคโนโลยีการอาหาร','Food Technology');

INSERT INTO Student(StdID,StdFName,StdLname,StdAddress,FCode,DCode) VALUES('603021712-4','อรอนงค์','ทะวงษ์ศรี','ขอนแก่น','F01','D03');
INSERT INTO Student(StdID,StdFName,StdLname,StdAddress,FCode,DCode) VALUES('603020315-9','วาสนา','ถาปราบมาตร์','ขอนแก่น','F02','D01');
INSERT INTO Student(StdID,StdFName,StdLname,StdAddress,FCode,DCode) VALUES('603021032-6','อมรทรัพย์','แสนประสิทธิ์','ขอนแก่น','F03','D01');
INSERT INTO Student(StdID,StdFName,StdLname,StdAddress,FCode,DCode) VALUES('603020296-7','นนทวัฒ์','ประทุมมา','ขอนแก่น','F01','D02');