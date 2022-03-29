-- DEPT ���̺��� ���� ��ȸ ( COLUMN ��, NULL ����, �ڷ��� )
    -- DEPTNO(�μ���ȣ) , DNAME(�μ���) , LOC(��ġ)
DESC dept;

-- EMP ���̺��� ���� ��ȸ
    -- EMPNO(�����ȣ) , ENAME(�����) , JOB(��å) , MGR(���ӻ��) , HIREDATE(�Ի���) , SAL(�޿�) , COMM(�߰�����) , DEPTNO(�μ���ȣ)
DESC emp;

-- SALGRADE ���̺��� ���� ��ȸ
    -- GRADE(���) , LOSAL(�����޿�) , HISAL(�ְ�޿�)
DESC salgrade;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- DML
    -- ��ȸ (SELECT)
        -- ���� : SELECT Į���� ... FROM ���̺��;
SELECT
    deptno
FROM
    dept;

SELECT
    deptno,
    dname
FROM
    dept;

SELECT
    *
FROM
    dept;

SELECT
    *
FROM
    emp;

SELECT
    empno,
    ename,
    deptno
FROM
    emp;

SELECT
    deptno
FROM
    emp;
    
        -- DISTINCT : �ߺ� ������ ���� 
            -- ���� : SELECT DISTINCT Į���� FROM ���̺��; ( Į���� �������� ���, ��� Į���� ������ ��츦 �ߺ����� �Ǵ��Ѵ� )
SELECT DISTINCT
    deptno
FROM
    emp;

SELECT DISTINCT
    job,
    deptno
FROM
    emp;
    
        -- ALAIS (��Ī)
            -- ���� : SELECT Į�� AS ��Ī FROM ���̺�� ( AS ���� ���� , ��Ī�� ���⸦ ���� ��� " " �� ���� ���·� �Է��Ѵ� )
SELECT
    ename           AS �̸�,
    sal,
    comm            "�߰� ����",
    sal * 12 + comm AS ����
FROM
    emp;
        
        -- ORDER BY : ���ϴ� ������ ��� ������ ���� ( ���� �ð��� ���� �ɸ� )
            -- ���� : SELECT �÷� FROM ���̺�� ORDER BY �÷��� ���Ŀɼ�(ASC-�������� , DESC-�������� , DEFAULT-ASC)
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal;

SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC,
    sal DESC;
        
        -- WHERE : Ư���� ������ �������� ������ ��ȸ
            -- ���� : SELECT Į�� FROM ���̺� WHERE �÷� = ?; ( ���ڿ� ' ' ) / ( && AND , || OR )
            -- �������� ��ҹ��ڸ� �������� ������, �����Ͱ��� �����Ѵ�.
SELECT
    *
FROM
    emp
WHERE
    deptno = 30;

SELECT
    *
FROM
    emp
WHERE
    empno = 7782;

SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';

SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;

SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';
        
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        
        -- ������
            -- ��������� ( + | - | * | / )
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;
            
            -- (�)�񱳿����� ( < | > | = | ���� �ʴ�( != | <> | ^= ))
SELECT
    *
FROM
    emp
WHERE
    sal >= 3000;

SELECT
    *
FROM
    emp
WHERE
    ename >= 'F'; -- ���� ��Һ� (���ڿ� ���ؼ��� �� ��ȸ ����)
SELECT
    *
FROM
    emp
WHERE
        sal >= 2500
    AND job = 'ANALYST';

SELECT
    *
FROM
    emp
WHERE
    job = 'MANAGER'
    OR job = 'SALESMAN'
    OR job = 'CLERK';

SELECT
    *
FROM
    emp
WHERE
        sal != 3000
    AND sal <> 2000
    AND sal^= 3000;
            
            -- ��(����)������ ( NOT | AND | OR )
SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;
            
            -- IN ������ : "=" �� �ǹ̿� ����.
SELECT
    *
FROM
    emp
WHERE
    job IN ( 'MANAGER', 'SALESMAN', 'CLERK' );

SELECT
    *
FROM
    emp
WHERE
    NOT job IN ( 'MANAGER', 'SALESMAN', 'CLERK' );

SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );
            
            -- BETWEEN a AND b ������ 
SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;

SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;
            
            -- LIKE ������ / ���ϵ�ī�� ( % | _ ) : ���簪�� ã�� ������
                -- ���ϵ�ī�� :  " _ " ( � ���̵� ������� �� �Ѱ��� ���ڵ����� ) / " % " (� ���̵�, ���̿� ������� ��� ���ڵ�����)
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';

SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';
    
    
--- IS NULL / IS NOT NULL ������ (SQL���� ������ =�� null�� ��ã��), NULL�� ã�� �� IS�� �����

-- comm �� null �� ���

SELECT
    *
FROM
    emp
WHERE
    comm IS NULL; -- null���� = ��� ����
    
-- MGR�� NULL�� �ƴ� ��� ��ȸ
SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;
    
-- ���� ������
-- union (������) , minus(������), intersect(������)

-- deptno = 10 or deptno=20 ��� ��ȸ : union ��� // union ���� ������ * :: Į������ ��ġ���Ѷ� , �ٸ��� �ص� Ÿ�Ը� ������ �� ���������. (�䱸�ϴ� ������ ���� �ƴ� �� �ִ�..)
-- union(�ߺ� �� ������)

SELECT
    *
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    *
FROM
    emp
WHERE
    deptno = 20;
    
    
    -- union all (�ߺ� �� ���� ����)
SELECT
    empno,
    ename,
    job
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    job
FROM
    emp
WHERE
    deptno = 10;
--------
--minus
SELECT
    empno,
    ename,
    job,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    job,
    deptno
FROM
    emp
WHERE
    deptno = 10;
---------
-- intersect
SELECT
    empno,
    ename,
    job,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    job,
    deptno
FROM
    emp
WHERE
    deptno = 10;
    
--[����] ��� �̸�(ename)�� s�� ������ ��� �����͸� ����Ѵ�
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%S'; 

--[����] 30�� �μ�(deptno)���� �ٹ��ϰ� �ִ� ��� �߿� ��å(job)�� salesman �� ����� ��ȣ, �̸�, ��å, �޿�, �μ� ��ȣ�� ����Ѵ�
SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
        deptno = 30
    AND job IN 'SALESMAN';


--[����] 20��, 30�� �μ��� �ٹ��ϰ� �ִ� ��� �� �޿�(sal)�� 2000 �ʰ��� ����� ���� �ΰ��� ����� select���� ����Ͽ� �����ȣ, �̸� , ��å, �޿�, �μ���ȣ�� ����ϴ� SQL���� �ۼ��� ���ÿ�
-- ���� �����ڸ� ������� ���� ���
SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
    deptno IN ( 20, 30 )
    AND sal > 2000;
-- ���� �����ڸ� ����� ���

SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
        deptno = 20
    AND sal > 2000
UNION ALL
SELECT
    empno,
    ename,
    job,
    sal,
    deptno
FROM
    emp
WHERE
        deptno = 30
    AND sal > 2000;

-- [����] NOT between a and b �����ڸ� ���� �ʰ�, �޿�(sal) �� ���� 2000�̻� 3000���� ���� �̿��� ���� ���� �����͸� ����ϵ��� sql ���� �ۼ��Ͻÿ�.
SELECT
    *
FROM
    emp
WHERE
    sal < 2000
    OR sal > 3000; 
--[����] ��� �̸��� e �� ���ԵǾ� �ִ� 30�� �μ��� ����� �޿��� 1000~2000 ���̰� �ƴ� ��� �̸�, ��� ��ȣ, �޿�, �μ� ��ȣ�� ����ϴ� sql���� �ۼ�
SELECT
    ename,
    empno,
    sal,
    deptno
FROM
    emp
WHERE
    ename LIKE '%E%'
    AND deptno = 30
    AND sal NOT BETWEEN 1000 AND 2000;
--[����] �߰� ������ �������� �ʰ� ����ڰ� �ְ� ��å�� manager, clerk�� ��� �߿��� ����̸��� �ι�° ���ڰ� L�� �ƴ� ����� ������ ����ϴ� sql ���� �ۼ��Ͻÿ�
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL
    AND mgr IS NOT NULL
    AND job IN ( 'MANAGER', 'CLERK' )
    AND ename NOT LIKE '_L%';
    
-- ����Ŭ �Լ� 

-- ��ҹ��� ���� : UPPER(): �ҹ��� -> �빮��, LOWER(): �빮���� �� -> �ҹ���, INITCAP() : ��ó���� �빮��

SELECT
    ename,
    lower(ENAME)
    initcapINITCAPenameENAME)
    upperUPPERenameENAME
)
    empEMP

;
    
-- dual : sys�� �����ϴ� ���̺�
-- �ӽ� �����̳� �Լ��� ��� �� Ȯ���ϴ� �뵵
    
-- ���ڿ� ���� : length -> ���̸� ���ϴ� ��, lengthb -> ���ڿ� ����Ʈ ���� ��ȯ ( �޸� ���� ����ִ� �Ͱ� ���� ���� )
    lengthLENGTH('�ѱ�')
    lengthbLENGTHB('�ѱ�')
    lengthLENGTH('ab')
    lengthbLENGTHB('ab'
)
    dualDUAL

;
    enameENAME
    lengthLENGTHenameENAME
)
    empEMP

;

-- [�ǽ�] ��å �̸��� 6���� �̻��� ��� ��ȸ
    SELECT
*
    emp
EMP
    lengthLENGTHjobJOB )> =6

;

-- ���ڿ� ���� : Substr(����������, ������ġ, [�������] -������̴� �ɼ�:�� ���� �ְ� �� �� ���� ����)

    jobJOB
    substrSUBSTRjobJOB ,1 ,2)
    substr --job������ ù���� ���� ���� 2�� ����
    SUBSTRjobJOB ,3 ,2)
    substr -- '' 3��° ���� ���� 2�� ����
    SUBSTRjobJOB ,5
) -- '' 5��° ���� ���� ������ ����
    empEMP

;
    
--[����] emp ���̺��� ��� ��� �̸��� ������ ���ں��� ������ ���
--ename, ���⹮�ڿ� ���
    enameENAME
    substrSUBSTRenameENAME ,3
)
    empEMP

;
    
-- ���ڿ� ������ �ȿ��� Ư�� ���� ��ġ ã�� : INSTR(���ڿ�������, ��ġ�� ã������ �ϴ� �κ� ����, ���� ��ġ, ������ġ���� ã������ ���ڰ� ���° ��ġ���� ����)
    instrINSTR('HELLO ORACLE!' ,'L'       ) instr1INSTR1
    instrINSTR('HELLO ORACLE!' ,'L' ,5    ) instr2INSTR2
    instrINSTR('HELLO ORACLE!' ,'L' ,2 ,2 ) instr3
INSTR3
    dualDUAL

;
    
-- ��� �̸��� s�� �ִ� ��� ��ȸ [ó�� ����� ���� like�� �̿�]
    SELECT
*
    emp
EMP
    instrINSTRenameENAME ,'S' ) >0

;
    
