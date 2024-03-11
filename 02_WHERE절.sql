
SELECT * FROM employees;

-- ����Ŭ�� = �ϳ��� ����.
-- �����ʹ� �빮�� �ҹ��ڸ� �����ϱ� ������ �� Ȯ���ؼ� ����Ѵ�.
-- Ű����� �ĺ��ڴ� ��ҹ��� ���� ���Ѵ�.
-- WHERE�� �� (������ ���� ��/�ҹ��ڸ� �����մϴ�.)
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id = 'IT_PROG';

SELECT *
FROM employees
WHERE last_name = 'king';

SELECT *
FROM employees
WHERE department_id = 50;

-- AND: ����, ���� �Ѵ� true
SELECT *
FROM employees
WHERE salary >= 15000
AND salary < 20000;

-- ��¥ Ÿ��
SELECT *
FROM employees
WHERE hire_date = '04/01/30';

-- �������� �� ���� (BETWEEN, IN, LIKE)
SELECT * FROM employees
WHERE salary BETWEEN 15000 AND 20000;

-- 03/01/01 ���� 03/12/31 ����
SELECT * FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31'; 

-- IN �������� ��� (Ư�� ����� ���� �� ���)
-- �� �ȿ� �ִ�? ��� ��
SELECT * FROM employees
WHERE manager_id IN (100, 101, 102);

SELECT * FROM employees
WHERE job_id IN ('IT_ PROG','AD_VP');

-- LIKE ������ (���� ���ڿ� ���� ����)
-- %�� ��� ���ڵ�, _�� �������� �ڸ� (��ġ)�� ǥ���� ��
-- %: anything % �տ� ���� or ���� ������ ~���� �����Ѵٸ� �̶�� ��, % �ڿ� ������ ~���� �����°��� �� �����ش�.
-- �˻� ��� ���� �� ���� ���
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date Like '%15';

-- 05�� ���� �Ǿ������� ���� ��
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%05%';

-- _: �� �̿��ؼ� ���ڸ� ǥ�� �� �� �ִ�.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '___05%';

-- IS NULL (NULL ���� ã��)
SELECT * FROM employees
WHERE commission_pct IS NULL;

SELECT * FROM employees
WHERE commission_pct IS NOT NULL;

-- AND, OR
-- AND�� OR���� ���� ������ ����.
-- ��ȣ () ����ϸ� �켱 ������ �ö�.
SELECT * FROM employees
WHERE job_id = 'IT_PROG'
OR job_id = 'FI_MGR'
AND salary >= 6000;

SELECT * FROM employees
WHERE (job_id = 'IT_PROG'
OR job_id = 'FI_MGR')
AND salary >= 6000;

-- �������� ����(SELECT ������ ���� �������� ��ġ�˴ϴ�.)
-- ASC: aecending �������� -> ������ �����մϴ�.
-- DESC: descending ��������
-- ORDER BY: ���� �Ѵٴ� ��. �� �������� �ۼ�.
SELECT * FROM employees
ORDER BY hire_date ASC;

SELECT * FROM employees
ORDER BY hire_date DESC;

SELECT * FROM employees
WHERE job_id = 'IT_PROG'
ORDER BY first_name ASC;

SELECT * FROM employees
WHERE salary >= 5000
ORDER BY employee_id DESC;

-- AS: �̸��� �ٿ��� ���� ���
SELECT 
    first_name,
    salary*12 AS pay
FROM employees
ORDER BY pay ASC;

