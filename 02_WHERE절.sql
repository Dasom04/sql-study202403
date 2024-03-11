
SELECT * FROM employees;

-- 오라클은 = 하나만 쓴다.
-- 데이터는 대문자 소문자를 구별하기 때문에 잘 확인해서 써야한다.
-- 키워드랑 식별자는 대소문자 구분 안한다.
-- WHERE절 비교 (데이터 값은 대/소문자를 구분합니다.)
SELECT first_name, last_name, job_id
FROM employees
WHERE job_id = 'IT_PROG';

SELECT *
FROM employees
WHERE last_name = 'king';

SELECT *
FROM employees
WHERE department_id = 50;

-- AND: 좌항, 우항 둘다 true
SELECT *
FROM employees
WHERE salary >= 15000
AND salary < 20000;

-- 날짜 타입
SELECT *
FROM employees
WHERE hire_date = '04/01/30';

-- 데이터의 행 제안 (BETWEEN, IN, LIKE)
SELECT * FROM employees
WHERE salary BETWEEN 15000 AND 20000;

-- 03/01/01 부터 03/12/31 까지
SELECT * FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31'; 

-- IN 연산자의 사용 (특정 값들과 비교할 때 사용)
-- 이 안에 있니? 라는 뜻
SELECT * FROM employees
WHERE manager_id IN (100, 101, 102);

SELECT * FROM employees
WHERE job_id IN ('IT_ PROG','AD_VP');

-- LIKE 연산자 (지정 문자열 포함 여부)
-- %는 어떤한 문자든, _는 데이터의 자리 (위치)를 표현할 때
-- %: anything % 앞에 문자 or 숫자 있으면 ~으로 시작한다면 이라는 뜻, % 뒤에 있으면 ~으로 끝나는것을 다 보여준다.
-- 검색 기능 만들 때 많이 사용
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date Like '%15';

-- 05가 포함 되어있으면 전부 다
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%05%';

-- _: 를 이용해서 글자를 표현 할 수 있다.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '___05%';

-- IS NULL (NULL 값을 찾음)
SELECT * FROM employees
WHERE commission_pct IS NULL;

SELECT * FROM employees
WHERE commission_pct IS NOT NULL;

-- AND, OR
-- AND가 OR보다 연산 순서가 빠름.
-- 괄호 () 사용하면 우선 순위가 올라감.
SELECT * FROM employees
WHERE job_id = 'IT_PROG'
OR job_id = 'FI_MGR'
AND salary >= 6000;

SELECT * FROM employees
WHERE (job_id = 'IT_PROG'
OR job_id = 'FI_MGR')
AND salary >= 6000;

-- 데이터의 정렬(SELECT 구문의 가장 마지막에 배치됩니다.)
-- ASC: aecending 오름차순 -> 생략이 가능합니다.
-- DESC: descending 내림차순
-- ORDER BY: 정렬 한다는 뜻. 맨 마지막에 작성.
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

-- AS: 이름을 붙여줄 때도 사용
SELECT 
    first_name,
    salary*12 AS pay
FROM employees
ORDER BY pay ASC;