-- Ư�� ���ڸ� �ٸ� ���ڷ� ���� : replace(���� ���ڿ�, ã�� ����, �ٲ� ����)
    SELECT                    '010-1234-5678' replace_beforeREPLACE_BEFORE
    replaceREPLACE('010-1234-5678' ,'-' ,' ' ) replace1REPLACE1
    replaceREPLACE('010-1234-5678' ,'-'      ) replace2
REPLACE2
    dualDUAL

;
    
-- ���ڿ� ���� : CONCAT(����1, ����2)
    concatCONCATempnoEMPNO enameENAME
)
    empEMP

;
    concatCONCATempnoEMPNO concatCONCAT(':' enameENAME)
)
    empEMP

;
    
-- ���ڿ� ���� : || <- �ڹٿ��� ���� or ��ȣ
    empno EMPNO| ename
ENAME
    empEMP

;
    empno
    EMPNO| |
    ':'| ename
ENAME
    empEMP

;
    
-- Ư�� ���ڿ� ����(�ƹ��͵� ���ָ� ��������) : TRIM() , LTRIM(), RTRIM() // �ڹ� TRIM������ �¿� ���鸸 �ذ���
    SELECT'         �̰���              '
    ,TRIM('         �̰���              ')
    ltrimLTRIM('         �̰���              ')
    rtrimRTRIM('         �̰���              '
)
    dualDUAL

;
    
 -- �����Լ� 
 -- round() : �ݿø�, trunc() : ����, 
 -- ceil() -> ������ ���� ���� ū ���� �߿��� ���� ���� ����
 -- floor() : ������ ���� ���� ���� ���� �߿��� ���� ū ����
 -- mod() : ������     

    roundROUND(1234.5678      ) roundROUND
    roundROUND(1234.5678 ,0   ) round1ROUND1
    round -- default�� 0�� �ڸ�
    ROUND(1234.5678 ,1   ) round2ROUND2
    round -- �Ҽ��� �������� �Ҽ��� ù°�ڸ�
    ROUND(1234.5678 ,2   ) round3ROUND3
    round -- ��°�ڸ�
    ROUND(1234.5678 , -1 ) round4ROUND4
    round -- �Ҽ����� �������� -1�� �ڸ�(���ʿ��� ��ĭ) : 1�� �ڸ����� �ݿø�
    ROUND(1234.5678 , -2 ) round5
ROUND5 -- �Ҽ����� �������� -2�� �ڸ�: 10�� �ڸ����� �ݿø�
    dualDUAL

;
    truncTRUNC(1234.5678      ) truncTRUNC
    truncTRUNC(1234.5678 ,0   ) trunc1TRUNC1
    truncTRUNC(1234.5678 ,1   ) trunc2TRUNC2
    truncTRUNC(1234.5678 ,2   ) trunc3TRUNC3
    truncTRUNC(1234.5678 , -1 ) trunc4TRUNC4
    truncTRUNC(1234.5678 , -2 ) trunc5
TRUNC5
    dualDUAL

;
    ceilCEIL(3.14)
    floor -- 3�� ���� ����� ����(3,4) �� ū ���� 4
    FLOOR(3.14)
    ceil -- 3�� ���� ����� ���� �� ���� ���� ���� 3
    CEIL( - 3.14)
    floorFLOOR( - 3.14
)
    dualDUAL

;
    modMOD(15 ,6)
    mod -- �ڹٿ��� ��� % -- ������ ���� ������ ����
    MOD(10 ,2)
    modMOD(11 ,2
)
    dualDUAL

;
    
    
-- ��¥ �Լ� : ����(+, -)�� �����ϴ� // Ư�� ���� �������� + �� ������, -�� ����
-- sysdate, current_date, current_timestamp

    sysdateSYSDATE
    current_date -- ������ ���� ���� �� ��. (Oracle����(*������ ��ġ�� ���� ��ġ�� ���� �޶��� �� ����)�� ��ġ�� system ��¥)
    CURRENT_DATE
    current_timestamp
CURRENT_TIMESTAMP
    dualDUAL

;
    sysdate     SYSDATE nowNOW
    sysdate SYSDATE - 1 yesterdayYESTERDAY
    sysdate SYSDATE + 1 tomorrow
TOMORROW --sysdate���� ��¥���� �������� �� ������ ���, �� - �� - �ʵ� �� ����
    dualDUAL

;
    
-- add_months() : ��� ���� ��¥ ���ϱ� 
-- ����  : �ҷ��� ��¥, add_months(�ҷ��� ��¥, ���ؾ��� ��� ����)
    sysdateSYSDATE
    add_monthsADD_MONTHSsysdateSYSDATE ,3
)
    dualDUAL

;
    
-- �Ի� 20�ֳ��� �Ǵ� ����� ��ȸ
    empnoEMPNO
    enameENAME
    hiredateHIREDATE
    add_monthsADD_MONTHShiredateHIREDATE ,240
)
    empEMP

;
    
-- ���� ��¥�� �������� �Ի� 45�� �̸��� ��� ��ȸ --> ������ ���� ���� �ִ�
    SELECT
*
    emp
EMP
    add_monthsADD_MONTHShiredateHIREDATE ,540 ) sysdateSYSDATE

;
    
-- months_between(��¥1, ��¥2) : �� ��¥ ������ ���� ��¥ ���̸� ���� ���� ��� (��¥�� ��¥ ������ ����)

    empnoEMPNO
    enameENAME
    hiredateHIREDATE
    sysdateSYSDATE
    months_betweenMONTHS_BETWEENhiredateHIREDATE sysdateSYSDATE        ) month1MONTH1
    months_betweenMONTHS_BETWEENsysdateSYSDATE hiredateHIREDATE        ) month2MONTH2
    trunc -- ��� �������� ���ؿ� ���� ���� -��, +�� �� �� �ִ�
    TRUNCmonths_betweenMONTHS_BETWEENsysdateSYSDATE hiredateHIREDATE) ) month3
MONTH3 -- ���� �� �� ������ �������� �����Ƿ� �Ҽ������� ������ ������ ������ �̿��ؼ� �������·� ������ ���� �� �ִ�
    empEMP

;
    
-- next_day() : Ư�� ��¥�� �������� ���ƿ��� ������ ��¥ ���
-- last_day() : Ư�� ��¥�� ���� ���� ������ ��¥ ���

    sysdateSYSDATE
    next_dayNEXT_DAYsysdateSYSDATE ,'������')
    last_dayLAST_DAYsysdateSYSDATE
)
    dualDUAL

;
    
-- ����ȯ �Լ�
    empnoEMPNO
    enameENAME
    empno EMPNO +
'500'
    emp
EMP
    ename ENAME ='SMITH'

;

DESC emp

; -- desc => describe

    empnoEMPNO
    enameENAME
    , 'abcd' empno
EMPNO
    emp
EMP
    ename ENAME ='SMITH'

;

-- to_char() : ����, ��¥ �����͸� ���� �����ͷ� ��ȯ�� �� ���
-- to_number() : ���� �����͸� ���� �����ͷ� ��ȯ
-- to_date() : ���� �����͸� ��¥ �����ͷ� ��ȯ

    to_charTO_CHARsysdateSYSDATE ,'YYYY/MM/DD HH24:MI:SS' ) ���糯¥�ð�
���糯¥�ð� -- YYYY�� MM�� DD�Ϸ� ��Ÿ���ڴ�. HH24 24�ð��������� ��:��:�ʷ� ��Ÿ���ڴ�
    dualDUAL

;
    to_charTO_CHARsysdateSYSDATE ,'MM'    ) mmMM
    to_charTO_CHARsysdateSYSDATE ,'MON'   ) monMON
    to_charTO_CHARsysdateSYSDATE ,'MONTH' ) monthMONTH
    to_charTO_CHARsysdateSYSDATE ,'DD'    ) ddDD
    to_charTO_CHARsysdateSYSDATE ,'DY'    ) dyDY
    to_charTO_CHARsysdateSYSDATE ,'DAY'   ) day
DAY
    dualDUAL

;
    to_charTO_CHARsysdateSYSDATE ,'HH24:MI:SS'      ) hh24missHH24MISS
    to_charTO_CHARsysdateSYSDATE ,'HH24:MI:SS AM'   ) hhmiss_amHHMISS_AM
    to_charTO_CHARsysdateSYSDATE ,'HH24:MI:SS P.M.' ) hhmiss_pmHHMISS_PM
    to_charTO_CHARsysdateSYSDATE ,'HH:MI:SS'        ) hhmiss
HHMISS
    dualDUAL

;
    SELECT 1300 -'1500'
    , '1300' +
1500  -- ������ ���¸� ���ϰ� �ִٸ� ' ' ���� ���·� �־��൵ �˾Ƽ� �������
    dualDUAL

;
    SELECT '1,300' +
'1,500' -- "invalid number" : , �޸��� �� �� ���ʹ� ��¥ ������ ���·� �ν��ϸ� ������ ����
    dualDUAL

;

-- 9 : �Ʒ��� 9�� ���� ���ڸ��� �ǹ��Ѵ�. '999,999' : õ������ ǥ���Ұž� ��� �ǹ�
    to_numberTO_NUMBER('1,300' ,'999,999' ) to_numberTO_NUMBER('1,500' ,'999,999'
) -- ���� �����ͷ� �ٲ��ֱ� ���ؼ� to_number�� ���������, � ���·� �� �ִ��� �˷���� �ȴ�
    dualDUAL

;
    salSAL
    to_charTO_CHARsalSAL ,'$999,999' ) sal_$
SAL_$ -- � ���ڸ� ǥ���� ������ 999.999 �� ǥ�� �����ϴ�
    empEMP

;
    SELECTTO_DATE('2022-03-22' ,'YYYY-MM-DD' ) date1DATE1
    ,TO_DATE('20220322' ,'YYYY-MM-DD'   ) date2
DATE2
    dualDUAL

;

desc emp

;
-- db���� varchar : ���� ���� , number : ���� ����, date : ��¥ ���� // �� 3���� ������ Ÿ�Կ��� ��κ� �ذ� ����

--1981�� 6�� 1�� ���Ŀ� �Ի��� ��� ���� ��ȸ

    SELECT
*
    emp
EMP
    hiredate HIREDATE >TO_DATE('19810601' ,'YYYY-MM-DD')

;
    
-- null ó�� �Լ� : nvl()
    empnoEMPNO
    enameENAME
    salSAL
    commCOMM
    sal SAL comm
COMM
    empEMP

;
    
-- nvl(null���� ��, null�� ��� ����� ��)
    empnoEMPNO
    enameENAME
    salSAL
    nvlNVLcommCOMM ,0)
    sal SAL nvlNVLcommCOMM ,0
)
    empEMP

;

--nvl2(null���� ��, null�� �ƴ� ��� ����� �� ,null�� ��� ����� ��) --> nvl ���� nvl2�� ���� �� ������
    empnoEMPNO
    enameENAME
    salSAL
    nvl2NVL2commCOMM ,'O' ,'X')
    sal SAL nvl2NVL2commCOMM sal SAL * 12 commCOMM sal SAL *12
)
    empEMP

