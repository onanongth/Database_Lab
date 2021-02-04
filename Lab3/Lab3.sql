CREATE TABLE Teacher(
	Tcode	CHAR(3),
	TFName	VARCHAR2(80),
	TLName	VARCHAR2(80),
	FCode	CHAR(3),
	DCode	CHAR(3),
	CONSTRAINTS teach_pk PRIMARY KEY(Tcode),
	CONSTRAINTS teach_fk_fact FOREIGN KEY(FCode)
		REFERENCES Fact(FCode),
	CONSTRAINTS teach_fk_dept FOREIGN KEY(FCode,DCode)
		REFERENCES Dept(FCode,DCode)
);

CREATE TABLE Subject(
	SubjCode	CHAR(6),
	Name_Tha	VARCHAR2(80),
	Name_Eng	VARCHAR2(80),
	Credit		NUMBER(2),
	Desc_Tha	VARCHAR2(80),
	Desc_Eng	VARCHAR2(80),
	CONSTRAINTS sub_pk PRIMARY KEY(SubjCode)
);

CREATE TABLE Register(
	StdID		CHAR(11),
	SubjCode	CHAR(6),
	Year		NUMBER(4),
	Semester	NUMBER(1),
	Grade		NUMBER(4,2),
	CONSTRAINTS reg_pk PRIMARY KEY(StdID,SubjCode,Year),
	CONSTRAINTS reg_fk_std FOREIGN KEY(StdID)
		REFERENCES Student(StdID),
	CONSTRAINTS reg_fk_sub FOREIGN KEY(SubjCode)
		REFERENCES Subject(SubjCode)
);

INSERT INTO Teacher(TCode,TFName,TLName,FCode,DCode) VALUES('T01','พุธษดี','ศิริแสงตระกูล','F01','D03');
INSERT INTO Teacher(TCode,TFName,TLName,FCode,DCode) VALUES('T02','สมจิตร','อาจอินทร์','F01','D03');
INSERT INTO Teacher(TCode,TFName,TLName,FCode,DCode) VALUES('T03','สันติ','ทินตะนัย','F01','D03');
INSERT INTO Teacher(TCode,TFName,TLName,FCode,DCode) VALUES('T04','อภิศักดิ์','พัฒนจักร','F01','D03');
INSERT INTO Teacher(TCode,TFName,TLName,FCode,DCode) VALUES('T05','สมชัย','อัษฎายุทธ','F01','D03');
INSERT INTO Teacher(TCode,TFName,TLName,FCode,DCode) VALUES('T06','บุญส่ง','วัฒนกิจ','F01','D03');
INSERT INTO Teacher(TCode,TFName,TLName,FCode,DCode) VALUES('T07','งามนิจ','อาจอินทร์','F01','D03');
INSERT INTO Teacher(TCode,TFName,TLName,FCode,DCode) VALUES('T08','ไกรสร','วงษ์พราวมาศ','F01','D03');
INSERT INTO Teacher(TCode,TFName,TLName,FCode,DCode) VALUES('T09','อุรฉัตร','โคแก้ว','F01','D03');
INSERT INTO Teacher(TCode,TFName,TLName,FCode,DCode) VALUES('T10','ปัญญาพล','หอระตะ','F01','D03');

INSERT INTO Subject(SubjCode,Name_Tha,Name_Eng,Credit,Desc_Tha,Desc_Eng) VALUES('000103','ภาษาอังกฤษทางวิชาการ 2','English II','3','ภาษาอังกฤษทางวิชาการ 2','English II');
INSERT INTO Subject(SubjCode,Name_Tha,Name_Eng,Credit,Desc_Tha,Desc_Eng) VALUES('000171','ชีวิตสุขภาพ','Healthy life','3','ชีวิตสุขภาพ','Healthy life');
INSERT INTO Subject(SubjCode,Name_Tha,Name_Eng,Credit,Desc_Tha,Desc_Eng) VALUES('314125','แคลคูลัส','Calculus','3','แคลคูลัส','Calculus');
INSERT INTO Subject(SubjCode,Name_Tha,Name_Eng,Credit,Desc_Tha,Desc_Eng) VALUES('316201','สถิติขั้นต้น','Intro to statistics','3','สถิติขั้นต้น','Intro to statistics');
INSERT INTO Subject(SubjCode,Name_Tha,Name_Eng,Credit,Desc_Tha,Desc_Eng) VALUES('322212','โครงสร้างข้อมูล','Data structures','3','โครงสร้างข้อมูล','Data structures');
INSERT INTO Subject(SubjCode,Name_Tha,Name_Eng,Credit,Desc_Tha,Desc_Eng) VALUES('322336','ระบบฐานข้อมูลและการออกแบบ','Database systems ','3','ระบบฐานข้อมูลและการออกแบบ','Database systems ');

ALTER TABLE Student
ADD(
	TCode CHAR(3),
	CONSTRAINTS std_fk_teach FOREIGN KEY(TCode)
		REFERENCES Teacher(TCode)
);

UPDATE Student SET TCode='T01'
WHERE StdID='603021712-4';
UPDATE Student SET TCode='T09'
WHERE StdID='603020315-9';
UPDATE Student SET TCode='T10'
WHERE StdID='603021032-6';
UPDATE Student SET TCode='T01'
WHERE StdID='603020296-7';

INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603021712-4','000103','2558','1','3.5');
INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603021712-4','000171','2558','1','4.0');
INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603021712-4','314125','2558','1','4.0');
INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603021712-4','316201','2558','2','3.5');
INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603021712-4','322212','2558','2','3.0');
INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603021712-4','322336','2558','2','3.5');

INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603020315-9','000103','2558','1','4.0');
INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603020315-9','000171','2558','1','4.0');
INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603020315-9','314125','2558','1','3.5');
INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603020315-9','316201','2558','2','3.5');
INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603020315-9','322212','2558','2','3.0');
INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603020315-9','322336','2558','2','3.0');

INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603021032-6','000103','2558','1','3.5');
INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603021032-6','000171','2558','1','3.5');
INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603021032-6','314125','2558','1','4.0');
INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603021032-6','316201','2558','2','4.0');
INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603021032-6','322212','2558','2','3.0');
INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603021032-6','322336','2558','2','3.0');

INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603020296-7','000103','2558','1','4.0');
INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603020296-7','000171','2558','1','4.0');
INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603020296-7','314125','2558','1','4.0');
INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603020296-7','316201','2558','2','3.0');
INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603020296-7','322212','2558','2','3.5');
INSERT INTO Register(StdID,SubjCode,Year,Semester,Grade) VALUES('603020296-7','322336','2558','2','4.0');














