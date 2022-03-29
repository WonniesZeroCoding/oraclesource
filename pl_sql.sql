--PL/SQL
--SQL �����δ� ������ ��ưų� ���� �Ұ����� �۾����� �����ϱ� ���ؼ�
--�����ϴ� ���α׷��� ���

-- �� ���α׷����� �ϱ� ���ؼ�
-- �˾ƾ��� Ű����
-- declare(�����) : ����, ���, Ŀ�� ���� ����(���� ���� --> ������ ���͵� �ǰ� �ȵ��͵� �ȴ�)
-- begin(�����) : ���ǹ�, �ݺ���, select, dml(u,d,i), �Լ� ���� ����(�ʼ�)
-- exception(����ó����) : ����(���ܻ���) �ذ�(���� ����)

set serveroutput on -- ���� ����� ȭ�鿡 ���

-- Hello ���
BEGIN
    dbms_output.put_line('Hello! PL/SQL');
END;
/

DECLARE
    -- ��������
    v_empno NUMBER(4) := 7788;
    v_ename VARCHAR2(10);
BEGIN
    v_ename := 'SCOTT';
    dbms_output.put_line('V_EMPNO : ' || v_empno);
    dbms_output.put_line('V_ENAME : ' || v_ename);
END;
/

DECLARE
    -- ��� ����
    v_tax CONSTANT NUMBER(1) := 3;
BEGIN
    dbms_output.put_line('v_tax : ' || v_tax);
END;
/



-- ������ �⺻�� ����
DECLARE
    v_deptno NUMBER(2) DEFAULT 10;
BEGIN
    dbms_output.put_line('v_deptno : ' || v_deptno);
END;
/


-- NOT NULL
DECLARE
    v_deptno NUMBER(2) NOT NULL := 10;
BEGIN
    dbms_output.put_line('v_deptno : ' || v_deptno);
END;
/



-- if ���ǹ�
-- 1) if ~ then
-- 2) if ~ then ~ else
-- 3) if ~ then ~ elsif

-- v_number ���� �����ϰ� 13 ���� �Ҵ��� �� �ش纯���� Ȧ, ¦ ���
DECLARE
    v_number NUMBER := 13;
BEGIN
    IF MOD(v_number, 2) = 1 THEN
        dbms_output.put_line('Ȧ��');
    END IF;
END;
/

DECLARE
    v_number NUMBER := 14;
BEGIN
    IF MOD(v_number, 2) = 1 THEN
        dbms_output.put_line('Ȧ��');
    ELSE
        dbms_output.put_line('¦��');
    END IF;
END;
/

DECLARE
    v_number NUMBER := 87;
BEGIN
    IF v_number >= 90 THEN
        dbms_output.put_line('A����');
    ELSIF v_number >= 80 THEN
        dbms_output.put_line('B����');
    ELSIF v_number >= 70 THEN
        dbms_output.put_line('C����');
    ELSIF v_number >= 60 THEN
        dbms_output.put_line('D����');
    ELSE
        dbms_output.put_line('F����');
    END IF;
END;
/


-- case ~ with ����
DECLARE
    v_score NUMBER := 77;
BEGIN
    CASE trunc(v_score / 10)
        WHEN 10 THEN
            dbms_output.put_line('A����');
        WHEN 9 THEN
            dbms_output.put_line('B����');
        WHEN 8 THEN
            dbms_output.put_line('C����');
        WHEN 7 THEN
            dbms_output.put_line('D����');
        ELSE
            dbms_output.put_line('f����');
    END CASE;
END;
/


-- �ݺ��� 
-- loop ~ end loop
-- while loop ~ end loop
-- for loop
-- cursor

DECLARE
    v_deptno NUMBER := 0;
BEGIN
    LOOP
        dbms_output.put_line('���� v_deptno : ' || v_deptno);
        v_deptno := v_deptno + 1;
        EXIT WHEN v_deptno > 4;
    END LOOP;
END;
/

DECLARE
    v_deptno NUMBER := 0;
BEGIN
    WHILE v_deptno < 4 LOOP
        dbms_output.put_line('���� v_deptno : ' || v_deptno);
        v_deptno := v_deptno + 1;
    END LOOP;
END;
/

DECLARE
    v_deptno NUMBER := 0;