;

-- decode �Լ��� case ��
-- decode(����� �� �� Ȥ�� ������, 
--          ����1, ����1�� ��ġ�� ��ȯ�� ���
--          ����2, ����2�� ��ġ�� ��ȯ�� ���
--          ����1~ ����n ���� �������� �� ��ȯȰ ���
-- )

-- job_id�� ���� ������ �ٸ��� �� ���� ����

    empnoEMPNO
    enameENAME
    jobJOB
    salSAL
    decodeDECODEjobJOB ,'MANAGER' sal SAL * 1.1 ,'SALESMAN' sal SAL * 1.05
           ,'ANALSYST' salSAL sal SAL * 1.03 ) upsal
UPSAL
    empEMP

;

-- case �� : case ~ when ~ then ~ ~ else ~ end
    empnoEMPNO
    enameENAME
    jobJOB
    salSAL
    , job
        JOB WHEN  'MANAGER'
            sal SAL * 1.
        1 WHEN 'SALESMAN'
            sal SAL * 1.
        05 WHEN 'ANALSYST'
            sal
        SAL
            sal SAL * 1.
    03 END upsal
UPSAL
    empEMP

;
    
-- case �ڿ� ���� ���� ������, when �ڿ� ���� ���鼭 ������ ���� �� ����
    empnoEMPNO
    enameENAME
    jobJOB
    salSAL
    ,
        CASE comm COMM IS NULL
            THEN
        '�ش���׾���' comm COMM = 0
            THEN
        '���� ����' comm COMM > 0
            THEN '���� :'| comm
    COMM END comm_text
COMM_TEXT
    empEMP

;
    
-- �ǽ� ����1 : emp ���̺��� ����� �ٹ� �ϼ� 21.5��
-- �Ϸ� �޿�(day_pay), �ñ�(time_pay)
-- �Ϸ� �޿� day_pay : �Ҽ��� ��°�ڸ����� ������
-- �ñ� : time_pay : �Ҽ��� ��° �ڸ����� �ݿø�
    empnoEMPNO
    enameENAME
    salSAL
    truncTRUNCsal SAL / 21.5 ,2     ) day_payDAY_PAY
    roundROUNDsal SAL / 21. 5 /8 ,1 ) time_pay
TIME_PAY
    empEMP

;
    
-- �ǽ� ����2
-- emp ���̺��� �Ի��� �������� 3������ ���� �� ù �����Ͽ� ������
-- �������� �� ��¥ ���ϱ�
-- �߰� ���� ��ȸ�� ��, null �� ���� N/A�� ���
--*�ڵ��� �� ��, �ڵ��� �ϱ� ���� ���� � ����� ������ �ϴ� ��, ������ �غ��� �ڵ��� �� ��. �ȵǸ� �ּ��̶� ���� �����.

-- ���� Ǭ ��
    empnoEMPNO
    enameENAME
    hiredateHIREDATE
    next_day
--    add_months(next_day(hiredate, '������'), 3) AS r_job,
    NEXT_DAYadd_monthsADD_MONTHShiredateHIREDATE ,3) ,'������' ) r_jobR_JOB
    ,
        CASE comm COMM IS NULL
            THEN
        'N/A' comm COMM > 0
            THEN ''| comm
    COMM
END
    empEMP

;
    
    -------------------- Ǯ�� ---------------------
-- Ǯ�� ���� �˾ƾ��� �� select  comm, nvl(comm,'N/A') from emp; -- invalid number ���� -> comm�� number���̱� ������ 'N/A' ���ڿ��� �� �� ����
--  null �� ��� ��������� ����, ���ڿ� null �� 2���̱� ������ 'N/A' �ϳ��� ���� ���� ���� ���� select comm, nvl(to_char(comm), 'N/A') from emp; to_char�� ���ڷ� ����� 2���� �� �� �� ����

    empnoEMPNO
    enameENAME
    hiredateHIREDATE
    next_dayNEXT_DAYadd_monthsADD_MONTHShiredateHIREDATE ,3) ,'������' ) r_jobR_JOB
    nvlNVLto_charTO_CHARcommCOMM) ,'N/A'                ) comm
COMM
    empEMP

;
    
-- �ǽ� ����3
-- emp ���̺��� mgr �������� ���
-- mgr �������� ������ 0000
-- mgr 75�� ��� 5555
-- 76 -> 6666
-- 77 -> 7777
-- 78 -> 8888
-- �׿ܴ� ������� mgr

--decode�� Ǯ�� --
    empnoEMPNO
    enameENAME
    mgrMGR
    decodeDECODEsubstrSUBSTRto_charTO_CHARmgrMGR) ,1 ,2) ,NULL ,'0000' ,'75' ,'5555'
           ,'76' ,'6666' ,'77' ,'7777' ,'78'
           ,'8888' substrSUBSTRto_charTO_CHARmgrMGR) ,1) ) chg_mgr
CHG_MGR
    empEMP

;

-- case when ���� Ǯ��--
    empnoEMPNO
    enameENAME
    mgrMGR
    ,
        CASE mgr MGR IS NULL
            THEN
        '0000' substrSUBSTRto_charTO_CHARmgrMGR) ,1 ,2 ) = '75'
            THEN
        '5555' substrSUBSTRto_charTO_CHARmgrMGR) ,1 ,2 ) = '76'
            THEN
        '6666' substrSUBSTRto_charTO_CHARmgrMGR) ,1 ,2 ) = '77'
            THEN
        '7777' substrSUBSTRto_charTO_CHARmgrMGR) ,1 ,2 ) = '78'
            THEN
        '8888'
            to_charTO_CHARmgrMGR
    ) END chg_mgr
CHG_MGR
    empEMP

;
    
-- ������ �Լ�
-- ��ǥ���� ������ �Լ� sum() : �������� �Ѳ����� ���� �� , count() : ����  , max(): ���Ѱ� �߿� �ִ�,  min() : �ּ�,  avg() : ���
    SELECTSUMcommCOMM
)
    empEMP

;
    SELECTSUM( salSAL)
    ,SUMsalSAL
)
    empEMP

;

-- emp ���̺��� ��� �� ���
    SELECTCOUNTempnoEMPNO
)
    empEMP

; -- count(Ư�� Į��) �� ����
    SELECTCOUNTcommCOMM
)
    empEMP

;
    SELECTCOUNT(*
)
    empEMP

; -- count(*)�� ��ü ��ȸ�� ����

-- (����)Ư�� �μ� ��� �� ��� ����
-- ex) deptno 30�� ���
    SELECTCOUNT(*
)
    emp
EMP
    deptno DEPTNO =30

;

-- max , min
-- �޿� �ּ� �ִ�
    SELECTMAXsalSAL
)
    empEMP

;
    SELECTMINsalSAL
)
    empEMP

;
    
-- �μ� ��ȣ�� 20���� ��� ��, ���� ������ �Ի��� ���ϱ�
    SELECTMINhiredateHIREDATE
)
    emp
EMP
    deptno DEPTNO =20

;
    SELECTMAXhiredateHIREDATE
)
    emp
EMP
    deptno DEPTNO =20

;

-- �μ���ȣ�� 30���� ������� �޿� ��� ���ϱ�
    roundROUND(AVGsalSAL)
)
    emp
EMP
    deptno DEPTNO =30

;

-- �μ��� ��� �޿� ��� ------------------> group by 

    deptnoDEPTNO
    ,AVGsalSAL
) -- ORA-00937: not a single-group group function ���� // 
    empEMP

;
------------------- group by --> ��� ���� ���ϴ� ��(ex-�μ���)�� �׷����� ���� ���
-- select ~, ��� ���� ���ϴ� �� from ~ group by ������� ���ϴ� ��
    deptnoDEPTNO
    ,AVGsalSAL
)
    emp
EMP GROUP
    deptnoDEPTNO

;
    
-- �μ���, ��å�� �޿��� ���
    deptnoDEPTNO
    jobJOB
    ,AVGsalSAL
)
    emp
EMP GROUP
    deptnoDEPTNO
    job
JOB -- ���� ���� �� ������� ' ,' �� ����
 ORDER
    deptnoDEPTNO
    jobJOB

;
    
    -- �������� ������� �����ϸ�, ������ ������ ���̳�? �ϴ� �κ��� �߿�����
    
-- group by ���� �����ؾ��� �� : select���� group by ���� ���� �ȵǴ� ���� ��� �Ұ�
    enameENAME
    deptnoDEPTNO
    ,-- ORA-00979: not a GROUP BY expression
    AVGsalSAL
)
    emp
EMP GROUP
    deptnoDEPTNO

; 

-- group by ~ having : �׷��� ���� ��, ������ �ִ� ���
-- �� �μ��� ��å�� ��� �޿��� ���ϵ�, ��� �޿��� 2000�̻��� �׷츸 ���
    jobJOB
    ,AVGsalSAL
)
    emp
EMP GROUP
    deptnoDEPTNO
    job
JOB
    HAVINGAVGsalSAL )> =2000

; -- �׷����� ��Ҵ� ������ �ٽ� having ���� ����
    
-- where : ��� ��� ���� ����
-- having : �׷�ȭ�� ����� ����

-- emp ���̺��� �μ��� ��å�� ��� �޿��� 500�̻���, ������� �μ���ȣ, ��å, ��� �޿� ���
    jobJOB
    ,AVGsalSAL)
    deptno
DEPTNO
    emp
EMP GROUP
    deptnoDEPTNO
    job
JOB
    HAVINGAVGsalSAL )> =
500 ORDER
    deptnoDEPTNO
    jobJOB

;
    
  -----  

    jobJOB
    ,AVGsalSAL)
    deptno
DEPTNO
    emp
EMP
    WHEREAVGsalSAL )> =
500 -- ORA-00934: group function is not allowed here
    -- �׷� �Լ��� where���� ����� �� ����
 GROUP
    deptnoDEPTNO
    jobJOB

;

------------------ ���� ���� : � ���� ���� ����Ǽ� ���� �Ǵ���. �߿�.
    deptno              ---------- 5
    DEPTNO
    jobJOB
    ,AVGsalSAL
)
    emp                ---------- 1
EMP
    sal               ---------- 2
     SAL< =
3000 GROUP
    deptno            ---------- 3
    DEPTNO
    job
JOB
    HAVING              ---------- 4
    AVGsalSAL )> =
2000 ORDER
    deptno            ---------- 6
    DEPTNO
    jobJOB

;
    
-- �ǽ�
-- �μ���, ��ձ޿�, �ְ�޿�, �����޿�, ��� �� ���
    deptnoDEPTNO
    roundROUND(AVGsalSAL) ) avg_salAVG_SAL
    ,MAXsalSAL        ) max_salMAX_SAL
    ,MINsalSAL        ) min_salMIN_SAL
    ,COUNTempnoEMPNO    ) cnt
CNT
    emp
EMP GROUP
    deptnoDEPTNO

;

-- �ǽ�
-- ���� ��å�� �����ϴ� ����� 3���� �̻��� ��å�� ����� ���

    jobJOB
    ,COUNTjobJOB
)
    emp
