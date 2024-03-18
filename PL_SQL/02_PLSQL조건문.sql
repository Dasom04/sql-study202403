
DECLARE
    v_salary Number := 0;
    v_department_id NUMBER := 0;
BEGIN
    
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10, 110), -1);
    dbms_output.put_line('생성된 난수:' || v_department_id);
    
    SELECT 
        salary
    INTO
        v_salary
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM = 1; -- 첫째 값만 구해서 변수에 저장.
    
    IF
        v_salary <= 5000 -- true라면
    THEN 
        dbms_output.put_line('급여가 낮음!'); -- 조건
    ELSIF
        v_salary <= 9000
    THEN
        dbms_output.put_line('급여가 중간임!');
    ELSE
        dbms_output.put_line('급여가 높음!');
    END IF;
    
END;



























