
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