EMP GROUP
    job
JOB
    HAVINGCOUNTjobJOB )> =3

;

-- ���� : ������� �Ի翬���� �������� �μ��� �ο���

    to_charTO_CHARhiredateHIREDATE ,'YYYY' ) hire_yearHIRE_YEAR
    deptnoDEPTNO
    ,COUNT(*                  ) cnt
CNT
    emp
EMP GROUP
    to_charTO_CHARhiredateHIREDATE ,'YYYY')
    deptnoDEPTNO

;

-- join 
-- �����Ͱ� ���� ���� ���̺� ������ �����

-- ���� ����(inner join) : ��ġ �ϴ� ���̺��� ���� ���ڴ�
-- �ܺ� ����(outer join) : ��ġ ���� ���� ���̺��� ���� ���ڴ�. � ���̺��� ������ �ðų�(���� �����̳�, ������ �����̳�)
-- left outer join�� right outer join�� �������� �ƴ���? --> ���� ���� ��
    SELECT
*
    empEMP

;
    SELECT
*
    deptDEPT

;

-- 1) ��������(�����) : ��ġ�ϴ� Į���� �������� �� ��������
-- ORA-00918: column ambiguously defined // join �� �� ���� ���� ���� �Ǵ� ���� : �� ���̺��� ������ �ִ� Į���� ��Ȯ�ϰ� ��𿡼� ������ �� ������ ���������� ������ ������ ��
    empnoEMPNO
    enameENAME
    eEdeptnoDEPTNO
    dnameDNAME
    loc
LOC
    emp  eE
    dept d
D -- e�� d �տ� ��Ī�� �ǹ��ϴ� as�� �����Ǿ� ����
    eEdeptno DEPTNO dDdeptnoDEPTNO

; -- where ���� join�� ���� ������ �� 
    
    
-- ǥ�� ���� ( join ~ on ���� .. inner�� ���� ����)
    empnoEMPNO
    enameENAME
    eEdeptnoDEPTNO
    dnameDNAME
    loc
LOC
         emp e
    E INNER dept d D eEdeptno DEPTNO dDdeptnoDEPTNO

;
    
-- �μ���ȣ�� ��ġ�ϴ� ������� ���� ��� 
-- �޿��� 3000 �̻��� ����鸸 ���

    empnoEMPNO
    enameENAME
    eEdeptnoDEPTNO
    dnameDNAME
    loc
LOC
         emp e
    E INNER dept d D eEdeptno DEPTNO dDdeptno
                         DEPTNO sal SAL> =3000

; -- ���� ������ ������ �ϳ� �� �پ���
    
--�μ���ȣ�� ��ġ�ϴ� ������� ���� ���
--�޿��� 2500 �����̰�, �����ȣ�� 9999 ������ ��� ���

    eEempnoEMPNO
    eEenameENAME
    eEdeptnoDEPTNO
    dDdnameDNAME
    dDloc
LOC
    emp  eE
    dept d
D
        eEdeptno DEPTNO dDdeptno
    DEPTNO eEsal SAL> =
    2500 eEempno EMPNO< =9999

;
  
  
-- join ~ on ����  
    eEempnoEMPNO
    eEenameENAME
    eEdeptnoDEPTNO
    dDdnameDNAME
    dDloc
LOC
         emp e
    E dept d D eEdeptno DEPTNO dDdeptno
                   DEPTNO eEsal SAL> =
                   2500 eEempno EMPNO< =9999

;
    
-- emp, salgrade ���� : �� ������ �ؾ���(outer join)
    SELECT
*
    salgradeSALGRADE

;
    empnoEMPNO
    enameENAME
    jobJOB
    salSAL
    commCOMM
    deptnoDEPTNO
    grade
GRADE
         emp e
    E salgrade s S eEsal SAL sSlosal LOSAL sShisalHISAL

;
    
-- �ڱ��ڽ� ���̺� ���� : ��������

    e1E1empnoEMPNO
    e1E1enameENAME
    e1E1mgrMGR
    e2E2empno EMPNO mgr_empnoMGR_EMPNO
    e2E2ename ENAME mgr_ename
MGR_ENAME
    emp e1E1
    emp e2
E2
    e1E1mgr MGR e2E2empnoEMPNO

;
    
-- outer join(�ܺ� ����)

    e1E1empnoEMPNO
    e1E1enameENAME
    e1E1mgrMGR
    e2E2empno EMPNO mgr_empnoMGR_EMPNO
    e2E2ename ENAME mgr_ename
MGR_ENAME
    emp e1
    E1 LEFT OUTER emp e2 E2 e1 -- left outer join : ���� ���̺�: e1 �� �������� ������ �ϰڴ�
    E1mgr MGR e2E2empnoEMPNO

;
    e1E1empnoEMPNO
    e1E1enameENAME
    e1E1mgrMGR
    e2E2empno EMPNO mgr_empnoMGR_EMPNO
    e2E2ename ENAME mgr_ename
MGR_ENAME
    emp e1
    E1 RIGHT OUTER emp e2 E2 e1 -- left outer join : ���� ���̺�: e2 �� �������� ������ �ϰڴ�
    E1mgr MGR e2E2empnoEMPNO

;
    
-- ���� : �� �μ��� ��ձ޿� , �ִ�޿�, �ּұ޿�, ��� �� ���
-- �μ��ڵ�, �μ������ ���

    dDdeptnoDEPTNO
    roundROUND(AVGsalSAL))
    ,MAXsalSAL)
    ,MINsalSAL)
    ,COUNT(*)
    dDdname
DNAME
         emp e
    E dept d D eEdeptno DEPTNO dDdeptno
DEPTNO GROUP
    dDdeptnoDEPTNO
    dDdnameDNAME

; 


-- ��� �μ������� ��� ������ ���(�μ���ȣ�� ��������, �����ȣ�� ��������)
-- �μ���ȣ, �μ���, �����ȣ, �����, ��å, �޿� ���� �������� ���

    dDdeptnoDEPTNO
    dDdnameDNAME
    eEempnoEMPNO
    eEenameENAME
    eEjobJOB
    eEsal
SAL
    emp  e
    E RIGHT OUTER dept d D eEdeptno DEPTNO dDdeptno
DEPTNO ORDER
    dDdeptno DEPTNOASC
    eEempno EMPNOASC

;
    
-- �� ���� ���̺� ����
    e1E1empnoEMPNO
    e2E2empnoEMPNO
    e3E3empno
EMPNO
         emp e1
    E1 e2 E2 e1E1empno EMPNO e2E2empno
    EMPNO emp e3 E3 e2E2empno EMPNO e3E3empnoEMPNO

;

--����
    dDdeptnoDEPTNO
    dDdnameDNAME
    e1E1empnoEMPNO
    e1E1enameENAME
    e1E1mgrMGR
    e1E1salSAL
    e1E1deptno DEPTNO deptno_1DEPTNO_1
    sSlosalLOSAL
    sShisalHISAL
    sSgradeGRADE
    e2E2empno  EMPNO mgr_empnoMGR_EMPNO
    e2E2ename  ENAME mgr_ename
MGR_ENAME
    emp      e1
    E1 RIGHT OUTER dept     d D dDdeptno DEPTNO e1E1deptno
    DEPTNO LEFT OUTER salgrade s S e1E1sal SAL sSlosal LOSAL sShisal
    HISAL LEFT OUTER emp      e2 E2 e1E1mgr MGR e2E2empno
EMPNO ORDER
    dDdeptnoDEPTNO
    e1E1empnoEMPNO

;
    
-- SUB ���� (��������) : ������ �ȿ� �� �ٸ� �������� �����ϴ� �� // �� ���� : ���� �Ѵ�.
-- select ��ȸ�� ��
-- from ���̺� ��
-- where ���ǽ� ( select ��ȸ�� �� from ���̺� �� where ���ǽ� ) <-- where ���ǽ�(where�Ӹ� �ƴ϶� select, from��) �ڿ� ��ȣ�� �� select from where �⺻�� ���� �� ���� ���� ���� ����

-- JONES ����� �޿����� ���� �޿��� �޴� ��� ��ȸ
    sal
SAL
    emp
EMP
    ename ENAME ='JONES'

;
    SELECT
*
    emp
EMP
    sal SAL >2975

;
------------ ���� �� ������ �Ѳ����� ó���ϴ� ���� ����
    SELECT
*
    emp
EMP
    sal SAL >
        (
            sal
        SAL
            emp
        EMP
            ename ENAME =
    'JONES')

;
    
-- ALLEN ����� �߰� ���纸�� ���� �߰������� �޴� �������
    SELECT
*
    emp
EMP
    comm COMM >
        (
            comm
        COMM
            emp
        EMP
            ename ENAME =
    'ALLEN')

;
    
-- 'WARD' ���� ���� �Ի��� ������� ��ȸ
    SELECT
*
    emp
EMP
    hiredate HIREDATE <
        (
            hiredate
        HIREDATE
            emp
        EMP
            ename ENAME =
    'WARD')

;
    
-- �������� �ϳ��� ������ ������ �������� ��� ������
-- >, <=, =, >=, <, <>, ~=, !=

-- 20�� �μ��� ���� ��� �� ��ü ����� '��� �޿����� ���� �޿�'(: ����1) �� �޴� '��� ������ �ҼӺμ� ����'(: ����2)�� ��ȸ
-- ����� join������ ���������� �� ���
    empnoEMPNO
    eEenameENAME
    eEjobJOB
    eEsalSAL
    dDdeptnoDEPTNO
    dDdnameDNAME
    dDloc
LOC
         emp e
    E dept d D eEdeptno DEPTNO dDdeptno
DEPTNO
        dDdeptno DEPTNO =
    20 eEsal SAL >
        (
            SELECTAVGsalSAL
        )
            emp
    EMP)

;
    
-- �������� �������� ������ ������ �������� ��� ������
-- IN, ANY(SOME), ALL, EXISTS
    SELECT
*
    emp
EMP
    deptno DEPTNO IN (20 , 30)

; -- ���⼭�� in�� �ǹ̴� deptno �� ( 20�̰ų� 30�̰ų�)

-- IN : ���������� �����Ͱ� �������� ��� �� �ϳ��� ��ġ�ϴ� �����Ͱ� �ִٸ� TRUE 
-- �� �μ��� �ְ� �޿��� ������ �޿��� �޴� ��� ���� ���
    SELECT
*
    emp
EMP
    sal SAL =
        ( -- '=' ������
            SELECTMAXsalSAL
        )
            emp
        EMP GROUP
            deptno
    DEPTNO)

; -- ORA-01427: single-row subquery returns more than one row : '=' �̶�� �ϴ� �����ڴ� �������� �ϳ��� ������ �����࿡���� ��� ������.


    SELECT
*
    emp
EMP
    sal SAL IN
        (
            SELECTMAXsalSAL
        )
            emp
        EMP GROUP
            deptno
    DEPTNO)

; -- ���;� �ϴ� ���(��)�� 3���� ������ �̷���� �����Ƿ� ������ �������� �����ڸ� ���
    
