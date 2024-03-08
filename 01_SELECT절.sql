
-- 오라클의 한 줄 주석입니다.

/*
여러 줄 주석입니다.
하하하~
*/

-- 키워드랑 식별자는 대소문자 구분 안한다.
-- SELECT [컬럼명(여러 개 가능)] FROM [테이블 이름] /키워드는 대문자로 
SELECT
    *
FROM
    employees;

SELECT
    employee_id,
    first_name,
    last_name
FROM  -- 프롬절 다음에는 테이블
    employees;
    
SELECT email, phone_number, hire_date
FROM    employees;

-- 컬럼을 조회하는 위치에서 * / + - 연산이 가능합니다.
-- 조회 내용에만 포함됨 원본 테이블에 저장되진 않음
SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    salary + salary*0.1 AS 성과금
    
FROM employees;

-- NULL값의 확인 (숫자 0이나 공백과는 다른 존재입니다. 아예 값이 없음을 의미한다.)
SELECT department_id, commission_pct
FROM employees;

-- alias (컬럼명, 테이블명의 이름을 변경해서 조회합니다.)
SELECT 
    first_name AS 이름,
    last_name AS 성,
    salary AS 급여
FROM employees;

/*
오라클은 홑따옴표('')로 문자를 표현하고, 문자열 안에 홑따옴표 특수 기호를 표현하고
싶다면 ''를 두 번 여녹으로 쓰시면 됩니다.
문자열 연결 기호는 || 입니다. 문자열의 덧셈 연산을 허용하지 않습니다.
*/
SELECT
    first_name || ' ' || last_name || '''s salary is $' || salary AS 급여내역
FROM employees;

-- DISTINCT (중복 행의 제거)
SELECT department_id FROM employees;
SELECT DISTINCT department_id FROM employees;

-- ROWNUM, ROWID (행 번호와 행 아이디 ROWID: 주소 값)
-- **ROWNUM: 쿼리에 의해 반환되는 행 번호를 출력
-- ROWID: 데이터베이스 내의 행의 주소를 반환
SELECT ROWNUM, ROWID, employee_id
FROM employees;






















