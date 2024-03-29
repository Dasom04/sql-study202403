
--MERGE: 테이블 병합.

/*
UPDATE와 INSERT를 한 방에 처리.

한 테이블에 해당하는 데이터가 존재한다면 UPDATE를
없으면 INNSERT로 처리해라.
*/

CREATE TABLE emps_it AS (SELECT * FROM employees WHERE 1 = 2); 

INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES
    (106, '춘식', '김', 'CHOONSIK', sysdate, 'IT_PROG');

SELECT * FROM emps_it;
    
SELECT * FROM employees
WHERE job_id = 'IT_PROG';

-- MERGE
MERGE INTO emps_it a -- 머지를 할 타겟 테이블
    USING -- 병합시킬 데이터 (테이블 이름, 서브쿼리 등...) 이걸 넣겠다 라는 뜻.
    (SELECT * FROM employees
    WHERE job_id = 'IT_PROG') b -- 병합하고자 하는 데이터를 서브쿼리로 표현.
    ON -- 병합시킬 데이터의 연결 조건
        (a.employee_id = b.employee_id) -- employee_id 컬럼을 통해 양쪽 테이블의 데이터 존재 유무 확인.
-- 같이 존재하면 update, 없으면 insert가 일어난다.
WHEN MATCHED THEN -- 바로 위의 작성한 조건이 일치하는 경우 (데이터가 서로 있는 경우)
    UPDATE SET -- 안에 매치된다면 코드로, 매치되지 않으면 업데이트 되지않음
        a.phone_number = b.phone_number,
        a.hire_date = b.hire_date,
        a.salary = b.salary,
        a.commission_pct = b.commission_pct,
        a.manager_id = b.manager_id,
        a.department_id = b.department_id
        
    /*
        DELETE만 단독으로 쓸 수는 없습니다.
        UPDATE 이후에 DELETE 작성이 가능합니다.
        UPDATE 된 대상을 DELETE 하도록 설계되어 있기 때문에 (update안하면 진행이 안됨)
        삭제할 대상 컬럼들을 동일한 값으로 일단 UPDATE를 진행하고
        DELETE의 WHERE절에 아까 지정한 동일한 값을 지정해서 삭제합니다.
    */   
        
    DELETE
        WHERE a.employee_id = b.employee_id
        
        
WHEN NOT MATCHED THEN -- 조건이 일치하지 않는 경우
    INSERT VALUES -- 매치되지 않으면 위에가 매치되지 ㅏㅇㄶ는다는것
    (b.employee_id, b.first_name, b.last_name,
    b.email, b.phone_number, b.hire_date, b.job_id,
    b.salary, b.commission_pct, b.manager_id, b.department_id);
    
SELECT * FROM emps_it;

--------------------------------------------------------------------------------

INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(102, '렉스', '박', 'LEXPARK', '01/04/06', 'AD_VP');
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(101, '니나', '최', 'NINA', '20/04/06', 'AD_VP');
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(103, '흥민', '손', 'HMSON', '20/04/06', 'AD_VP');

/*
employees 테이블을 매번 빈번하게 수정되는 테이블이라고 가정하자.
기존의 데이터는 email, phone, salary, comm_pct, man_id, dept_id을
업데이트 하도록 처리
새로 유입된 데이터는 그대로 추가.
*/

MERGE INTO emps_it a
    USING 
        employees b
    ON 
        (a.employee_id = b.employee_id)
WHEN MATCHED THEN
    UPDATE SET
        a.email = b.email,
        a.phone_number = b.phone_number,
        a.hire_date = b.hire_date,
        a.salary = b.salary,
        a.commission_pct = b.commission_pct,
        a.manager_id = b.manager_id,
        a.department_id = b.department_id

WHEN NOT MATCHED THEN
     INSERT VALUES 
    (b.employee_id, b.first_name, b.last_name,
    b.email, b.phone_number, b.hire_date, b.job_id,
    b.salary, b.commission_pct, b.manager_id, b.department_id);

SELECT * FROM emps_it
ORDER BY employee_id ASC;

ROLLBACK;


--------------------------------------------------------------------------------
SELECT * FROM departments;
SELECT * FROM depts;
ROLLBACK;
-- 문제 1
CREATE TABLE depts AS (SELECT * FROM departments);

-- null값을 넣을때는 칼럼을 지정 해줘야 하고 모든 칼럼에 데이터를 넣는거면 칼럼 생략이 가능하다.
INSERT INTO depts
(department_id, department_name, manager_id, location_id)
VALUES (280, '개발',null, 1800);

INSERT INTO depts
(department_id, department_name, manager_id, location_id)
VALUES (290, '회계부',null, 1800);

INSERT INTO depts
VALUES (300, '재정', 301, 1800);

INSERT INTO depts
VALUES (310, '인사', 302, 1800);

INSERT INTO depts
VALUES (320, '영업', 303, 1700);


-- 문제 2
-- 2-1
UPDATE depts SET department_name = 'IT bank'
WHERE department_name = 'IT Support';


-- 2-2
UPDATE depts SET manager_id = 301
WHERE department_id = 290;


-- 2-3
UPDATE depts 
SET  
    department_name = 'IT Help',
    manager_id = 303,
    location_id = 1800
WHERE department_name = 'IT Helpdesk';
rollback;

-- 2-4
UPDATE depts
SET manager_id = 301
WHERE department_id IN (209, 300, 310, 320);


-- 문제 3
-- 3-1
DELETE FROM depts WHERE department_id = (SELECT department_id FROM depts
                                            WHERE department_name = '영업');


-- 3-2
DELETE FROM depts WHERE department_id = (SELECT department_id FROM depts
                                            WHERE department_name = 'NOC');


-- 문제 4
-- 4-1
DELETE FROM depts WHERE department_id > 200;


-- 4-2
UPDATE depts
SET manager_id = 100
WHERE manager_id IS NOT NULL;


-- 4-4
MERGE INTO depts a
        USING departments d
        ON (a.department_id = d.department_id)
        WHEN MATCHED THEN 
        UPDATE SET
        a.department_name = d.department_name,
        a.manager_id = d.manager_id,
        a.location_id = d.location_id
        
WHEN NOT MATCHED THEN 
    INSERT VALUES
    (d.department_id, d.department_name, d.manager_id, d.location_id);


-- 문제 5
CREATE TABLE jobs_it AS
(SELECT * FROM jobs WHERE min_salary > 6000);

SELECT * FROM jobs_it;


-- 5-2
INSERT INTO jobs_it VALUES ('IT_DEV', '아이티개발팀', 6000, 20000);
INSERT INTO jobs_it VALUES ('NET_DEV', '네트워크개발팀', 6000, 20000);
INSERT INTO jobs_it VALUES ('SEC_DEV', '보안개발팀', 6000, 20000);

rollback;
-- 5-4
MERGE INTO jobs_it a
    USING (SELECT * FROM jobs WHERE min_salary > 5000) b
    ON (a.job_id = b.job_id)
    
WHEN MATCHED THEN
    UPDATE SET
    a.min_salary = b.min_salary,
    a.max_salary = b.max_salary
    
WHEN NOT MATCHED THEN
    INSERT VALUES
    (b.job_id, b.job_title, b.min_salary, b.max_salary);
        