-- ANY(SOME) : ���������� ��ȯ�� ���� ��� �� �߿��� ���� ������ ���ǽ� �� �ϳ��� TRUE ��� �������� ���ǽ��� TRUE�� ��ȯ

    SELECT
*
    emp
EMP
    sal SAL = ANY
        ( -- in�� �ϳ��θ� ��� ���� ������ any�� �ϳ��� ��� �Ұ� --> any(x) // =any (o) ==> in�� =any�� ���� �ǹ�
            SELECTMAXsalSAL
        )
            emp
        EMP GROUP
            deptno
    DEPTNO)

; -- ���� in���� ����� ����
    
    
-- �� �μ��� �ְ� �޿����� ���� �޿��� �޴� ��� ������ ���
    SELECT
*
    emp
EMP
    sal SAL < ANY
        (
            SELECTMAXsalSAL
        )
            emp
        EMP GROUP
            deptno
    DEPTNO)

;
    
-- 30�� �μ� ������� �ּ� �޿����� ���� �޿��� �޴� ��� ���� ���

    SELECT
*
    emp
EMP
    sal SAL > ANY
        ( SELECT
            sal
        SAL
            emp
        EMP
            deptno DEPTNO =
    30)

;
    
    ---- ALL : ���������� ��ȯ�� ���� ��� ���� ���� ������ ���ǽ��� ��� ���� ��, �������� ���ǽ��� TRUE�� ��ȯ
    -- 30�� �μ� ������� �ּ� �޿����� ���� �޿��� �޴� ��� ���� ���
    SELECT
*
    emp
EMP
    sal SAL < ALL
        (
            sal
        SAL
            emp
        EMP
            deptno DEPTNO =
    30)

; -- Any�� ��� ���� ���� or ���� , ALL�� ��� ���� ���� AND ����
    
-- ���߿� ��������
-- �ڽ��� �μ� ������ �ְ� ������ ������ �޿��� �޴� ��� ���
    SELECT
*
    emp
EMP
    WHERE -- where���� �����ϴ� ���(��) ���� ��������� ( ) �� ������
     deptnoDEPTNO sal SAL ) IN
        (
            deptnoDEPTNO ,MAXsalSAL
        )
            emp
        EMP GROUP
            deptno
    DEPTNO)

;
    
    
-- from ���� ����ϴ� ��������(�ζ��κ� ��� ��)
    e10E10empnoEMPNO
    e10E10enameENAME
    e10E10deptnoDEPTNO
    d -- emp�� dept �Ѵ� ������ �ִ� �׸��� emp(:e10) �Ÿ� ������ �� ����, dept(: d) �Ÿ� ������ �� ���� ������ ������� --- ����� �޶���
    DdnameDNAME
    dDloc
LOC
    FROM
        (
            SELECT
        *
            emp
        EMP
            deptno DEPTNO =
    10 e10E10
    ,
        (
            SELECT
        *
            dept
    DEPT d
D
    e10E10deptno DEPTNO dDdeptnoDEPTNO

;
    
    -- from���� ������ table���� , where���� ������ ���ǹ� ����--- �����ڰ� �;���
    
-- ���� : 10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ���� �������, �μ������� ���( not in ���)
    eEempnoEMPNO
    eEenameENAME
    eEjobJOB
    dDdeptnoDEPTNO
    dDdnameDNAME
    dDloc
LOC
         emp e
    E dept d D eEdeptno DEPTNO dDdeptno
DEPTNO
        eEdeptno DEPTNO =
    10 job JOB NOT IN
        (
            job
        JOB
            emp
        EMP
            deptno DEPTNO =
    30)

;

-- ���� : ��å�� SALESMAN �� ������� �ְ� �޿����� ���� �޿��� �޴� ������� ��� ����, �޿� ��� ������ ���
--EMPNO, ENAME, SAL, GRADE ���

-- max�� ���� ���·� Ǯ��
    empnoEMPNO
    enameENAME
    salSAL
    grade
GRADE
         emp e
    E salgrade s S eEsal SAL sSlosal LOSAL sShisal
HISAL
    sal SAL >
        (
            SELECTMAXsalSAL
        )
            emp
        EMP
            job JOB =
    'SALESMAN')

;

-- max�� �Ⱦ��� ���·� Ǯ��
    empnoEMPNO
    enameENAME
    salSAL
    grade
GRADE
         emp e
    E salgrade s S eEsal SAL sSlosal LOSAL sShisal
HISAL
    sal SAL > ALL
        (
            sal
        SAL
            emp
        EMP
            job JOB =
    'SALESMAN')

;
    
-- db���� ���̵��� �ִ� ������̴�. JOIN���̳�, ����������.

-- �׵����� �����͸� ��ȸ(select)�� �ؿԴµ� , �����δ� �����ϰ� �����ϴ� ���� �� ������
-- DML(������ ���۾�) : ����(insert), ����(delete), ����(update)
-- DML �۾��� �˾ƾ��� ���� : commit(Ŀ��) : �����ͺ��̽��� ���� �ݿ��ϰڴٶ�� �ǹ� , rollback(�ѹ�) : ���� �ݿ��Ȱ� ����ϰڴ� ��� �ǹ�

-- dept ���̺��� �����͸� �����ؼ� dept_temp ���̺� ���� -- ctrl c , ctrl v �ϰڴٴ� ����

 CREATE dept_temp
    DEPT_TEMP
        AS
            SELECT
        *
            deptDEPT

;

-- insert(����)
--insert into ���̺��(���̸�)
--values(������....)

-- ����, ��¥�����ʹ� '' Ȭ����ǥ ���

 INSERT dept_temp DEPT_TEMP
    deptnoDEPTNO
    dnameDNAME
    loc
LOC ) VALUES
    (50
    ,'DATABASE'
    ,
'SEOUL')

; INSERT dept_temp DEPT_TEMP
    deptnoDEPTNO
    dnameDNAME
    loc
LOC ) VALUES
    (60
    ,'NETWORK'
    ,
'BUSAN')

; INSERT dept_temp DEPT_TEMP VALUES
    (60
    ,
'NETWORK')

; -- SQL ����: ORA-00947: not enough values : ���� ������� �ʴ�

 INSERT dept_temp DEPT_TEMP
    deptnoDEPTNO
    dname
DNAME ) VALUES
    (  -- ������ �����ϳ� ������ ������ ���ƾ� �Ѵ� // �־����� ���� ���� null �� ǥ�õȴ� * �� Nullable : YES��
    70
    ,
'NETWORK')

; INSERT dept_temp DEPT_TEMP VALUES
    ( -- ORA-01438: value larger than specified precision allowed for this column : INSERT�� ������ �Ǵ� ���� �ƴ϶� ����, ��Ģ�� ���� ������ ������ �߻���
    800
    ,'NETWORK'
    ,
'BUSAN')

; INSERT dept_temp DEPT_TEMP VALUES
    (80
    ,'NETWORK'
    ,
NULL)

; -- ��� ���� ����ä�� null�� ������ ���� ������, null�� ���� ����ؼ� ���� ���� ����

-- emp <���̺��� ������ �����ؼ� ���ο� ���̺� ����> -- �����ʹ� �Ȱ������� ������ ���� : where 1<>1;

 CREATE emp_temp
    EMP_TEMP
        AS
            SELECT
        *
            emp
        EMP
            WHERE 1< >1

; INSERT emp_temp EMP_TEMP
    empnoEMPNO
    enameENAME
    jobJOB
    mgrMGR
    hiredateHIREDATE
    salSAL
    commCOMM
    deptno
DEPTNO ) VALUES
    (9999
    ,'ȫ�浿'
    ,'MANAGER'
    ,NULL
    ,'2021-01-05'
    ,5000
    ,1000
    ,
10)

;
--              ���� ��� �ʵ�� �����ϰ�              values�� ���缭 ��������� ��

 INSERT emp_temp EMP_TEMP
    empnoEMPNO
    enameENAME
    jobJOB
    mgrMGR
    hiredateHIREDATE
    salSAL
    commCOMM
    deptno
DEPTNO ) VALUES
    (8888
    ,'������'
    ,'MANAGER'
    ,9999
    sysdateSYSDATE
    ,4000
    ,5000
    ,
20)

;

--emp ���̺��� �μ���ȣ�� 20���� ����鸸 emp_temp�� ����

 INSERT emp_temp EMP_TEMP
    empnoEMPNO
    enameENAME
    jobJOB
    mgrMGR
    hiredateHIREDATE
    salSAL
    commCOMM
    deptno
DEPTNO
    )
        empnoEMPNO
        enameENAME
        jobJOB
        mgrMGR
        hiredateHIREDATE
        salSAL
        commCOMM
        deptno
    DEPTNO
        emp
    EMP
        deptno DEPTNO =20

;



-- emp ���̺��� salgrade ���̺��� �����Ͽ� ����� 1�� �����
-- emp_temp�� �߰��ϰ� ���� ��. (���������� �̿�)

 INSERT emp_temp EMP_TEMP
    empnoEMPNO
    enameENAME
    jobJOB
    mgrMGR
    hiredateHIREDATE
    salSAL
    commCOMM
    deptno
DEPTNO
    )
        empnoEMPNO
        enameENAME
        jobJOB
        mgrMGR
        hiredateHIREDATE
        salSAL
        commCOMM
        deptno
    DEPTNO
             emp e
        E salgrade s S eEsal SAL sSlosal LOSAL sShisal
    HISAL
        sSgrade GRADE =1

;
        
-- ����
-- update ���̺� ��
-- set ������ �� = ��, ������ �� = �� ... 
--[where] ������ ���� ����(������ ��κ� ��)


-- loc �� seoul�� ����

 dept_temp
DEPT_TEMP
    loc LOC ='SEOUL'

; -- where�� ���� ������ loc �� ���� 'SEOUL'�� ����

-- deptno=50�� ��쿡 loc�� �λ�

 dept_temp
DEPT_TEMP
    loc LOC =
'BUSAN'
    deptno DEPTNO =50

;

--EMP_TEMP �� ��� �� sal 3000 ������ ����� comm 300 ���� ����

 emp_temp
EMP_TEMP
    comm COMM =
300
    sal SAL< =3000

;
    SELECT
*
    emp_tempEMP_TEMP

;COMMIT

;

-- update ��������
-- dept ���̺��� �μ���ȣ�� 40���� �μ���� ���� ����

 dept_temp
DEPT_TEMP
    SET dnameDNAME
      loc LOC ) =
        (
            dnameDNAME
            loc
        LOC
            dept
        DEPT
            deptno DEPTNO =
    40)

;

-- dname�� opeartions�� �μ���ȣ�� ���� : DEPT
-- ����� �μ���ȣ�� ��ġ�ϴ� �μ���ȣ�� ������ 'SEOUL' ����

 dept_temp
DEPT_TEMP
    loc LOC =
'SEOUL'
    deptno DEPTNO =
        (
            deptno
        DEPTNO
            dept
        DEPT
            dname DNAME =
    'OPERATIONS')

;COMMIT

;


-- ����(delete)
--delete ���� : delete [from] ~ [where] ~~ --> [ ] : ���û���
-- JOB�� ANALYST�� �� ����

