SELECT emp_id,emp_name,emp_salary,emp.d_no,aa
FROM emp,(SELECT d_no,AVG(emp_salary) aa
			FROM emp
			GROUP BY d_no) AVG_Tab
WHERE emp.d_no = AVG_Tab.d_no
AND emp_salary > aa;

SELECT d_no,AVG(emp_salary)
FROM emp
GROUP BY d_no;

SELECT * FROM emp;

SELECT emp_salary
FROM emp
WHERE emp_name = 'Tom';

SELECT emp_id,emp_name,emp_salary
FROM emp
WHERE emp_salary > (SELECT emp_salary
					FROM emp
					WHERE emp_name = 'Tom');
					
SELECT emp_id,emp_name,emp_salary
FROM emp
WHERE emp_salary > 10000;