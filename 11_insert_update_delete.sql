
-- INSERT
-- 테이블 구조 확인
DESC departments;

-- INSERT 첫번째 방법 (모든 컬럼 데이터를 한 번에 지정해서 삽입)
INSERT INTO departments
VALUES(300, '개발부', 100, 1500);  -- 모든 값을 다 줘야한다.
-- VALUES(300, '개발부'); -- 에러 -> 칼럼을 지정하지 않고 값만 주는 경우에는 모든 값을 다 줘야 한다. (NIULL 허용 여부 상관 없이)

SELECT * FROM departments;
ROLLBACK; -- 실행 시점을 다시 되돌리는 키워드 (마지막 커밋 시점으로 되돌려준다.)

-- INSERT의 두번째 방법 (직접 칼럼을 지정하고 저장, NOT NULL 칼럼을 확인하세요!)
INSERT INTO departments
    (department_id, location_id) -- 에러 -> department_namedl이 NOT NULL!
VALUES
    (301, 1500);

-- 사본 테이블 생성
-- 사본 테이블을 생성 할 때 그냥 생성-> 조회된 데이터 까지 모두 복사
-- WHERE절에 false값 (1 = 2) 지정하면 -> 테이블의 구조만 복사되고 데이터는 복사 X
-- CTA문은 컬럼의 구종와 데이터를 복사할 뿐, 제약조건(PK, FK...)은 복제되지 않습니다.
CREATE TABLE emps AS
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1 = 2); -- 구조만 따고 싶을때 false 값을주면 내부 데이터는 복사되지 않는다.

SELECT * FROM emps;
DROP TABLE emps; -- 테이블 삭제

DESC emps;

--INSERT에 (서브쿼리)
INSERT INTO emps
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE department_id = 50);

--------------------------------------------------------------------------------

-- UPDATE
-- 데이터를 수정한다.
-- UPDATE 테이블 이름 SET 컬럼=값, 컬럼=값... WHERE 누구를 수정할지 (조건)
CREATE TABLE emps AS
(SELECT * FROM employees);

SELECT * FROM emps;

-- UPDATE를 진행할 때는 누구를 수정할 지 조건으로 잘 지목해야 합니다.
-- 그렇지 않으면 수정 대상이 전체 테이블로 지정됩니다.
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

-- UPDATE (서브쿼리)
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
-- DELETE도 WHERE을 지정하지 않으면 테이블 전체 행이 대상이 됩니다.
-- DELETE 는 컬럼을 지정하지 않는다. 무조건 삭제 대상이 한 행을 지운다!!
-- 컬러 하나의 값을 수정 or 삭제 하고싶으면 UPDATE로 해야한다.
-- 데이터를 지울때
DELETE FROM emps
WHERE employee_id = 103;


-- DELETE (서브쿼리)
DELETE FROM emps
WHERE department_id = (SELECT department_id FROM departments
                        WHERE department_name = 'IT');


DELETE FROM departments
WHERE department_name = '개발부';