-- ���� ��.. ���ᰪ : �ݺ����� ���ؼ� ���۰�~ ���ᰪ�� ���
BEGIN
    FOR i IN 0..4 LOOP
        dbms_output.put_line('���� i : ' || i);
    END LOOP;
END;
/

DECLARE
    v_deptno NUMBER := 0;
-- ���� ��.. ���ᰪ : �ݺ����� ���ؼ� ���۰�~ ���ᰪ�� ���
BEGIN
    FOR i IN REVERSE 0..4 LOOP
        dbms_output.put_line('���� i : ' || i);
    END LOOP;
END;
/

-- ���� 1~10���� ���(Ȧ����

BEGIN
    FOR i IN 1..10 LOOP
        IF MOD(i, 2) = 1 THEN
            dbms_output.put_line('i : ' || i);
        END IF;
    END LOOP;
END;
/
    
-- ���� Ÿ�� ���� ��, Ư�� ���̺��� �÷� �� ����
DECLARE
    v_deptno dept.deptno%TYPE := 50;
BEGIN
    dbms_output.put_line('v_deptno : ' || v_deptno);
END;
/

-- ���� Ÿ�� ���� �� Ư�� ���̺��� �ϳ��� �÷��� �ƴ� �� ���� ��ü ����
DECLARE
    v_dept_row dept%rowtype;
BEGIN
    SELECT
        deptno,
        dname,
        loc
    INTO v_dept_row
    FROM
        dept
    WHERE
        deptno = 40;

    dbms_output.put_line('DEPTNO : ' || v_dept_row.deptno);
    dbms_output.put_line('DNAME : ' || v_dept_row.dname);
    dbms_output.put_line('LOC : ' || v_dept_row.loc);
END;
/

-- Ŀ�� (CURSOR) 
-- SELECT , DELETE, UPDATE, INSERT SQL �� ����� �ش� SQL���� ó���ϴ� ������
-- ������ �޸� ����

-- select into ��� : ��� ���� �ϳ��� �� ��밡��
-- ��� ���� �� ������ �� �� ���� ��� cursor ���

-- 1) ����� Ŀ��
-- Ŀ�� ���� : declare
-- Ŀ�� ���� : open
-- Ŀ������ �о�� �����͸� ��� : fetch
-- Ŀ�� �ݱ� : close

DECLARE 
    -- Ŀ�� �����͸� �Է��� ���� ����
    v_dept_row dept%rowtype;
    --����� Ŀ�� ����
    CURSOR c1 IS
    SELECT
        deptno,
        dname,
        loc
    FROM
        dept
    WHERE
        deptno = 40;

BEGIN
    OPEN c1; -- Ŀ������   

    FETCH c1 INTO v_dept_row; --�о�� ������ ���

    dbms_output.put_line('deptno : ' || v_dept_row.deptno);
    dbms_output.put_line('dname : ' || v_dept_row.dname);
    dbms_output.put_line('loc : ' || v_dept_row.loc);
    CLOSE c1; --Ŀ�� �ݱ�
END;
/




-- ���� ���� ��ȸ�Ǵ� ���

DECLARE 
    -- Ŀ�� �����͸� �Է��� ���� ����
    v_dept_row dept%rowtype;
    --����� Ŀ�� ����
    CURSOR c1 IS
    SELECT
        deptno,
        dname,
        loc
    FROM
        dept;

BEGIN
    OPEN c1; -- Ŀ������   

    LOOP
        FETCH c1 INTO v_dept_row; --�о�� ������ ���

        EXIT WHEN c1%notfound; -- Ŀ������ ���̻� �о�� ���� ���� �� ����

        dbms_output.put_line('deptno : ' || v_dept_row.deptno);
        dbms_output.put_line('dname : ' || v_dept_row.dname);
        dbms_output.put_line('loc : ' || v_dept_row.loc);
    END LOOP;

    CLOSE c1; --Ŀ�� �ݱ�
END;
/

-- cursor for ~ loop


DECLARE 
    --����ڰ� �Է��� �μ� ��ȣ�� �����ϴ� ���� ����
    v_deptno dept.deptno%TYPE;
    
    --����� Ŀ�� ����
    CURSOR c1 (
        p_deptno dept.deptno%TYPE
    ) IS
    SELECT
        deptno,
        dname,
        loc
    FROM
        dept
    WHERE
        deptno = p_deptno;