-- delete ���� ��������

--EMPNO=7369�� ����� SAL 1500���� ����

 emp_temp
EMP_TEMP
    sal SAL =
1500
    empno EMPNO =7369

;
-- emp_temp���� �޿� ����� 3�̰�, 20�� �μ��� ����� ����
-- �������� ����

 DELETE emp_temp
EMP_TEMP
    empno EMPNO IN
        (
            empno
        EMPNO
                 emp_temp e
            E salgrade s S eEsal SAL sSlosal LOSAL sShisal
        HISAL
                sSgrade GRADE =
            3 eEdeptno DEPTNO =
    20)

;COMMIT

;

-- �ǽ�

 CREATE exam_emp
    EXAM_EMP
        AS
            SELECT
        *
            empEMP

; CREATE exam_dept
    EXAM_DEPT
        AS
            SELECT
        *
            deptDEPT

; CREATE exam_salgrade
    EXAM_SALGRADE
        AS
            SELECT
        *
            salgradeSALGRADE

;
            
-- �ǽ�2

 INSERT exam_emp EXAM_EMP
    empnoEMPNO
    enameENAME
    jobJOB
    mgrMGR
    hiredateHIREDATE
    salSAL
    commCOMM
    deptno
DEPTNO ) VALUES
    (7201
    ,'TEST_USER1'
    ,'MANAGER'
    ,7788
    ,'2016-01-02'
    ,4500
    ,NULL
    ,
50)

; INSERT exam_emp EXAM_EMP
    empnoEMPNO
    enameENAME
    jobJOB
    mgrMGR
    hiredateHIREDATE
    salSAL
    commCOMM
    deptno
DEPTNO ) VALUES
    (7202
    ,'TEST_USER2'
    ,'CLERK'
    ,7201
    ,'2016-02-21'
    ,1800
    ,NULL
    ,
50)

; INSERT exam_emp EXAM_EMP
    empnoEMPNO
    enameENAME
    jobJOB
    mgrMGR
    hiredateHIREDATE
    salSAL
    commCOMM
    deptno
DEPTNO ) VALUES
    (7203
    ,'TEST_USER3'
    ,'ANALYST'
    ,7201
    ,'2016-04-11'
    ,3400
    ,NULL
    ,
60)

; INSERT exam_emp EXAM_EMP
    empnoEMPNO
    enameENAME
    jobJOB
    mgrMGR
    hiredateHIREDATE
    salSAL
    commCOMM
    deptno
DEPTNO ) VALUES
    (7204
    ,'TEST_USER4'
    ,'SALESMAN'
    ,7201
    ,'2016-05-31'
    ,2700
    ,300
    ,
60)

; INSERT exam_emp EXAM_EMP
    empnoEMPNO
    enameENAME
    jobJOB
    mgrMGR
    hiredateHIREDATE
    salSAL
    commCOMM
    deptno
DEPTNO ) VALUES
    (7205
    ,'TEST_USER5'
    ,'CLERK'
    ,7201
    ,'2016-07-20'
    ,2600
    ,NULL
    ,
70)

; INSERT exam_emp EXAM_EMP
    empnoEMPNO
    enameENAME
    jobJOB
    mgrMGR
    hiredateHIREDATE
    salSAL
    commCOMM
    deptno
DEPTNO ) VALUES
    (7206
    ,'TEST_USER6'
    ,'CLERK'
    ,7201
    ,'2016-09-08'
    ,2300
    ,NULL
    ,
70)

; INSERT exam_emp EXAM_EMP
    empnoEMPNO
    enameENAME
    jobJOB
    mgrMGR
    hiredateHIREDATE
    salSAL
    commCOMM
    deptno
DEPTNO ) VALUES
    (7207
    ,'TEST_USER7'
    ,'LECTURE'
    ,7201
    ,'2016-10-28'
    ,2300
    ,NULL
    ,
80)

; INSERT exam_emp EXAM_EMP
    empnoEMPNO
    enameENAME
    jobJOB
    mgrMGR
    hiredateHIREDATE
    salSAL
    commCOMM
    deptno
DEPTNO ) VALUES
    (7208
    ,'TEST_USER8'
    ,'STUDENT'
    ,7201
    ,'2018-03-09'
    ,1200
    ,NULL
    ,
80)

;


-- �ǽ�3 : 50�� �μ����� �ٹ��ϴ� ������� ��� �޿����� ���� �޿��� �ް� �ִ� ������� �μ� ��ȣ�� 70������ ����

 exam_emp
EXAM_EMP
    deptno DEPTNO =
70
    sal SAL >
        (
            SELECTAVGsalSAL
        )
            exam_emp
        EXAM_EMP
            deptno DEPTNO =
    50)

;

-- �ǽ�4 : 60�� �μ��� ��� �߿��� �Ի����� ���� ���� ��� ���� �ʰ� �Ի��� ��������� �޿��� 10% �λ��ϰ� 80�� �μ��� ����

 exam_emp
EXAM_EMP
    deptno DEPTNO =80
    sal SAL sal SAL * 1.
1
    hiredate HIREDATE >
        (
            SELECTMINhiredateHIREDATE
        )
            exam_emp
        EXAM_EMP
            deptno DEPTNO =
    60)

;

-- �ǽ�5 : �޿� ����� 5�� ��� ����

 DELETE exam_emp
EXAM_EMP
    empno EMPNO IN
        (
            empno
        EMPNO
                 exam_emp e
            E exam_salgrade s S eEsal SAL sSlosal LOSAL sShisal
        HISAL
            sSgrade GRADE =
    5)

;
    SELECT
*
    exam_empEXAM_EMP

;ROLLBACK

;COMMIT

;


-- Ʈ����� : ������ ������ ���̽����� �ϳ��� �۾� �Ǵ� �����ϰ� ���õǾ� �ִ� �۾� ������ ���� ���� �� ���� �ּ� ���� ����

 CREATE dept_tcl
    DEPT_TCL
        AS
            SELECT
        *
            deptDEPT

;
    SELECT
*
    dept_tclDEPT_TCL

;

-- Ʈ����ǰ� ���� �ִ� ��ɾ� : insert, update, delete

 INSERT dept_tcl DEPT_TCL VALUES
    (50
    ,'DATABASE'
    ,
'SEOUL')

; dept_tcl
DEPT_TCL
    loc LOC =
'BUSAN'
    deptno DEPTNO =40

; DELETE dept_tcl
DEPT_TCL
    dname DNAME ='RESEARCH'

;

------------------------------ �ϳ��� Ʈ������� �۾��� �� ����

ROLLBACK

;COMMIT

;

-- ���� : � Ȱ���� ���� �ð��̳� �Ⱓ  // ������ �������� ���� ���� ���.

-- �����ͺ��̽� ���� : ����Ʈ���̽� ������ ��������, ���� ������ ���̽����� �۾��� ������ ��, ������ ����

 DELETE dept_tcl
DEPT_TCL
    deptno DEPTNO =50

;COMMIT

; dept_tcl
DEPT_TCL
    loc LOC =
'SEOUL'
    deptno DEPTNO =30

;COMMIT

;

-- DDL(������ ���Ǿ�) : ��ü ����(create), ����(ALTER), ����(DROP)

-- ���̺� ���� // �׵��� �ִ� ���̺��� �����ؼ� ��������� ���� ���� ����.

--create table ���̺��( 
-- �� �̸� ���� �ڷ��� ����,
-- �� �̸� �ڷ��� 
-- ~~ �ݺ�);

-- ���̺�� �ۼ� ��Ģ : 
-- 1) ���ڷ� ������ ��(���ڴ� �տ�X, �ڿ��� ���� �� ����) 
-- 2) ���� ����� ������ ���̺�� �ߺ� �Ұ�
-- 3) ������(�ѱ��� ������ �ϳ� �ۼ��� ����)�� �ۼ�, Ư������ �ۼ� ����($, #, _)
-- 4) SQL Ű����� ���̺�� ���Ұ�

-- �ڷ���
-- ������ : 
-- CHAR(n) : ��������  ex) name char(10) : name�� 10���� ���ڸ� ����ϰڴ� => ������ 10���� ��Ƴ��� 10������ ���ڸ� ����� �� ���� �� ���Ƶ� 10���� ���߾����
-- VARCHAR2(n)   --- �������� // VAR~  ex) name varchar2(10); => 3  10���� ���ڸ� ��Ƴ��� 10 ������ ������ ���� ��밡��
-- NCHAR(n) -- ��������(�����ڵ�)   ex) name nchar(10); �ѱ��̳� ��� ��� 10���� ���ڸ� ���ڴ�
-- NVARCHAR(n) -- ��������(�����ڵ�)


-- ������ :
-- NUMBER(����1, ����2)  --> ����1 : �ڸ���  / ����2 : �Ҽ����ڸ�)
-- ex) empno number(4) : ���ڷ� 4�ڸ� ���
-- price number(7, 2) : ���ڷ� 7�ڸ� ��� �Ǵ� ��. ���࿡ �Ҽ����� ���´ٸ� 2�ڸ����� ���)
-- job number : ���� ������ ũ�⿡ �°� �ڵ� ����


-- ��¥�� : 
-- DATE : ��,��,��, ��,��,��
-- TIMESTAMP : ��,��,��,��,��,��, + �и��� �Է°���

-- ������ ���� ���� �� ���� VARCHAR2(n) , NUMBER , DATE

-- ���̺��� ������

 CREATE emp_ddl EMP_DDL
    empno    EMPNONUMBER(4)
    ename    ENAMEVARCHAR2(10)
    job      JOBVARCHAR2(9)
    mgr      MGRNUMBER(4)
    hiredate HIREDATEDATE
    sal      SALNUMBER(7 ,2)
    comm     COMMNUMBER(7 ,2)
    deptno   DEPTNONUMBER(2
))

;

-- ���̺� �߸� ��������� alter�� �ٲٰų�, drop���� ����

 DROP emp_ddlEMP_DDL

;

-- �ٸ� ���̺� ���� �̿��ؼ� ����(�����ͱ��� ����)

 CREATE emp_ddl
    EMP_DDL
        AS
            SELECT
        *
            empEMP

;

-- �ٸ� ���̺��� ����'��' �����ͼ� ����

 CREATE emp_ddl1
    EMP_DDL1
        AS
            SELECT
        *
            emp
        EMP
            WHERE 1< >1

;

-- ���̺� ���� : ALTER

    SELECT
*
    emp_ddlEMP_DDL

;

-- ��(�÷�) �߰� : add

 ALTER emp_ddl EMP_DDL hp HPVARCHAR2(20)

;

-- �� �̸��� ���� : rename column �ٲٰ��� �ϴ� ���̸� to �����ؼ� �ٲ� ���̸�

 ALTER emp_ddl EMP_DDL RENAME hp HP telTEL

;

-- ���� �ڷ����� ���� : modify : ex) varchar2 -> 

 ALTER emp_ddl EMP_DDL
    empno EMPNONUMBER(5)

;

desc emp_ddl

; ALTER emp_ddl EMP_DDL
    empno EMPNONUMBER(3)

