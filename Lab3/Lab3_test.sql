UPDATE product SET amount=12
WHERE pname LIKE 'ลูก%' OR price > 100;

UPDATE product SET amount=12
WHERE pname LIKE 'ลูก%' AND price > 100;

UPDATE table_name SET col=val1
WHERE condition AND/OR condition2;

UPDATE product SET amount=12
WHERE pname LIKE 'ลูก%';

UPDATE product SET amount=100
WHERE pname='ปากกา';

UPDATE product SET amount=20
WHERE pid='P01';

UPDATE table_name SET col=val1
WHERE col_name op val/col;

ROLLBACK; 'ไม่จำเป็นไม่ต้องใช้'

UPDATE product SET amount=12;
UPDATE table_name SET col=val1,col2='val2';

ALTER TABLE product
ADD(
	tid CHAR(3),
	CONSTRAINTS prod_fk_ptype FOREIGN KEY(tid)
		REFERENCES ptype(tid)
);

ALTER TABLE table_name
ADD(
	CONSTRAINT con_name FOREIGN KEY(col_FK)
		REFERENCES table_name2(col_PK)
);

SELECT CONSTRAINT_NAME,CONSTRAINT_TYPE FROM user_constraints;

DESC user_constraints;

ALTER TABLE product
ADD(CONSTRAINTS pro_pk PRIMARY KEY (pid));

ALTER TABLE table_name
ADD(CONSTRAINTS con_name PRIMARY KEY(col_PK));

'เพิ่มคอลัมน์'
ALTER TABLE product
ADD(amount NUMBER(3));

ALTER TABLE table_name
ADD( col_name data_type);
