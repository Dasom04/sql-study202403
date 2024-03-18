
/*
���ν����� divisor_proc
���� �ϳ��� ���޹޾� �ش� ���� ����� ������ ����ϴ� ���ν����� �����մϴ�.
*/

CREATE OR REPLACE PROCEDURE divisor_proc
    (p_num IN NUMBER)
IS
    v_count NUMBER := 0;
BEGIN
    FOR i IN i..p_num
    LOOP 
        IF MOD(p_num,i) = 0 THEN
            v_count := v_count + 1 ;
        END IF;
    END LOOP;
    dbms_output.put_line('����� ����: ' || v_count || '��');
END;

EXEC divisor_proc(72);

/*
�μ���ȣ, �μ���, �۾� flag(I: insert, U:update, D:delete)�� �Ű������� �޾� 
depts ���̺� 
���� INSERT, UPDATE, DELETE �ϴ� depts_proc �� �̸��� ���ν����� ������.
�׸��� ���������� commit, ���ܶ�� �ѹ� ó���ϵ��� ó���ϼ���.
*/
CREATE OR REPLACE PROCEDURE depts_proc
    (
        p_dept_id IN dept.department_id%TYPE,
        p_dept_name IN dept.department_name%TYPE,
        p_flag IN VARCHAR2
    )
    
IS
  v_cnt NUMBER := 0;
BEGIN
    
    SELECT COUNT(*)
    INTO v_cnt
    FROM depts
    WHERE department_id = p_dept_id;
    
    IF p_flag = 'I' THEN
        INSERT INTO depts
        (department_id, department_name)
        VALUES(p_dept_id, p_dept_name);
    ELSIF p_flag = 'U' THEN
        UPDATE depts
        SET department_name = p_dept_name
        WHERE department_id = p_dept_id;
    ELSIF p_flag = 'D' THEN
        DELETE FROM depts
        WHERE department_id = p_dept_id;
    ELSE
        dbms_output.put_line('�ش� flag�� ���� ������ �غ���� �ʾҽ��ϴ�.');
    END IF;
    
    COMMIT;
    
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('���ܰ� �߻��߽��ϴ�.');
            dbms_output.put_line('ERROR msg: ' || SQLERRM);
            ROLLBACK;
END;

EXEC dept_proc(400, '���ߺ�', 'I');




/*
employee_id�� ���޹޾� employees�� �����ϸ�,
�ټӳ���� out�ϴ� ���ν����� �ۼ��ϼ���. (�͸��Ͽ��� ���ν����� ����)
���ٸ� exceptionó���ϼ���
*/





