; -- ORA-01440: column to be modified must be empty to decrease precision or scale
                                            -- �̹� �����Ͱ� 4�ڸ��� ���ԵǾ� ���ִ� ��Ȳ�̱� ������ ������ �Ұ� : ��, ������־�� �����ϴ�
                                            
-- �� ���� : drop column

 ALTER emp_ddl EMP_DDL DROP telTEL

;

-- ���̺� �� ���� : RENAME ���̺� �� to �ٲ� ���̺� ��

 emp_ddl EMP_DDL emp_renameEMP_RENAME

;

-- ���̺� ���� : drop // �����ϸ� ���� �ȵ� �ٽ� �����ߵǴ� ����

 DROP emp_renameEMP_RENAME

;


-- �ǽ� : emp_hw ���̺� �ۼ�

 CREATE emp_hw EMP_HW
    id     IDCHAR(8)
    name   NAMEVARCHAR2(10)
    addr   ADDRVARCHAR2(50)
    nation NATIONCHAR(4)
    email  EMAILVARCHAR(50)
    age    AGENUMBER(7 ,2
))

;


-- �ǽ�2 : emp_hw ���̺� ����

 ALTER emp_hw EMP_HW bigo BIGOVARCHAR2(20)

; ALTER emp_hw EMP_HW
    bigo BIGOVARCHAR2(30)

; ALTER emp_hw EMP_HW RENAME bigo BIGO remarkREMARK

;


-- ���� ����
-- ���� ���� ���� : �Է�, ����, ���� ������ �ִ� �κ� -> �������� ���Ἲ(��Ȯ��, �ϰ���) ����
-- 1) NOT NULL : ������ ���� NULL�� ������� ���� --> �� ������ �����Ͱ� ���;߸� �Ѵ�
-- 2) UNIQUE : ������ ���� ������ ���� ��������(NULL ����)
-- 3) PRIMARY KEY : ������ ���� ������ ���̸鼭 NULL �� �ƴ�(�ϳ��� ����)
-- 4) FOREIGN KEY : �ٸ� ���̺��� ���� �����Ͽ� �����ϴ� ���� �Է� ����
-- 5) CHECK : ������ ���ǽ��� �����ϴ� ������


-- NOT NULL ���� ���� : �� �̸� �ڷ��� not null

 CREATE table_notnull TABLE_NOTNULL
    login_id  LOGIN_IDVARCHAR2(20 ) NOTNULL
    login_pwd LOGIN_PWDVARCHAR2(20 ) NOTNULL
    tel       TELVARCHAR2(20
))

; INSERT table_notnull TABLE_NOTNULL
    login_idLOGIN_ID
    login_pwdLOGIN_PWD
    tel
TEL ) VALUES
    ('test_id_01'
    ,NULL
    , -- ORA-01400: cannot insert NULL into ("SCOTT"."TABLE_NOTNULL"."LOGIN_PWD") �ش� �� ���� Null�� �ȵȴ� // �ش� �κ��� ���� �ʴ� �͵� NULL�� �νĵȴ�
'010-1234-5678')

; INSERT table_notnull TABLE_NOTNULL
    login_idLOGIN_ID
    login_pwd
LOGIN_PWD ) VALUES
    ('test_id_01'
    ,
'12345')

; table_notnull
TABLE_NOTNULL
    login_pwd LOGIN_PWD =
NULL --ORA-01407: cannot update ("SCOTT"."TABLE_NOTNULL"."LOGIN_PWD") to NULL : NULL�� ������Ʈ ���Ѵ�
    login_id LOGIN_ID ='test_id_01'

;
    
-- scott �� ����� ��� �������� Ȯ��
    SELECT
*
    user_constraintsUSER_CONSTRAINTS

;


-- �������Ǹ� ����

 CREATE table_notnull2 TABLE_NOTNULL2
    login_id  LOGIN_IDVARCHAR2(20
        ) tblnn2_lgnid_nn TBLNN2_LGNID_NN NOTNULL
    login_pwd LOGIN_PWDVARCHAR2(20
        ) tblnn2_lgnpwd_nn TBLNN2_LGNPWD_NN NOTNULL
    tel       TELVARCHAR2(20
))

;

-- table_notnull tel Į���� not null << ���� ���� �߰� >> �ϰ� ���� ��

 ALTER table_notnull TABLE_NOTNULL MODIFY
    tel TEL NOT
NULL -- ORA-02296: cannot enable (SCOTT.) - null values found : (null ���� �����Ѵ�)������ ����ִ� �����Ͱ� ��Ģ�� ���� ������ �ȹٲ���
)

;
-- �ذ� ��� 1) null�� ��(��)�� ���� �༭ null�� ���ִ���  2) ������Ʈ�� �����ִ���

 table_notnull
TABLE_NOTNULL
    tel TEL =
'010-1234-5678'
    login_id LOGIN_ID ='test_id_01'

;

-- 1) �������� �̸� ����

 ALTER table_notnull2 TABLE_NOTNULL2 RENAME tblnn2_lgnid_nn TBLNN2_LGNID_NN tblnn2_id_nnTBLNN2_ID_NN

;

-- �������� ���� : ex) not null -> null ��� ����

 ALTER table_notnull2 TABLE_NOTNULL2 DROP tblnn2_id_nnTBLNN2_ID_NN

;


-- 2) UNIQUE �������� : ������ ���� ������ ���� �������� (NULL ����)

 CREATE table_unique TABLE_UNIQUE
    login_id  LOGIN_IDVARCHAR2(20 )UNIQUE
    login_pwd LOGIN_PWDVARCHAR2(20 ) NOTNULL
    tel       TELVARCHAR(20
))

; INSERT table_unique TABLE_UNIQUE
    login_idLOGIN_ID
    login_pwdLOGIN_PWD
    tel
TEL ) VALUES
    ('test_id_01'
    ,'12345'
    ,
'010-1234-5678')

; INSERT table_unique TABLE_UNIQUE
    login_idLOGIN_ID
    login_pwdLOGIN_PWD
    tel
TEL ) VALUES
    ('test_id_01'
    , --  ORA-00001: unique constraint (SCOTT.SYS_C007014) violated
    '54321'
    ,
'010-5678-1234')

; INSERT table_unique TABLE_UNIQUE
    login_idLOGIN_ID
    login_pwdLOGIN_PWD
    tel
TEL ) VALUES
    ('null'
    , -- unique :  null�� ����� �ȴ�. ������ �ߺ��� �ȵȴ�
    '54321'
    ,
'010-5678-1234')

;

--unique �������� �̸� ����

 CREATE table_unique2 TABLE_UNIQUE2
    login_id  LOGIN_IDVARCHAR2(20
        ) tblunq2_lgnide_unq TBLUNQ2_LGNIDE_UNQUNIQUE
    login_pwd LOGIN_PWDVARCHAR2(20
        ) blunq2_lgnpw_nn BLUNQ2_LGNPW_NN NOTNULL
    tel       TELVARCHAR(20
))

;

-- table_unique2�� tel unique ���� �߰�

 ALTER table_unique2 TABLE_UNIQUE2 MODIFY
    tel unique
UNIQUE)

;


-- 3) PRIMARY KEY : ������ ���� ���� ���̸鼭 NULL�� �ƴ�(�ϳ��� ����)
-- not null + unique 
-- ������ ���� �ĺ��ϴ� �뵵

 CREATE table_pk TABLE_PK
    login_id  LOGIN_IDVARCHAR2(20 ) PRIMARYKEY
    login_pwd LOGIN_PWDVARCHAR2(20 ) NOTNULL
    tel       TELVARCHAR2(20
))

; INSERT table_pk TABLE_PK VALUES
    ('test_01'
    ,'pw01'
    ,
'010-1234-5678')

; INSERT table_pk TABLE_PK VALUES
    ('test_01'
    , -- ORA-00001: unique constraint (SCOTT.SYS_C007019) violated : unique�� ����ƴ�
    'pw01'
    ,
'010-1234-5678')

; CREATE table_pk2 TABLE_PK2
    login_id  LOGIN_IDVARCHAR2(20 ) PRIMARYKEY
    login_pwd LOGIN_PWDVARCHAR2(20 ) PRIMARYKEY
    tel -- ORA-02260: table can have only one primary key : ���̺��� ���� �ϳ��� �����̸Ÿ� Ű�� ���´�
           TELVARCHAR2(20
)                  -- *Action:   Remove the extra primary key
)

; CREATE table_pk2 TABLE_PK2
    login_id  LOGIN_IDVARCHAR2(20
        ) tblpk2_lgnid_pk TBLPK2_LGNID_PK PRIMARYKEY
    login_pwd LOGIN_PWDVARCHAR2(20
        ) tblpk2_lgnpwd_nn TBLPK2_LGNPWD_NN NOTNULL
    tel       TELVARCHAR2(20
))

;


-- �������� ������ �ٸ� ��� : �����ٰ� �������� �������ְų�, �ؿ��ٰ� �ְų� �����ڸ��� �ٸ�. �ؿ��ٰ� �� ������ Į������ �������

 CREATE table_con TABLE_CON
    col1 COL1VARCHAR2(20)
    col2 COL2VARCHAR2(20)
    , PRIMARY KEY col1 COL1)
    , tblcon_unq TBLCON_UNQ UNIQUE col2 COL2
))

;

-- 4) FOREIGN KEY(�ܷ�Ű) : �ٸ� ���̺��� ���� �����Ͽ� �����ϴ� ���� �Է� ����

 CREATE dept_fk DEPT_FK
    deptno DEPTNONUMBER(2
        ) deptfk_deptno_pk DEPTFK_DEPTNO_PK PRIMARYKEY
    dname  DNAMEVARCHAR2(20)
    loc    LOCVARCHAR2(13
))

; CREATE emp_fk EMP_FK
    empno  EMPNONUMBER(4
        ) empfk_empno_pk EMPFK_EMPNO_PK PRIMARYKEY
    ename  ENAMEVARCHAR2(10)
    deptno DEPTNONUMBER(2
        ) empfk_deptno_fk
            EMPFK_DEPTNO_FK dept_fk DEPT_FK deptno DEPTNO
) -- �ܷ�Ű ���� �κ� <<references �����ϰڴ� dept_fk���̺���(deptnoĮ��) >>
)

; INSERT emp_fk EMP_FK
    empnoEMPNO
    enameENAME
    deptno
DEPTNO -- ORA-02291: integrity constraint (SCOTT.EMPFK_DEPTNO_FK) violated - parent key not found : �θ��� Ű�� �������� �ʴ´�
 ) VALUES
    (7899
    ,'hong'
    ,
20 -- �ܷ�Ű(�θ��� Ű)�� ���� �������� �����Ƿ� parent key not found �߻�, �θ� ���̺� �����Ͱ� ���� ���� �Ǿ�� �Ѵ�
)

;

-- �ܷ�Ű �������
-- 1) �θ����̺� �����Ͱ� ���� ���ԵǾ����
-- 2) �ڽ����̺� ������ ����

 INSERT dept_fk DEPT_FK VALUES
    (10
    ,'DATABASE'
    ,
'SEOUL')

