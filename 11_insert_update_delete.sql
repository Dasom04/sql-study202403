
-- INSERT
-- ���̺� ���� Ȯ��
DESC departments;

-- INSERT ù��° ��� (��� �÷� �����͸� �� ���� �����ؼ� ����)
INSERT INTO departments
VALUES(300, '���ߺ�', 100, 1500);  -- ��� ���� �� ����Ѵ�.
-- VALUES(300, '���ߺ�'); -- ���� -> Į���� �������� �ʰ� ���� �ִ� ��쿡�� ��� ���� �� ��� �Ѵ�. (NIULL ��� ���� ��� ����)

SELECT * FROM departments;
ROLLBACK; -- ���� ������ �ٽ� �ǵ����� Ű���� (������ Ŀ�� �������� �ǵ����ش�.)

-- INSERT�� �ι�° ��� (���� Į���� �����ϰ� ����, NOT NULL Į���� Ȯ���ϼ���!)
INSERT INTO departments
    (department_id, location_id) -- ���� -> department_namedl�� NOT NULL!
VALUES
    (301, 1500);

-- �纻 ���̺� ����
-- �纻 ���̺��� ���� �� �� �׳� ����-> ��ȸ�� ������ ���� ��� ����
-- WHERE���� false�� (1 = 2) �����ϸ� -> ���̺��� ������ ����ǰ� �����ʹ� ���� X
-- CTA���� �÷��� ������ �����͸� ������ ��, ��������(PK, FK...)�� �������� �ʽ��ϴ�.
CREATE TABLE emps AS
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1 = 2); -- ������ ���� ������ false �����ָ� ���� �����ʹ� ������� �ʴ´�.

SELECT * FROM emps;
DROP TABLE emps; -- ���̺� ����

DESC emps;

--INSERT�� (��������)
INSERT INTO emps
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE department_id = 50);

--------------------------------------------------------------------------------

-- UPDATE
-- �����͸� �����Ѵ�.
-- UPDATE ���̺� �̸� SET �÷�=��, �÷�=��... WHERE ������ �������� (����)
CREATE TABLE emps AS
(SELECT * FROM employees);

SELECT * FROM emps;

-- UPDATE�� ������ ���� ������ ������ �� �������� �� �����ؾ� �մϴ�.
-- �׷��� ������ ���� ����� ��ü ���̺�� �����˴ϴ�.
UPDATE emps SET salary = 30000;
ROLLBACK;

UPDATE emps SET salary = 30000
WHERE employee_id = 100;
SELECT * FROM emps;

UPDATE emps SET salary = salary + salary*0.1
WHERE employee_id = 100;

UPDATE emps
SET phone_number = '010.6608.1234', manager_id = 102
WHERE employee_id = 100;

-- UPDATE (��������)
UPDATE emps
SET (job_id, salary, manager_id) = 
    (
        SELECT job_id, salary, manager_id
        FROM emps
        WHERE employee_id = 100
    )
WHERE employee_id = 101;

SELECT * FROM emps;

--------------------------------------------------------------------------------

-- DELETE
-- DELETE�� WHERE�� �������� ������ ���̺� ��ü ���� ����� �˴ϴ�.
-- DELETE �� �÷��� �������� �ʴ´�. ������ ���� ����� �� ���� �����!!
-- �÷� �ϳ��� ���� ���� or ���� �ϰ������ UPDATE�� �ؾ��Ѵ�.
-- �����͸� ���ﶧ
DELETE FROM emps
WHERE employee_id = 103;


-- DELETE (��������)
DELETE FROM emps
WHERE department_id = (SELECT department_id FROM departments
                        WHERE department_name = 'IT');


DELETE FROM departments
WHERE department_name = '���ߺ�';


