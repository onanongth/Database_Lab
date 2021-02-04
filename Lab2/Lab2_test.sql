DELETE FROM table_name;

INSERT INTO prod(pname,pid,price) VALUES('iron','p01',500);
INSERT INTO table_name(col3,col1,col2) VALUES(val3, val1, 'val2');

INSERT INTO ptype VALUES('t01', 'Electronic');
INSERT INTO table_name VALUES('val1', val2, val3);

CREATE TABLE prod(
	pid		CHAR(3),
	pname	VARCHAR2(30),
	price	NUMBER(5,2),
	tid		CHAR(3),
	lid		CHAR(3),
	CONSTRAINTS prod_pk PRIMARY KEY(pid),
	CONSTRAINTS prod_fk_ptype FOREIGN KEY(tid)
		REFERENCES ptype(tid),
	CONSTRAINTS prod_fk_loc FOREIGN KEY(lid)
		REFERENCES location(lid)
);

CREATE TABLE location(
	lid		CHAR(3),
	lname	VARCHAR(30),
	CONSTRAINTS loc_pk PRIMARY KEY(lid)
);

CREATE TABLE prod(
	pid		CHAR(3),
	pname	VARCHAR(30),
	price	NUMBER(5,2),
	tid		CHAR(3),
	CONSTRAINTS prod_pk PRIMARY KEY(pid),
	CONSTRAINTS prod_fk_ptype FOREIGN KEY(tid)
		REFERENCES ptype(tid)
);

CREATE TABLE table_name2(
	name1	data_type,
	name2	data_type,
	name3	data_type,
	CONSTRAINTS col_name2 PRIMARY KEY(name1),
	CONSTRAINTS col_name3 FOREIGN KEY(name3),
		REFERENCES tablename(col_name1)
);

CREATE TABLE prod(
	pid		CHAR(3),
	pname	VARCHAR(30),
	price	NUMBER(5,2),
	CONSTRAINTS prod_pk PRIMARY KEY(pid)
);

DROP TABLE ptype;
DROP TABLE table_name;

CREATE TABLE ptype(
	tid		char(3),
	tname	VARCHAR(30),
	CONSTRAINTS ptype_pk PRIMARY KEY(tid)
);

CREATE TABLE tablename(
	col_name1  data_type,
	col_name2  data_type,
	col_name3  data_type
	CONSTRAINTS con_name PRIMARY KEY(col_name1)
);

CREATE TABLE ptype(
	tid CHAR(3),
	tname VARCHAR(30)
);

CREATE TABLE table_name(
	col_name1  data_type,
	col_name2  data_type,
	col_name3  data_type
);

ptype
	tid
	tname
	
product
	pid
	pname
	price
	
location
	lid
	lname