; INSERT emp_fk EMP_FK
    empnoEMPNO
    enameENAME
    deptno
DEPTNO ) VALUES
    (7899
    ,'hong'
    ,
10)

; DELETE dept_fk
DEPT_FK
    deptno DEPTNO =10

; -- ORA-02292: integrity constraint (SCOTT.EMPFK_DEPTNO_FK) violated - child record found : �ڽ��� �θ�� ���� �ܷ�Ű�� �޾� �����. �� ������ �ݴ��� ����.
    
-- �ܷ�Ű ���� ���� ����
-- 1) �ڽ� ���̺� �ش��ϴ� ������ ����
-- 2) �θ� ���̺� �ش��ϴ� ������ ����

 DELETE emp_fk
EMP_FK
    deptno DEPTNO =10

; DELETE dept_fk
DEPT_FK
    deptno DEPTNO =10

;

-- �θ� �����͸� ������ ��, �����ϰ� �ִ� �����͵� �Բ� ����
-- �θ� �����͸� ������ ��, �����ϰ� �ִ� �����͸� null�� ����

 CREATE dept_fk2 DEPT_FK2
    deptno DEPTNONUMBER(2
        ) deptfk2_deptno_pk DEPTFK2_DEPTNO_PK PRIMARYKEY
    dname  DNAMEVARCHAR2(20)
    loc    LOCVARCHAR2(13
))

; CREATE emp_fk2 EMP_FK2
    empno  EMPNONUMBER(4
        ) empfk2_empno_pk EMPFK2_EMPNO_PK PRIMARYKEY
    ename  ENAMEVARCHAR2(10)
    deptno DEPTNONUMBER(2
        ) empfk2_deptno_fk
            EMPFK2_DEPTNO_FK dept_fk2 DEPT_FK2 deptno DEPTNO
                ) ON DELETE
CASCADE)

; --on delete cascade : �������� ������ ���� ������ �Բ� ����

 INSERT dept_fk2 DEPT_FK2 VALUES
    (10
    ,'DATABASE'
    ,
'SEOUL')

; INSERT emp_fk2 EMP_FK2
    empnoEMPNO
    enameENAME
    deptno
DEPTNO ) VALUES
    (7899
    ,'hong'
    ,
10)

; DELETE dept_fk2
DEPT_FK2
    deptno DEPTNO =10

;
    SELECT
*
    emp_fk2EMP_FK2

;


-- on delete set null : �� ������ ������ ���� �����͸� NULL �� ����

 CREATE dept_fk3 DEPT_FK3
    deptno DEPTNONUMBER(2
        ) deptfk3_deptno_pk DEPTFK3_DEPTNO_PK PRIMARYKEY
    dname  DNAMEVARCHAR2(20)
    loc    LOCVARCHAR2(13
))

; CREATE emp_fk3 EMP_FK3
    empno  EMPNONUMBER(4
        ) empfk3_empno_pk EMPFK3_EMPNO_PK PRIMARYKEY
    ename  ENAMEVARCHAR2(10)
    deptno DEPTNONUMBER(2
        ) empfk3_deptno_fk
            EMPFK3_DEPTNO_FK dept_fk3 DEPT_FK3 deptno DEPTNO
                ) ON DELETE SET
NULL)

; INSERT dept_fk3 DEPT_FK3 VALUES
    (10
    ,'DATABASE'
    ,
'SEOUL')

; INSERT emp_fk3 EMP_FK3
    empnoEMPNO
    enameENAME
    deptno
DEPTNO ) VALUES
    (7899
    ,'hong'
    ,
10)

; DELETE dept_fk3
DEPT_FK3
    deptno DEPTNO =10

;
    SELECT
*
    emp_fk3EMP_FK3

;
    SELECT
*
    dept_fk3DEPT_FK3

;


-- 5) CHECK ���� ���� : ������ ���ǽ��� �����ϴ� �����͸� �Է� ����

 CREATE tbl_check TBL_CHECK
    login_id  LOGIN_IDVARCHAR2(20
        ) tblck_lgnid_pk TBLCK_LGNID_PK PRIMARYKEY
    login_pwd LOGIN_PWDVARCHAR2(20
        ) tblck_lgnpwd_ck TBLCK_LGNPWD_CK CHECK lengthLENGTHlogin_pwdLOGIN_PWD ) > 3)
    tel -- (length(login_pwd) >3) : �н����尡 3�ڸ� �̻��� ��츸 �޾Ƶ��̰ڴٴ� ���ǽ��� check�� ����
           TELVARCHAR2(20
))

; INSERT tbl_check TBL_CHECK VALUES
    ('test_id1'
    ,'123'
    ,-- ORA-02290: check constraint (SCOTT.TBLCK_LGNPWD_CK) violated
'010-1234-5678')

; INSERT tbl_check TBL_CHECK VALUES
    ('test_id1'
    ,'1234'
    ,
'010-1234-5678')

;

-- �⺻ �� ���� : default

 CREATE tbl_default TBL_DEFAULT
    login_id  LOGIN_IDVARCHAR2(20
        ) tbl_lgnid_pk TBL_LGNID_PK PRIMARYKEY
    login_pwd LOGIN_PWDVARCHAR2(20 ) DEFAULT'1234'
    tel       TELVARCHAR2(20
))

; INSERT tbl_default TBL_DEFAULT VALUES
    ('test_id1'
    ,NULL
    ,
'010-1234-5678')

;
    SELECT
*
    tbl_defaultTBL_DEFAULT

; INSERT tbl_default TBL_DEFAULT
    login_idLOGIN_ID
    tel
TEL ) VALUES
    ('test_id2'
    ,
'010-1234-5678')

;


-- �ǽ� 

 CREATE dept_const DEPT_CONST
    deptno DEPTNONUMBER(2
        ) deptconst_deptno_pk DEPTCONST_DEPTNO_PK PRIMARYKEY
    dname  DNAMEVARCHAR2(14
        ) deptconst_deptno_unq DEPTCONST_DEPTNO_UNQUNIQUE
    loc    LOCVARCHAR2(13
        ) deptconst_loc_nn DEPTCONST_LOC_NN NOT
NULL)

; CREATE emp_const EMP_CONST
    empno    EMPNONUMBER(2
        ) empconst_empno_pk EMPCONST_EMPNO_PK PRIMARYKEY
    ename    ENAMEVARCHAR2(10
        ) empconst_ename_nn EMPCONST_ENAME_NN NOTNULL
    job      JOBVARCHAR2(9)
    tel      TELVARCHAR2(20
        ) empconst_tel_unq EMPCONST_TEL_UNQUNIQUE
    hiredate HIREDATEDATE
    sal      SALNUMBER(7 ,2
        ) empconst_sal_chk EMPCONST_SAL_CHK CHECK sal SAL BETWEEN 1000 AND 9999)
    comm     COMMNUMBER(7 ,2)
    deptno   DEPTNONUMBER(2
        ) empconst_deptno_fk
            EMPCONST_DEPTNO_FK dept_const DEPT_CONST deptno DEPTNO
))

;


-- ������(sequence) : ��Ģ�� ���� ������ ����

-- 1�� ����

 CREATE dept_seqDEPT_SEQ

; CREATE dept_sequence
    DEPT_SEQUENCE
        AS
            SELECT
        *
            dept
        DEPT
            WHERE 1< >1

;
    SELECT
*
    dept_sequenceDEPT_SEQUENCE

; INSERT dept_sequence DEPT_SEQUENCE
    deptnoDEPTNO
    dnameDNAME
    loc
LOC ) VALUES
    dept_seqDEPT_SEQ.NEXTVAL
    ,'DATABASE'
    ,
'SEOUL')

;

-- ���� ���������� ������ ������ Ȯ��
    dept_seqDEPT_SEQ.
CURRVAL
    dualDUAL

; DROP dept_seqDEPT_SEQ

; CREATE dept_seq DEPT_SEQ INCREMENT BY 10 -- ���������� ������ ��ȣ�� ������

 START WITH 10 -- ���������� ������ ��ȣ�� ���۰�

 MAXVALUE 90 -- ���������� ������ ��ȣ�� �ִ밪

 MINVALUE 0 -- ���������� ������ ��ȣ�� �֤���

 NOCYCLE -- ���������� ������ ��ȣ�� �ִ밪�� ������ ��� �ٽ� ������ ���ΰ� ���θ� ����(cycle or nocycle)

 CACHE2

; -- �������� ������ ��ȣ�� �޸𸮿� �̸� �Ҵ��� ���� ���� ����

 INSERT dept_sequence DEPT_SEQUENCE
    deptnoDEPTNO
    dnameDNAME
    loc
LOC ) VALUES
    dept_seqDEPT_SEQ.NEXTVAL
    ,'DATABASE'
    ,
'SEOUL')

;
-- �ݺ��� ���� �߻� 
--���� ���� -
-- ORA-08004: sequence DEPT_SEQ.NEXTVAL exceeds MAXVALUE and cannot be instantiated
    SELECT
*
    dept_sequenceDEPT_SEQUENCE;

-������ ����
alter sequence dept_seq increment by 3 maxvalue 99 cycle;

-- ��(View) : ���� ���̺�
--            �ϳ� �̻��� ���̺��� ��ȸ�ϴ� Select ���� ������ ��ü
--            ���� - select ���� ���⵵�� ��ȭ
--            ���ȼ� - ���̺��� Ư�� ���� �����ϰ� ���� ���� ���

-- �� ����
create view vm_emp20 as (select empno, ename, job, deptno
FROM
    emp
WHERE
    deptno = 20);
    
select * from vm_emp20;

-- (�� ������ �μ�Ʈ) insert
insert into vm_emp20(empno,ename,job,deptno) values(8000,'TEST','MANAGER',20);

--view�� �������̺� ���� ����
select * from emp;

-- ������ ����� �Ӽ� Ȯ���ϱ�
select *
from USER_UPDATABLE_COLUMNS
where TABLE_NAME='VM_EMP20';

-- View ���� ��, ���� ������ ���� �Ұ��ϵ��� �ۼ�
-- with read only : ���� ����
create view vm_emp_read as select empno, ename, job from emp with read only ;

select *
from USER_UPDATABLE_COLUMNS
where TABLE_NAME='VM_EMP_READ';

--insert into vm_emp_read(empno, ename,job) values(8001,'TEST','MANAGER); ename, job from emp with read only ;

-- �� ����
drop view vm_emp20;


-- �ε��� : �����̳� å�� ���� ó�� ���� �˻��� ������
-- �ε��� ��� ���ο� ���� Table Full Scan, Index Scan ������� ����

-- scott�� ������ �ִ� �ε��� Ȯ���ϱ�
select * from user_indexes; -- pk ������ ������ �ε����� ����

--�ε��� ����
--create index �ε����� on ���̺�� (���̸�1 asc, ���̸�2 desc .....)
create index idx_emp_sal on emp(sal);

-- �ε����� ������ �÷� ��ȸ
select * from user_ind_columns;

select * from emp where deptno = 20;

-- index ����
drop index idx_emp_sal;