BEGIN 
    -- input_deptno�� �μ���ȣ �Է¹ް� v_deptno�� ����
    v_deptno := &input_deptno;

    -- �ڵ� open, fetch, close

    FOR c1_rec IN c1(v_deptno) LOOP
        dbms_output.put_line('deptno : '
                             || c1_rec.deptno
                             || ' dname : '
                             || c1_rec.dname
                             || '   loc : '
                             || c1_rec.loc);
    END LOOP;

END;
/


-- ������ Ŀ�� : Ŀ�� ���� ���� ���
-- select ~ into / dml(update/delete/insert)
-- SQL%ROWCOUNT : ������ Ŀ�� �ȿ� ����� ���� ������ ���� �� ���
-- sql%found : ���õ� Ŀ�� �ȿ� ����� ���� ������ TRUE, ������ FALSE
-- sql%isopen : �ڵ����� SQL���� ������ �� CLOSE �Ǳ� ������ �׻� FALSE
-- sql%notfound : Ŀ�� �ȿ� ����� ���� ������ TRUE, ������ FALSE
BEGIN
    UPDATE dept_temp
    SET
        dname = 'DATABASE'
    WHERE
        deptno = 60;

    dbms_output.put_line('���ŵ� ���� �� : ' || SQL%rowcount);
    IF SQL%found THEN
        dbms_output.put_line('���� ��� �� ���� ���� : TRUE');
    ELSE
        dbms_output.put_line('���� ��� �� ���� ���� : FALSE');
    END IF;

    IF SQL%isopen THEN
        dbms_output.put_line('Ŀ���� open ���� : TRUE');
    ELSE
        dbms_output.put_line('Ŀ���� open ���� : FALSE');
    END IF;

END;
/

COMMIT;
-- ���� ���� ���α׷�( �̸�����, ����, ������ �� �ѹ� ������, �����ؼ� ��� ����
-- �ٸ� �������α׷����� ȣ�Ⱑ��)
-- 1) ���� ���ν��� : SQL ���������� ��� �Ұ�
-- 2) ���� �Լ� : SQL ������ ��� ����
-- 3) Ʈ���� : Ư�� ��Ȳ�� �߻��� ��, �ڵ����� ���޾� ������ ����� �����ϴ� �� ���
-- 4) ��Ű�� : ���� ���� ���α׷��� �׷�ȭ�� �� ���


CREATE PROCEDURE pro_noparam IS
    v_empno NUMBER(4) := 7788;
    v_ename VARCHAR2(10);
BEGIN
    v_ename := 'scott';
    dbms_output.put_line('v_empno : ' || v_empno);
    dbms_output.put_line('v_ename : ' || v_ename);
END;
/ -- ������� ���ν����� �ϳ� ����. ������ �ȵŰ� ������ ��Ŵ

execute pro_noparam; -- ����� ���ν����� �ҷ��ͼ� ����


-- �ٸ� PL/SQL ��Ͽ��� ���ν��� ���� ����
BEGIN
    pro_noparam;
END;
/

--���ν��� �ۼ� �� �Ķ���Ͱ� �����ϴ� ���
-- in(�⺻ Ű�����̱� ������ ��������)
CREATE OR REPLACE PROCEDURE pro_param_in (
    param1 IN NUMBER,
    param2 NUMBER,
    param3 NUMBER := 3,
    param4 NUMBER DEFAULT 4
) -- ���� �����ϴ� ����� ���� ���� ��
 IS
BEGIN
    dbms_output.put_line('param1 : ' || param1);
    dbms_output.put_line('param2 : ' || param2);
    dbms_output.put_line('param3 : ' || param3);
    dbms_output.put_line('param4 : ' || param4);
END;
/

execute pro_param_in(1,2);

execute pro_param_in(5,6,7,8);


execute pro_param_in(1); -- �޼ҵ� ȣ�� ��, ���� �����ϰ� ���� �Ͱ� ������ ���� �߻� PLS-00306: wrong number or types of arguments in call to 'PRO_PARAM_IN'


