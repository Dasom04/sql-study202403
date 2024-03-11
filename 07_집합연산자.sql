
-- ���� ������
-- ���� �ٸ� ���� ����� ����� �ϳ��� ����, ��, ���̸� ���� �� �ְ� �� �ִ� ������
-- UNION(������ �ߺ�x), UNION ALL(������ �ߺ� o), INTERSECT(������), MINUS(������)
-- �� �Ʒ� column ������ ������ Ÿ���� ��Ȯ�� ��ġ�ؾ� �մϴ�.

-- UNION  �ߺ������͸� ������� �ʴ´�.
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date Like '04%'
UNION   
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;




-- UNION ALL -> �ߺ� ������ ���.

SELECT
    employee_id, first_name
FROM employees
WHERE hire_date Like '04%'
UNION ALL  
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;




SELECT
    employee_id, first_name
FROM employees
WHERE hire_date Like '04%'
INTERSECT
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;




SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20
MINUS  
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date Like '04%';