-- OUT ���
CREATE OR REPLACE PROCEDURE pro_param_out (
    in_empno  IN emp.empno%TYPE,
    out_ename OUT emp.ename%TYPE, -- ���⼭ OUT�� return��(��������) ����
    out_sal   OUT emp.sal%TYPE
) IS
BEGIN
    SELECT
        ename,
        sal
    INTO
        out_ename,
        out_sal
    FROM
        emp
    WHERE
        empno = in_empno;

END;
/

DECLARE
    v_ename emp.ename%TYPE;
    v_sal   emp.sal%TYPE;
BEGIN
    pro_param_out(7369, v_ename, v_sal);
    dbms_output.put_line('ename : ' || v_ename);
    dbms_output.put_line('sal : ' || v_sal);
END;
/


-- in out ���
CREATE OR REPLACE PROCEDURE pro_param_in_out (
    in_out_no IN OUT NUMBER
) IS
BEGIN
    in_out_no := in_out_no * 2;
END;
/

DECLARE
    no NUMBER;
BEGIN
    no := 5;
    pro_param_in_out(no);
    dbms_output.put_line('no : ' || no);
END;
/


-- Ʈ����
-- DML Ʈ����
-- create or replace trigger Ʈ���� �̸�
-- �߻��ñ� : before | after
-- DML���� : insert | update | delete on
-- begin 
-- end

CREATE TABLE emp_trg
    AS
        SELECT
            *
        FROM
            emp;

-- emp_trg �� insert�۾� (�ָ��� ������� �߰� ��, ���� �߻�), update, delete�� �ȵǵ��� ����

CREATE OR REPLACE TRIGGER emp_trg_weekend BEFORE
    INSERT OR UPDATE OR DELETE ON emp_trg
BEGIN
    IF to_char(sysdate, 'DY') IN ( '��', '��' ) THEN
        IF inserting THEN
            raise_application_error(-30000, '�ָ� ������� �߰� �Ұ�');
        ELSIF updating THEN
            raise_application_error(-30001, '�ָ� ������� ���� �Ұ�');
        ELSIF deleting THEN
            raise_application_error(-30002, '�ָ� ������� ���� �Ұ�');
        ELSE
            raise_application_error(-30003, '�ָ� ������� ���� �Ұ�');
        END IF;
--���� ���� - == > �ָ��� �� �۾���(update, delete, insert)�� �ϰ� �Ǹ� �̷��� ���� �޼��� �߻�
--ORA-21000: error number argument to raise_application_error of -30001 is out of range
--ORA-06512: at "SCOTT.EMP_TRG_WEEKEND", line 6
--ORA-04088: error during execution of trigger 'SCOTT.EMP_TRG_WEEKEND'
    END IF;
END;
/

UPDATE emp_trg
SET
    sal = 3500
WHERE
    empno = 7369;

DELETE FROM emp_trg
WHERE
    empno = 7369;
    
    
-- Ʈ���� �߻� ���� ���̺� ����
CREATE TABLE emp_trg_log (
    tablename   VARCHAR(20), -- dml�� ����� ���̺� �̸�
    dml_type    VARCHAR(10),  -- dml ��ɾ� ����
    empno       NUMBER(4),   -- dml ����� �� �����ȣ
    user_name   VARCHAR(30), -- dml�� ������ user ��
    change_date DATE         -- dml �õ� ��¥
);

CREATE OR REPLACE TRIGGER emp_trg_weekend_log AFTER
    INSERT OR UPDATE OR DELETE ON emp_trg
    FOR EACH ROW
BEGIN
    IF inserting THEN
        INSERT INTO emp_trg_log VALUES (
            'emp_trg',
            'insert',
            :new.empno,
            sys_context('USERENV', 'SESSION_USER'),
            sysdate
        );

    ELSIF updating THEN
        INSERT INTO emp_trg_log VALUES (
            'emp_trg',
            'update',
            :old.empno,
            sys_context('USERENV', 'SESSION_USER'),
            sysdate
        );

    ELSIF deleting THEN
        INSERT INTO emp_trg_log VALUES (
            'emp_trg',
            'delete',
            :old.empno,
            sys_context('USERENV', 'SESSION_USER'),
            sysdate
        );

    END IF;
END;
/

INSERT INTO emp_trg VALUES (
    9999,
    'test_tmp',
    'clerk',
    7788,
    '2018-03-03',
    1200,
    NULL,
    20
);


-- 
DROP TRIGGER emp_trg_weekend_log;