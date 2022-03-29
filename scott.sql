-- DEPT 테이블의 정보 조회 ( COLUMN 명, NULL 설정, 자료형 )
    -- DEPTNO(부서번호) , DNAME(부서명) , LOC(위치)
DESC dept;

-- EMP 테이블의 정보 조회
    -- EMPNO(사원번호) , ENAME(사원명) , JOB(직책) , MGR(직속상관) , HIREDATE(입사일) , SAL(급여) , COMM(추가수당) , DEPTNO(부서번호)
DESC emp;

-- SALGRADE 테이블의 정보 조회
    -- GRADE(등급) , LOSAL(최저급여) , HISAL(최고급여)
DESC salgrade;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- DML
    -- 조회 (SELECT)
        -- 형식 : SELECT 칼럼명 ... FROM 테이블명;
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
    
        -- DISTINCT : 중복 데이터 제거 
            -- 형식 : SELECT DISTINCT 칼럼명 FROM 테이블명; ( 칼럼이 여러개인 경우, 모든 칼럼이 동일한 경우를 중복으로 판단한다 )
SELECT DISTINCT
    deptno
FROM
    emp;

SELECT DISTINCT
    job,
    deptno
FROM
    emp;
    
        -- ALAIS (별칭)
            -- 형식 : SELECT 칼럼 AS 별칭 FROM 테이블명 ( AS 생략 가능 , 별칭에 띄어쓰기를 넣을 경우 " " 에 감싼 상태로 입력한다 )
SELECT
    ename           AS 이름,
    sal,
    comm            "추가 수당",
    sal * 12 + comm AS 연봉
FROM
    emp;
        
        -- ORDER BY : 원하는 순서로 출력 데이터 정렬 ( 동작 시간이 오래 걸림 )
            -- 형식 : SELECT 컬럼 FROM 테이블명 ORDER BY 컬럼명 정렬옵션(ASC-오름차순 , DESC-내림차순 , DEFAULT-ASC)
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
        
        -- WHERE : 특정한 조건을 기준으로 데이터 조회
            -- 형식 : SELECT 칼럼 FROM 테이블 WHERE 컬럼 = ?; ( 문자열 ' ' ) / ( && AND , || OR )
            -- 쿼리문은 대소문자를 구분하지 않지만, 데이터값은 구분한다.
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
        
        -- 연산자
            -- 산술연산자 ( + | - | * | / )
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;
            
            -- (등가)비교연산자 ( < | > | = | 같지 않다( != | <> | ^= ))
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
    ename >= 'F'; -- 문자 대소비교 (문자에 대해서도 비교 조회 가능)
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
            
            -- 논리(부정)연산자 ( NOT | AND | OR )
SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;
            
            -- IN 연산자 : "=" 의 의미와 같다.
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
            
            -- BETWEEN a AND b 연산자 
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
            
            -- LIKE 연산자 / 와일드카드 ( % | _ ) : 유사값을 찾는 연산자
                -- 와일드카드 :  " _ " ( 어떤 값이든 상관없이 단 한개의 문자데이터 ) / " % " (어떤 값이든, 길이에 상관없는 모든 문자데이터)
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
    
    
--- IS NULL / IS NOT NULL 연산자 (SQL쿼리 문에서 =은 null을 못찾음), NULL을 찾을 땐 IS를 써야함

-- comm 이 null 인 사원

SELECT
    *
FROM
    emp
WHERE
    comm IS NULL; -- null에는 = 사용 못함
    
-- MGR이 NULL이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;
    
-- 집합 연산자
-- union (합집합) , minus(차집합), intersect(교집합)

-- deptno = 10 or deptno=20 사원 조회 : union 사용 // union 사용시 주의점 * :: 칼럼명을 일치시켜라 , 다르게 해도 타입만 같으면 다 해줘버린다. (요구하는 문제의 답이 아닐 수 있다..)
-- union(중복 값 제거함)

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
    
    
    -- union all (중복 값 제거 안함)
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
    
--[문제] 사원 이름(ename)이 s로 끝나는 사원 데이터를 출력한다
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%S'; 

--[문제] 30번 부서(deptno)에서 근무하고 있는 사원 중에 직책(job)이 salesman 인 사원의 번호, 이름, 직책, 급여, 부서 번호를 출력한다
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


--[문제] 20번, 30번 부서에 근무하고 있는 사원 중 급여(sal)가 2000 초과인 사원을 다음 두가지 방식의 select문을 사용하여 사원번호, 이름 , 직책, 급여, 부서번호를 출력하는 SQL문을 작성해 보시오
-- 집합 연산자를 사용하지 않은 방식
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
-- 집합 연산자를 사용한 방식

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

-- [문제] NOT between a and b 연산자를 쓰지 않고, 급여(sal) 열 값이 2000이상 3000이하 범위 이외의 값을 가진 데이터만 출력하도록 sql 문을 작성하시오.
SELECT
    *
FROM
    emp
WHERE
    sal < 2000
    OR sal > 3000; 
--[문제] 사원 이름에 e 가 포함되어 있는 30번 부서의 사원중 급여가 1000~2000 사이가 아닌 사원 이름, 사원 번호, 급여, 부서 번호를 출력하는 sql문을 작성
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
--[문제] 추가 수당이 존재하지 않고 상급자가 있고 직책이 manager, clerk인 사원 중에서 사원이름의 두번째 글자가 L이 아닌 사원의 정보를 출력하는 sql 문을 작성하시오
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL
    AND mgr IS NOT NULL
    AND job IN ( 'MANAGER', 'CLERK' )
    AND ename NOT LIKE '_L%';
    
-- 오라클 함수 

-- 대소문자 변경 : UPPER(): 소문자 -> 대문자, LOWER(): 대문자인 것 -> 소문자, INITCAP() : 맨처음만 대문자

SELECT
    ename,
    lower(ENAME)
    initcapINITCAPenameENAME)
    upperUPPERenameENAME
)
    empEMP

;
    
-- dual : sys가 소유하는 테이블
-- 임시 연산이나 함수의 결과 값 확인하는 용도
    
-- 문자열 길이 : length -> 길이를 구하는 것, lengthb -> 문자열 바이트 수를 반환 ( 메모리 공간 잡아주는 것과 관련 있음 )
    lengthLENGTH('한글')
    lengthbLENGTHB('한글')
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

-- [실습] 직책 이름이 6글자 이상인 사원 조회
    SELECT
*
    emp
EMP
    lengthLENGTHjobJOB )> =6

;

-- 문자열 추출 : Substr(원본데이터, 시작위치, [추출길이] -추출길이는 옵션:올 수도 있고 안 올 수도 있음)

    jobJOB
    substrSUBSTRjobJOB ,1 ,2)
    substr --job데이터 첫번쨰 글자 부터 2개 추출
    SUBSTRjobJOB ,3 ,2)
    substr -- '' 3번째 글자 부터 2개 추출
    SUBSTRjobJOB ,5
) -- '' 5번째 글자 부터 끝까지 추출
    empEMP

;
    
--[문제] emp 테이블의 모든 사원 이름을 세번쨰 글자부터 끝까지 출력
--ename, 추출문자열 출력
    enameENAME
    substrSUBSTRenameENAME ,3
)
    empEMP

;
    
-- 문자열 데이터 안에서 특정 문자 위치 찾기 : INSTR(문자열데이터, 위치를 찾으려고 하는 부분 문자, 시작 위치, 시작위치에서 찾으려는 문자가 몇번째 위치인지 지정)
    instrINSTR('HELLO ORACLE!' ,'L'       ) instr1INSTR1
    instrINSTR('HELLO ORACLE!' ,'L' ,5    ) instr2INSTR2
    instrINSTR('HELLO ORACLE!' ,'L' ,2 ,2 ) instr3
INSTR3
    dualDUAL

;
    
-- 사원 이름에 s가 있는 사원 조회 [처음 배웠던 것은 like를 이용]
    SELECT
*
    emp
EMP
    instrINSTRenameENAME ,'S' ) >0

;
    
-- 특정 문자를 다른 문자로 변경 : replace(원본 문자열, 찾는 문자, 바꿀 문자)
    SELECT                    '010-1234-5678' replace_beforeREPLACE_BEFORE
    replaceREPLACE('010-1234-5678' ,'-' ,' ' ) replace1REPLACE1
    replaceREPLACE('010-1234-5678' ,'-'      ) replace2
REPLACE2
    dualDUAL

;
    
-- 문자열 연결 : CONCAT(문자1, 문자2)
    concatCONCATempnoEMPNO enameENAME
)
    empEMP

;
    concatCONCATempnoEMPNO concatCONCAT(':' enameENAME)
)
    empEMP

;
    
-- 문자열 연결 : || <- 자바에서 쓰던 or 기호
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
    
-- 특정 문자열 제거(아무것도 안주면 공백제거) : TRIM() , LTRIM(), RTRIM() // 자바 TRIM에서는 좌우 공백만 해결함
    SELECT'         이것이              '
    ,TRIM('         이것이              ')
    ltrimLTRIM('         이것이              ')
    rtrimRTRIM('         이것이              '
)
    dualDUAL

;
    
 -- 숫자함수 
 -- round() : 반올림, trunc() : 버림, 
 -- ceil() -> 지정된 숫자 보다 큰 정수 중에서 가장 작은 정수
 -- floor() : 지정된 숫자 보다 작은 정수 중에서 가장 큰 정수
 -- mod() : 나머지     

    roundROUND(1234.5678      ) roundROUND
    roundROUND(1234.5678 ,0   ) round1ROUND1
    round -- default는 0의 자리
    ROUND(1234.5678 ,1   ) round2ROUND2
    round -- 소수점 기점으로 소수점 첫째자리
    ROUND(1234.5678 ,2   ) round3ROUND3
    round -- 둘째자리
    ROUND(1234.5678 , -1 ) round4ROUND4
    round -- 소수점을 기점으로 -1의 자리(왼쪽에서 한칸) : 1의 자리에서 반올림
    ROUND(1234.5678 , -2 ) round5
ROUND5 -- 소수점을 기점으로 -2의 자리: 10의 자리에서 반올림
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
    floor -- 3과 가장 가까운 정수(3,4) 중 큰 정수 4
    FLOOR(3.14)
    ceil -- 3과 가장 가까운 정수 중 가장 작은 정수 3
    CEIL( - 3.14)
    floorFLOOR( - 3.14
)
    dualDUAL

;
    modMOD(15 ,6)
    mod -- 자바에서 썼던 % -- 나누고 남은 나머지 값만
    MOD(10 ,2)
    modMOD(11 ,2
)
    dualDUAL

;
    
    
-- 날짜 함수 : 연산(+, -)이 가능하다 // 특정 날을 기준으로 + 면 다음날, -면 전날
-- sysdate, current_date, current_timestamp

    sysdateSYSDATE
    current_date -- 앞으로 가장 많이 쓸 것. (Oracle서버(*서버가 설치된 곳의 위치에 따라 달라질 수 있음)에 설치된 system 날짜)
    CURRENT_DATE
    current_timestamp
CURRENT_TIMESTAMP
    dualDUAL

;
    sysdate     SYSDATE nowNOW
    sysdate SYSDATE - 1 yesterdayYESTERDAY
    sysdate SYSDATE + 1 tomorrow
TOMORROW --sysdate에서 날짜값만 보여지는 것 같지만 사실, 시 - 분 - 초도 들어가 있음
    dualDUAL

;
    
-- add_months() : 몇개월 이후 날짜 구하기 
-- 형식  : 불러낼 날짜, add_months(불러낼 날짜, 구해야할 몇개월 이후)
    sysdateSYSDATE
    add_monthsADD_MONTHSsysdateSYSDATE ,3
)
    dualDUAL

;
    
-- 입사 20주년이 되는 사원들 조회
    empnoEMPNO
    enameENAME
    hiredateHIREDATE
    add_monthsADD_MONTHShiredateHIREDATE ,240
)
    empEMP

;
    
-- 현재 날짜를 기준으로 입사 45년 미만인 사원 조회 --> 조건이 붙을 수도 있다
    SELECT
*
    emp
EMP
    add_monthsADD_MONTHShiredateHIREDATE ,540 ) sysdateSYSDATE

;
    
-- months_between(날짜1, 날짜2) : 두 날짜 데이터 간의 날짜 차이를 개월 수로 출력 (날짜와 날짜 사이의 간격)

    empnoEMPNO
    enameENAME
    hiredateHIREDATE
    sysdateSYSDATE
    months_betweenMONTHS_BETWEENhiredateHIREDATE sysdateSYSDATE        ) month1MONTH1
    months_betweenMONTHS_BETWEENsysdateSYSDATE hiredateHIREDATE        ) month2MONTH2
    trunc -- 어디서 빼느냐의 기준에 따라 값이 -도, +도 될 수 있다
    TRUNCmonths_betweenMONTHS_BETWEENsysdateSYSDATE hiredateHIREDATE) ) month3
MONTH3 -- 빼줄 때 딱 나눠서 떨어지지 않으므로 소수점으로 나오기 때문에 버림을 이용해서 정수형태로 나오게 해줄 수 있다
    empEMP

;
    
-- next_day() : 특정 날짜를 기준으로 돌아오는 요일의 날짜 출력
-- last_day() : 특정 날짜가 속한 달의 마지막 날짜 출력

    sysdateSYSDATE
    next_dayNEXT_DAYsysdateSYSDATE ,'월요일')
    last_dayLAST_DAYsysdateSYSDATE
)
    dualDUAL

;
    
-- 형변환 함수
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

-- to_char() : 숫자, 날짜 데이터를 문자 데이터로 변환할 때 사용
-- to_number() : 문자 데이터를 숫자 데이터로 변환
-- to_date() : 문자 데이터를 날짜 데이터로 변환

    to_charTO_CHARsysdateSYSDATE ,'YYYY/MM/DD HH24:MI:SS' ) 현재날짜시간
현재날짜시간 -- YYYY년 MM월 DD일로 나타내겠다. HH24 24시간기준으로 시:분:초로 나타내겠다
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
1500  -- 숫자의 형태를 취하고 있다면 ' ' 문자 형태로 넣어줘도 알아서 계산해줌
    dualDUAL

;
    SELECT '1,300' +
'1,500' -- "invalid number" : , 콤마가 들어갈 때 부터는 진짜 문자의 형태로 인식하며 에러가 난다
    dualDUAL

;

-- 9 : 아래의 9는 숫자 한자리를 의미한다. '999,999' : 천단위로 표현할거야 라는 의미
    to_numberTO_NUMBER('1,300' ,'999,999' ) to_numberTO_NUMBER('1,500' ,'999,999'
) -- 숫자 데이터로 바꿔주기 위해서 to_number를 사용하지만, 어떤 형태로 들어가 있는지 알려줘야 된다
    dualDUAL

;
    salSAL
    to_charTO_CHARsalSAL ,'$999,999' ) sal_$
SAL_$ -- 어떤 문자를 표현할 떄에도 999.999 로 표현 가능하다
    empEMP

;
    SELECTTO_DATE('2022-03-22' ,'YYYY-MM-DD' ) date1DATE1
    ,TO_DATE('20220322' ,'YYYY-MM-DD'   ) date2
DATE2
    dualDUAL

;

desc emp

;
-- db에서 varchar : 문자 형식 , number : 숫자 형식, date : 날짜 형식 // 이 3가지 형태의 타입에서 대부분 해결 가능

--1981년 6월 1일 이후에 입사한 사원 정보 조회

    SELECT
*
    emp
EMP
    hiredate HIREDATE >TO_DATE('19810601' ,'YYYY-MM-DD')

;
    
-- null 처리 함수 : nvl()
    empnoEMPNO
    enameENAME
    salSAL
    commCOMM
    sal SAL comm
COMM
    empEMP

;
    
-- nvl(null값의 열, null인 경우 사용할 값)
    empnoEMPNO
    enameENAME
    salSAL
    nvlNVLcommCOMM ,0)
    sal SAL nvlNVLcommCOMM ,0
)
    empEMP

;

--nvl2(null값의 열, null이 아닐 경우 사용할 값 ,null인 경우 사용할 값) --> nvl 보다 nvl2가 조금 더 개선됨
    empnoEMPNO
    enameENAME
    salSAL
    nvl2NVL2commCOMM ,'O' ,'X')
    sal SAL nvl2NVL2commCOMM sal SAL * 12 commCOMM sal SAL *12
)
    empEMP

;

-- decode 함수와 case 문
-- decode(대상이 될 열 혹은 데이터, 
--          조건1, 조건1과 일치시 반환할 결과
--          조건2, 조건2과 일치시 반환할 결과
--          조건1~ 조건n 까지 만족안할 때 반환활 결과
-- )

-- job_id에 따라서 비율을 다르게 준 다음 연산

    empnoEMPNO
    enameENAME
    jobJOB
    salSAL
    decodeDECODEjobJOB ,'MANAGER' sal SAL * 1.1 ,'SALESMAN' sal SAL * 1.05
           ,'ANALSYST' salSAL sal SAL * 1.03 ) upsal
UPSAL
    empEMP

;

-- case 문 : case ~ when ~ then ~ ~ else ~ end
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
    
-- case 뒤에 열이 오지 않으면, when 뒤에 열이 오면서 조건을 넣을 수 있음
    empnoEMPNO
    enameENAME
    jobJOB
    salSAL
    ,
        CASE comm COMM IS NULL
            THEN
        '해당사항없음' comm COMM = 0
            THEN
        '수당 없음' comm COMM > 0
            THEN '수당 :'| comm
    COMM END comm_text
COMM_TEXT
    empEMP

;
    
-- 실습 문제1 : emp 테이블에서 월평균 근무 일수 21.5일
-- 하루 급여(day_pay), 시급(time_pay)
-- 하루 급여 day_pay : 소수점 셋째자리에서 버리기
-- 시급 : time_pay : 소수점 둘째 자리에서 반올림
    empnoEMPNO
    enameENAME
    salSAL
    truncTRUNCsal SAL / 21.5 ,2     ) day_payDAY_PAY
    roundROUNDsal SAL / 21. 5 /8 ,1 ) time_pay
TIME_PAY
    empEMP

;
    
-- 실습 문제2
-- emp 테이블에서 입사일 기준으로 3개월이 지난 후 첫 월요일에 정직원
-- 정직원이 된 날짜 구하기
-- 추가 수당 조회할 때, null 인 경우는 N/A로 출력
--*코딩을 할 때, 코딩을 하기 전에 내가 어떤 결과를 보려고 하는 지, 생각을 해보고 코딩을 할 것. 안되면 주석이라도 많이 써놔라.

-- 내가 푼 것
    empnoEMPNO
    enameENAME
    hiredateHIREDATE
    next_day
--    add_months(next_day(hiredate, '월요일'), 3) AS r_job,
    NEXT_DAYadd_monthsADD_MONTHShiredateHIREDATE ,3) ,'월요일' ) r_jobR_JOB
    ,
        CASE comm COMM IS NULL
            THEN
        'N/A' comm COMM > 0
            THEN ''| comm
    COMM
END
    empEMP

;
    
    -------------------- 풀이 ---------------------
-- 풀기 전에 알아야할 것 select  comm, nvl(comm,'N/A') from emp; -- invalid number 오류 -> comm은 number값이기 떄문에 'N/A' 문자열로 올 수 없음
--  null 인 경우 보여줘야할 것이, 숫자와 null 값 2개이기 때문에 'N/A' 하나만 나올 수는 없음 따라서 select comm, nvl(to_char(comm), 'N/A') from emp; to_char로 문자로 가줘야 2가지 다 갈 수 있음

    empnoEMPNO
    enameENAME
    hiredateHIREDATE
    next_dayNEXT_DAYadd_monthsADD_MONTHShiredateHIREDATE ,3) ,'월요일' ) r_jobR_JOB
    nvlNVLto_charTO_CHARcommCOMM) ,'N/A'                ) comm
COMM
    empEMP

;
    
-- 실습 문제3
-- emp 테이블의 mgr 기준으로 출력
-- mgr 존재하지 않으면 0000
-- mgr 75일 경우 5555
-- 76 -> 6666
-- 77 -> 7777
-- 78 -> 8888
-- 그외는 원래대로 mgr

--decode문 풀이 --
    empnoEMPNO
    enameENAME
    mgrMGR
    decodeDECODEsubstrSUBSTRto_charTO_CHARmgrMGR) ,1 ,2) ,NULL ,'0000' ,'75' ,'5555'
           ,'76' ,'6666' ,'77' ,'7777' ,'78'
           ,'8888' substrSUBSTRto_charTO_CHARmgrMGR) ,1) ) chg_mgr
CHG_MGR
    empEMP

;

-- case when 구문 풀이--
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
    
-- 다중행 함수
-- 대표적인 다중행 함수 sum() : 여러개를 한꺼번에 합한 것 , count() : 갯수  , max(): 구한것 중에 최대,  min() : 최소,  avg() : 평균
    SELECTSUMcommCOMM
)
    empEMP

;
    SELECTSUM( salSAL)
    ,SUMsalSAL
)
    empEMP

;

-- emp 테이블의 사원 수 출력
    SELECTCOUNTempnoEMPNO
)
    empEMP

; -- count(특정 칼럼) 도 가능
    SELECTCOUNTcommCOMM
)
    empEMP

;
    SELECTCOUNT(*
)
    empEMP

; -- count(*)로 전체 조회도 가능

-- (조건)특정 부서 사원 수 출력 가능
-- ex) deptno 30인 경우
    SELECTCOUNT(*
)
    emp
EMP
    deptno DEPTNO =30

;

-- max , min
-- 급여 최소 최대
    SELECTMAXsalSAL
)
    empEMP

;
    SELECTMINsalSAL
)
    empEMP

;
    
-- 부서 번호가 20번인 사원 중, 제일 오래된 입사일 구하기
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

-- 부서번호가 30번인 사원들의 급여 평균 구하기
    roundROUND(AVGsalSAL)
)
    emp
EMP
    deptno DEPTNO =30

;

-- 부서별 평균 급여 출력 ------------------> group by 

    deptnoDEPTNO
    ,AVGsalSAL
) -- ORA-00937: not a single-group group function 오류 // 
    empEMP

;
------------------- group by --> 결과 값을 원하는 열(ex-부서별)을 그룹으로 묶어 출력
-- select ~, 결과 값을 원하는 열 from ~ group by 결과값을 원하는 열
    deptnoDEPTNO
    ,AVGsalSAL
)
    emp
EMP GROUP
    deptnoDEPTNO

;
    
-- 부서별, 직책별 급여의 평균
    deptnoDEPTNO
    jobJOB
    ,AVGsalSAL
)
    emp
EMP GROUP
    deptnoDEPTNO
    job
JOB -- 보고 싶은 것 순서대로 ' ,' 로 나열
 ORDER
    deptnoDEPTNO
    jobJOB

;
    
    -- 쿼리문이 길어지기 시작하면, 뭐부터 시작할 것이냐? 하는 부분이 중요해짐
    
-- group by 절의 주의해야할 점 : select절의 group by 절에 포함 안되는 열을 사용 불가
    enameENAME
    deptnoDEPTNO
    ,-- ORA-00979: not a GROUP BY expression
    AVGsalSAL
)
    emp
EMP GROUP
    deptnoDEPTNO

; 

-- group by ~ having : 그룹을 잡을 때, 조건을 주는 경우
-- 각 부서의 직책별 평균 급여를 구하되, 평균 급여가 2000이상인 그룹만 출력
    jobJOB
    ,AVGsalSAL
)
    emp
EMP GROUP
    deptnoDEPTNO
    job
JOB
    HAVINGAVGsalSAL )> =2000

; -- 그룹으로 잡았던 조건을 다시 having 절에 대입
    
-- where : 출력 대상 행을 제한
-- having : 그룹화된 대상을 제한

-- emp 테이블의 부서별 직책의 평균 급여가 500이상인, 사원들의 부서번호, 직책, 평균 급여 출력
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
    -- 그룹 함수는 where절에 사용할 수 없다
 GROUP
    deptnoDEPTNO
    jobJOB

;

------------------ 실행 순서 : 어떤 것이 먼저 적용되서 실행 되는지. 중요.
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
    
-- 실습
-- 부서별, 평균급여, 최고급여, 최저급여, 사원 수 출력
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

-- 실습
-- 같은 직책에 종사하는 사원이 3명이 이상인 직책과 사원수 출력

    jobJOB
    ,COUNTjobJOB
)
    emp
EMP GROUP
    job
JOB
    HAVINGCOUNTjobJOB )> =3

;

-- 문제 : 사원들의 입사연도를 기준으로 부서별 인원수

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
-- 데이터가 여러 개의 테이블에 나뉘어 저장됨

-- 내부 조인(inner join) : 일치 하는 테이블을 끌고 오겠다
-- 외부 조인(outer join) : 일치 하지 않은 테이블을 끌고 오겠다. 어떤 테이블을 가지고 올거냐(왼쪽 기준이냐, 오른쪽 기준이냐)
-- left outer join과 right outer join의 차이점을 아느냐? --> 면접 질문 多
    SELECT
*
    empEMP

;
    SELECT
*
    deptDEPT

;

-- 1) 내부조인(등가조인) : 일치하는 칼럼을 기준으로 값 가져오기
-- ORA-00918: column ambiguously defined // join 할 때 가장 많이 보게 되는 오류 : 두 테이블에서 가지고 있는 칼럼을 정확하게 어디에서 가지고 올 것인지 정해져주지 않으면 오류가 남
    empnoEMPNO
    enameENAME
    eEdeptnoDEPTNO
    dnameDNAME
    loc
LOC
    emp  eE
    dept d
D -- e와 d 앞에 별칭을 의미하는 as가 생략되어 있음
    eEdeptno DEPTNO dDdeptnoDEPTNO

; -- where 절에 join에 대한 조건이 옴 
    
    
-- 표준 문법 ( join ~ on 구문 .. inner는 생략 가능)
    empnoEMPNO
    enameENAME
    eEdeptnoDEPTNO
    dnameDNAME
    loc
LOC
         emp e
    E INNER dept d D eEdeptno DEPTNO dDdeptnoDEPTNO

;
    
-- 부서번호가 일치하는 사원들의 정보 출력 
-- 급여가 3000 이상인 사람들만 출력

    empnoEMPNO
    enameENAME
    eEdeptnoDEPTNO
    dnameDNAME
    loc
LOC
         emp e
    E INNER dept d D eEdeptno DEPTNO dDdeptno
                         DEPTNO sal SAL> =3000

; -- 위와 같으나 조건이 하나 더 붙었음
    
--부서번호가 일치하는 사원들의 정보 출력
--급여가 2500 이하이고, 사원번호가 9999 이하인 사원 출력

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
  
  
-- join ~ on 으로  
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
    
-- emp, salgrade 조인 : 비등가 조인을 해야함(outer join)
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
    
-- 자기자신 테이블 조인 : 셀프조인

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
    
-- outer join(외부 조인)

    e1E1empnoEMPNO
    e1E1enameENAME
    e1E1mgrMGR
    e2E2empno EMPNO mgr_empnoMGR_EMPNO
    e2E2ename ENAME mgr_ename
MGR_ENAME
    emp e1
    E1 LEFT OUTER emp e2 E2 e1 -- left outer join : 왼쪽 테이블: e1 을 기준으로 조인을 하겠다
    E1mgr MGR e2E2empnoEMPNO

;
    e1E1empnoEMPNO
    e1E1enameENAME
    e1E1mgrMGR
    e2E2empno EMPNO mgr_empnoMGR_EMPNO
    e2E2ename ENAME mgr_ename
MGR_ENAME
    emp e1
    E1 RIGHT OUTER emp e2 E2 e1 -- left outer join : 왼쪽 테이블: e2 을 기준으로 조인을 하겠다
    E1mgr MGR e2E2empnoEMPNO

;
    
-- 문제 : 각 부서별 평균급여 , 최대급여, 최소급여, 사원 수 출력
-- 부서코드, 부서명까지 출력

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


-- 모든 부서정보와 사원 정보를 출력(부서번호의 오름차순, 사원번호의 오름차순)
-- 부서번호, 부서명, 사원번호, 사원명, 직책, 급여 전부 나오도록 출력

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
    
-- 세 개의 테이블 조인
    e1E1empnoEMPNO
    e2E2empnoEMPNO
    e3E3empno
EMPNO
         emp e1
    E1 e2 E2 e1E1empno EMPNO e2E2empno
    EMPNO emp e3 E3 e2E2empno EMPNO e3E3empnoEMPNO

;

--문제
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
    
-- SUB 쿼리 (서브쿼리) : 쿼리문 안에 또 다른 쿼리문이 존재하는 것 // ※ 쿼리 : 질의 한다.
-- select 조회할 열
-- from 테이블 명
-- where 조건식 ( select 조회할 열 from 테이블 명 where 조건식 ) <-- where 조건식(where뿐만 아니라 select, from등) 뒤에 괄호로 또 select from where 기본식 등이 또 오는 것이 서브 쿼리

-- JONES 사원의 급여보다 높은 급여를 받는 사원 조회
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
------------ 위의 두 문장을 한꺼번에 처리하는 서브 쿼리
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
    
-- ALLEN 사원의 추가 수당보다 많은 추가수당을 받는 사원정보
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
    
-- 'WARD' 보다 빨리 입사한 사원정보 조회
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
    
-- 실행결과가 하나로 나오는 단일행 서브쿼리 사용 연산자
-- >, <=, =, >=, <, <>, ~=, !=

-- 20번 부서에 속한 사원 중 전체 사원의 '평균 급여보다 높은 급여'(: 정보1) 를 받는 '사원 정보와 소속부서 정보'(: 정보2)를 조회
-- 배웠던 join문으로 서브쿼리를 쓸 경우
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
    
-- 실행결과가 여러개로 나오는 다중행 서브쿼리 사용 연산자
-- IN, ANY(SOME), ALL, EXISTS
    SELECT
*
    emp
EMP
    deptno DEPTNO IN (20 , 30)

; -- 여기서의 in의 의미는 deptno 가 ( 20이거나 30이거나)

-- IN : 메인쿼리의 데이터가 서브쿼리 결과 중 하나라도 일치하는 데이터가 있다면 TRUE 
-- 각 부서별 최고 급여와 동일한 급여를 받는 사원 정보 출력
    SELECT
*
    emp
EMP
    sal SAL =
        ( -- '=' 연산자
            SELECTMAXsalSAL
        )
            emp
        EMP GROUP
            deptno
    DEPTNO)

; -- ORA-01427: single-row subquery returns more than one row : '=' 이라고 하는 연산자는 실행결과가 하나로 나오는 단일행에서만 사용 가능함.


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

; -- 나와야 하는 결과(행)가 3개의 행으로 이루어져 있으므로 다중행 서브쿼리 연산자를 사용
    
-- ANY(SOME) : 서브쿼리가 반환한 여러 결과 값 중에서 메인 쿼리의 조건식 중 하나라도 TRUE 라면 메인쿼리 조건식을 TRUE로 반환

    SELECT
*
    emp
EMP
    sal SAL = ANY
        ( -- in은 하나로만 사용 가능 했으나 any는 하나로 사용 불가 --> any(x) // =any (o) ==> in과 =any는 같은 의미
            SELECTMAXsalSAL
        )
            emp
        EMP GROUP
            deptno
    DEPTNO)

; -- 위의 in문과 결과는 동일
    
    
-- 각 부서별 최고 급여보다 작은 급여를 받는 사원 정보를 출력
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
    
-- 30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원 정보 출력

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
    
    ---- ALL : 서브쿼리가 반환한 여러 결과 값을 메인 쿼리의 조건식이 모두 만족 시, 메인쿼리 조건식을 TRUE로 반환
    -- 30번 부서 사원들의 최소 급여보다 적은 급여를 받는 사원 정보 출력
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

; -- Any는 모든 값에 대해 or 연산 , ALL은 모든 값에 대해 AND 연산
    
-- 다중열 서브쿼리
-- 자신의 부서 내에서 최고 연봉과 돌일한 급여를 받는 사원 출력
    SELECT
*
    emp
EMP
    WHERE -- where절에 떠야하는 결과(열) 값이 여러개라면 ( ) 로 묶어줌
     deptnoDEPTNO sal SAL ) IN
        (
            deptnoDEPTNO ,MAXsalSAL
        )
            emp
        EMP GROUP
            deptno
    DEPTNO)

;
    
    
-- from 절에 사용하는 서브쿼리(인라인뷰 라고 함)
    e10E10empnoEMPNO
    e10E10enameENAME
    e10E10deptnoDEPTNO
    d -- emp와 dept 둘다 가지고 있는 항목은 emp(:e10) 거를 가지고 올 건지, dept(: d) 거를 가지고 올 건지 결정을 해줘야함 --- 결과값 달라짐
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
    
    -- from절에 들어오면 table형태 , where절에 들어오면 조건문 형태--- 연산자가 와야함
    
-- 문제 : 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 사원정보, 부서정보를 출력( not in 사용)
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

-- 문제 : 직책이 SALESMAN 인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 사원 정보, 급여 등급 정보를 출력
--EMPNO, ENAME, SAL, GRADE 출력

-- max를 쓰는 형태로 풀이
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

-- max를 안쓰는 형태로 풀이
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
    
-- db에서 난이도가 있는 개념들이다. JOIN문이나, 서브쿼리가.

-- 그동안은 데이터를 조회(select)만 해왔는데 , 앞으로는 수정하고 삽입하는 일을 할 예정임
-- DML(데이터 조작어) : 삽입(insert), 삭제(delete), 수정(update)
-- DML 작업시 알아야할 개념 : commit(커밋) : 데이터베이스에 최종 반영하겠다라는 의미 , rollback(롤백) : 지금 반영된걸 취소하겠다 라는 의미

-- dept 테이블의 데이터를 추출해서 dept_temp 테이블 생성 -- ctrl c , ctrl v 하겠다는 개념

 CREATE dept_temp
    DEPT_TEMP
        AS
            SELECT
        *
            deptDEPT

;

-- insert(삽입)
--insert into 테이블명(열이름)
--values(데이터....)

-- 문자, 날짜데이터는 '' 홑따옴표 사용

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

; -- SQL 오류: ORA-00947: not enough values : 값이 충분하지 않다

 INSERT dept_temp DEPT_TEMP
    deptnoDEPTNO
    dname
DNAME ) VALUES
    (  -- 생략은 가능하나 갯수와 순서는 같아야 한다 // 넣어주지 않은 값은 null 로 표시된다 * 단 Nullable : YES만
    70
    ,
'NETWORK')

; INSERT dept_temp DEPT_TEMP VALUES
    ( -- ORA-01438: value larger than specified precision allowed for this column : INSERT가 무조건 되는 것이 아니라 형식, 규칙에 맞지 않으면 오류가 발생함
    800
    ,'NETWORK'
    ,
'BUSAN')

; INSERT dept_temp DEPT_TEMP VALUES
    (80
    ,'NETWORK'
    ,
NULL)

; -- 명시 하지 않은채로 null을 삽입할 수도 있지만, null을 직접 명시해서 넣을 수도 있음

-- emp <테이블의 구조만 복사해서 새로운 테이블 생성> -- 데이터는 안가져오고 구조만 복사 : where 1<>1;

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
    ,'홍길동'
    ,'MANAGER'
    ,NULL
    ,'2021-01-05'
    ,5000
    ,1000
    ,
10)

;
--              차례 대로 필드명 나열하고              values값 맞춰서 집어넣으면 됨

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
    ,'성춘향'
    ,'MANAGER'
    ,9999
    sysdateSYSDATE
    ,4000
    ,5000
    ,
20)

;

--emp 테이블에서 부서번호가 20번인 사원들만 emp_temp로 삽입

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



-- emp 테이블에서 salgrade 테이블을 참조하여 등급이 1인 사원을
-- emp_temp에 추가하고 싶을 때. (서브쿼리문 이용)

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
        
-- 수정
-- update 테이블 명
-- set 변경할 열 = 값, 변경할 열 = 값 ... 
--[where] 구문은 선택 사항(이지만 대부분 씀)


-- loc 를 seoul로 변경

 dept_temp
DEPT_TEMP
    loc LOC ='SEOUL'

; -- where가 들어가지 않으면 loc 값 전부 'SEOUL'로 변경

-- deptno=50인 경우에 loc를 부산

 dept_temp
DEPT_TEMP
    loc LOC =
'BUSAN'
    deptno DEPTNO =50

;

--EMP_TEMP 의 사원 중 sal 3000 이하인 사원만 comm 300 으로 수정

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

-- update 서브쿼리
-- dept 테이블의 부서번호가 40번인 부서명과 지역 추출

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

-- dname이 opeartions인 부서번호를 추출 : DEPT
-- 추출된 부서번호와 일치하는 부서번호의 지역을 'SEOUL' 변경

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


-- 삭제(delete)
--delete 구문 : delete [from] ~ [where] ~~ --> [ ] : 선택사항
-- JOB이 ANALYST인 것 삭제

-- delete 구문 서브쿼리

--EMPNO=7369인 사원의 SAL 1500으로 변경

 emp_temp
EMP_TEMP
    sal SAL =
1500
    empno EMPNO =7369

;
-- emp_temp에서 급여 등급이 3이고, 20번 부서의 사원만 삭제
-- 서브쿼리 형태

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

-- 실습

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
            
-- 실습2

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


-- 실습3 : 50번 부서에서 근무하는 사원들의 평균 급여보다 많은 급여를 받고 있는 사원들의 부서 번호를 70번으로 변경

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

-- 실습4 : 60번 부서의 사원 중에서 입사일이 가장 빠른 사원 보다 늦게 입사한 사원ㄷㄹ의 급여를 10% 인상하고 80번 부서로 변경

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

-- 실습5 : 급여 등급이 5인 사원 삭제

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


-- 트랜잭션 : 관계형 데이터 베이스에서 하나의 작업 또는 밀접하게 관련되어 있는 작업 수행을 위해 나눌 수 없는 최소 수행 단위

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

-- 트랜잭션과 관련 있는 명령어 : insert, update, delete

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

------------------------------ 하나의 트랜잭션을 작업을 한 것임

ROLLBACK

;COMMIT

;

-- 세션 : 어떤 활동을 위한 시간이나 기간  // 앞으로 웹에서도 많이 나올 용어.

-- 데이터베이스 세션 : 데이트베이스 접속을 시작으로, 여러 데이터 베이스에서 작업을 수행한 후, 접속을 종료

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

-- DDL(데이터 정의어) : 객체 생성(create), 변경(ALTER), 삭제(DROP)

-- 테이블 생성 // 그동안 있던 테이블을 복제해서 사용했지만 이젠 만들 예정.

--create table 테이블명( 
-- 열 이름 나열 자료형 나열,
-- 열 이름 자료형 
-- ~~ 반복);

-- 테이블명 작성 규칙 : 
-- 1) 문자로 시작할 것(숫자는 앞에X, 뒤에는 붙일 수 있음) 
-- 2) 같은 사용자 소유의 테이블명 중복 불가
-- 3) 영문자(한글이 가능은 하나 작성은 안함)로 작성, 특수문자 작성 가능($, #, _)
-- 4) SQL 키워드는 테이블명 사용불가

-- 자료형
-- 문자형 : 
-- CHAR(n) : 고정길이  ex) name char(10) : name에 10개의 문자를 허용하겠다 => 공간은 10개를 잡아놔서 10이하의 문자를 사용할 수 있을 것 같아도 10개로 맞추어야함
-- VARCHAR2(n)   --- 가변길이 // VAR~  ex) name varchar2(10); => 3  10개의 문자를 잡아놔도 10 이하의 숫자의 문자 사용가능
-- NCHAR(n) -- 고정길이(유니코드)   ex) name nchar(10); 한글이나 영어나 모두 10개의 문자를 쓰겠다
-- NVARCHAR(n) -- 가변길이(유니코드)


-- 숫자형 :
-- NUMBER(숫자1, 숫자2)  --> 숫자1 : 자릿수  / 숫자2 : 소수점자리)
-- ex) empno number(4) : 숫자로 4자리 허용
-- price number(7, 2) : 숫자로 7자리 허용 되는 데. 만약에 소수점이 들어온다면 2자리까지 허용)
-- job number : 저장 데이터 크기에 맞게 자동 조절


-- 날짜형 : 
-- DATE : 년,월,일, 시,분,초
-- TIMESTAMP : 년,월,일,시,분,초, + 밀리초 입력가능

-- 어차피 가장 많이 쓸 것은 VARCHAR2(n) , NUMBER , DATE

-- 테이블을 만들어보자

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

-- 테이블 잘못 만들었으면 alter로 바꾸거나, drop으로 삭제

 DROP emp_ddlEMP_DDL

;

-- 다른 테이블 구조 이용해서 생성(데이터까지 포함)

 CREATE emp_ddl
    EMP_DDL
        AS
            SELECT
        *
            empEMP

;

-- 다른 테이블의 구조'만' 가져와서 생성

 CREATE emp_ddl1
    EMP_DDL1
        AS
            SELECT
        *
            emp
        EMP
            WHERE 1< >1

;

-- 테이블 변경 : ALTER

    SELECT
*
    emp_ddlEMP_DDL

;

-- 열(컬럼) 추가 : add

 ALTER emp_ddl EMP_DDL hp HPVARCHAR2(20)

;

-- 열 이름을 변경 : rename column 바꾸고자 하는 열이름 to 변경해서 바꿀 열이름

 ALTER emp_ddl EMP_DDL RENAME hp HP telTEL

;

-- 열의 자료형을 변경 : modify : ex) varchar2 -> 

 ALTER emp_ddl EMP_DDL
    empno EMPNONUMBER(5)

;

desc emp_ddl

; ALTER emp_ddl EMP_DDL
    empno EMPNONUMBER(3)

; -- ORA-01440: column to be modified must be empty to decrease precision or scale
                                            -- 이미 데이터가 4자리로 삽입되어 들어가있는 상황이기 때문에 변경이 불가 : 즉, 비워져있어야 가능하다
                                            
-- 열 삭제 : drop column

 ALTER emp_ddl EMP_DDL DROP telTEL

;

-- 테이블 명 변경 : RENAME 테이블 명 to 바꿀 테이블 명

 emp_ddl EMP_DDL emp_renameEMP_RENAME

;

-- 테이블 삭제 : drop // 삭제하면 복구 안됨 다시 만들어야되니 주의

 DROP emp_renameEMP_RENAME

;


-- 실습 : emp_hw 테이블 작성

 CREATE emp_hw EMP_HW
    id     IDCHAR(8)
    name   NAMEVARCHAR2(10)
    addr   ADDRVARCHAR2(50)
    nation NATIONCHAR(4)
    email  EMAILVARCHAR(50)
    age    AGENUMBER(7 ,2
))

;


-- 실습2 : emp_hw 테이블 변경

 ALTER emp_hw EMP_HW bigo BIGOVARCHAR2(20)

; ALTER emp_hw EMP_HW
    bigo BIGOVARCHAR2(30)

; ALTER emp_hw EMP_HW RENAME bigo BIGO remarkREMARK

;


-- 제약 조건
-- 제약 조건 장점 : 입력, 수정, 삭제 영향을 주는 부분 -> 데이터의 무결성(정확성, 일관성) 유지
-- 1) NOT NULL : 지정한 열에 NULL을 허용하지 않음 --> 즉 무조건 데이터가 들어와야만 한다
-- 2) UNIQUE : 지정한 열이 유일한 값을 가져야함(NULL 제외)
-- 3) PRIMARY KEY : 지정한 열이 유일한 값이면서 NULL 이 아님(하나만 지정)
-- 4) FOREIGN KEY : 다른 테이블의 열을 참조하여 존재하는 값만 입력 가능
-- 5) CHECK : 설정한 조건식을 만족하는 데이터


-- NOT NULL 제약 조건 : 열 이름 자료형 not null

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
    , -- ORA-01400: cannot insert NULL into ("SCOTT"."TABLE_NOTNULL"."LOGIN_PWD") 해당 열 값에 Null은 안된다 // 해당 부분을 쓰지 않는 것도 NULL로 인식된다
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
NULL --ORA-01407: cannot update ("SCOTT"."TABLE_NOTNULL"."LOGIN_PWD") to NULL : NULL로 업데이트 못한다
    login_id LOGIN_ID ='test_id_01'

;
    
-- scott 가 사용한 모든 제약조건 확인
    SELECT
*
    user_constraintsUSER_CONSTRAINTS

;


-- 제약조건명 지정

 CREATE table_notnull2 TABLE_NOTNULL2
    login_id  LOGIN_IDVARCHAR2(20
        ) tblnn2_lgnid_nn TBLNN2_LGNID_NN NOTNULL
    login_pwd LOGIN_PWDVARCHAR2(20
        ) tblnn2_lgnpwd_nn TBLNN2_LGNPWD_NN NOTNULL
    tel       TELVARCHAR2(20
))

;

-- table_notnull tel 칼럼을 not null << 제약 조건 추가 >> 하고 싶을 때

 ALTER table_notnull TABLE_NOTNULL MODIFY
    tel TEL NOT
NULL -- ORA-02296: cannot enable (SCOTT.) - null values found : (null 값이 존재한다)기존에 들어있는 데이터가 규칙에 맞지 않으면 안바꿔줌
)

;
-- 해결 방법 1) null인 것(들)을 값을 줘서 null을 없애던지  2) 업데이트를 시켜주던지

 table_notnull
TABLE_NOTNULL
    tel TEL =
'010-1234-5678'
    login_id LOGIN_ID ='test_id_01'

;

-- 1) 제약조건 이름 변경

 ALTER table_notnull2 TABLE_NOTNULL2 RENAME tblnn2_lgnid_nn TBLNN2_LGNID_NN tblnn2_id_nnTBLNN2_ID_NN

;

-- 제약조건 삭제 : ex) not null -> null 허용 가능

 ALTER table_notnull2 TABLE_NOTNULL2 DROP tblnn2_id_nnTBLNN2_ID_NN

;


-- 2) UNIQUE 제약조건 : 지정한 열이 유일한 값을 가져야함 (NULL 제외)

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
    , -- unique :  null은 허용이 된다. 하지만 중복은 안된다
    '54321'
    ,
'010-5678-1234')

;

--unique 제약조건 이름 지정

 CREATE table_unique2 TABLE_UNIQUE2
    login_id  LOGIN_IDVARCHAR2(20
        ) tblunq2_lgnide_unq TBLUNQ2_LGNIDE_UNQUNIQUE
    login_pwd LOGIN_PWDVARCHAR2(20
        ) blunq2_lgnpw_nn BLUNQ2_LGNPW_NN NOTNULL
    tel       TELVARCHAR(20
))

;

-- table_unique2의 tel unique 조건 추가

 ALTER table_unique2 TABLE_UNIQUE2 MODIFY
    tel unique
UNIQUE)

;


-- 3) PRIMARY KEY : 지정한 열이 유일 값이면서 NULL이 아님(하나만 지정)
-- not null + unique 
-- 각각의 행을 식별하는 용도

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
    , -- ORA-00001: unique constraint (SCOTT.SYS_C007019) violated : unique가 위배됐다
    'pw01'
    ,
'010-1234-5678')

; CREATE table_pk2 TABLE_PK2
    login_id  LOGIN_IDVARCHAR2(20 ) PRIMARYKEY
    login_pwd LOGIN_PWDVARCHAR2(20 ) PRIMARYKEY
    tel -- ORA-02260: table can have only one primary key : 테이블은 오직 하나의 프라이매리 키를 갖는다
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


-- 제약조건 지정시 다른 방식 : 옆에다가 제약조건 지정해주거나, 밑에다가 주거나 개발자마다 다름. 밑에다가 줄 때에는 칼럼명을 써줘야함

 CREATE table_con TABLE_CON
    col1 COL1VARCHAR2(20)
    col2 COL2VARCHAR2(20)
    , PRIMARY KEY col1 COL1)
    , tblcon_unq TBLCON_UNQ UNIQUE col2 COL2
))

;

-- 4) FOREIGN KEY(외래키) : 다른 테이블의 열을 참조하여 존재하는 값만 입력 가능

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
) -- 외래키 지정 부분 <<references 참조하겠다 dept_fk테이블의(deptno칼럼) >>
)

; INSERT emp_fk EMP_FK
    empnoEMPNO
    enameENAME
    deptno
DEPTNO -- ORA-02291: integrity constraint (SCOTT.EMPFK_DEPTNO_FK) violated - parent key not found : 부모의 키가 존재하지 않는다
 ) VALUES
    (7899
    ,'hong'
    ,
20 -- 외래키(부모의 키)가 현재 존재하지 않으므로 parent key not found 발생, 부모 테이블에 데이터가 먼저 삽입 되어야 한다
)

;

-- 외래키 수행순서
-- 1) 부모테이블에 데이터가 먼저 삽입되어야함
-- 2) 자식테이블에 데이터 삽입

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

; -- ORA-02292: integrity constraint (SCOTT.EMPFK_DEPTNO_FK) violated - child record found : 자식이 부모로 부터 외래키를 받아 사용중. 위 오류와 반대의 개념.
    
-- 외래키 삭제 수행 순서
-- 1) 자식 테이블에 해당하는 데이터 삭제
-- 2) 부모 테이블에 해당하는 데이터 삭제

 DELETE emp_fk
EMP_FK
    deptno DEPTNO =10

; DELETE dept_fk
DEPT_FK
    deptno DEPTNO =10

;

-- 부모 데이터를 삭제할 때, 참조하고 있는 데이터도 함께 삭제
-- 부모 데이터를 삭제할 때, 참조하고 있는 데이터를 null로 수정

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

; --on delete cascade : 열데이터 삭제시 참조 데이터 함께 삭제

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


-- on delete set null : 열 데이터 삭제시 참조 데이터를 NULL 로 수정

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


-- 5) CHECK 제약 조건 : 설정한 조건식을 만족하는 데이터만 입력 가능

 CREATE tbl_check TBL_CHECK
    login_id  LOGIN_IDVARCHAR2(20
        ) tblck_lgnid_pk TBLCK_LGNID_PK PRIMARYKEY
    login_pwd LOGIN_PWDVARCHAR2(20
        ) tblck_lgnpwd_ck TBLCK_LGNPWD_CK CHECK lengthLENGTHlogin_pwdLOGIN_PWD ) > 3)
    tel -- (length(login_pwd) >3) : 패스워드가 3자리 이상인 경우만 받아들이겠다는 조건식을 check로 설정
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

-- 기본 값 지정 : default

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


-- 실습 

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


-- 시퀀스(sequence) : 규칙에 따라 순번을 생성

-- 1씩 증가

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

-- 가장 마지막으로 생성된 시퀀스 확인
    dept_seqDEPT_SEQ.
CURRVAL
    dualDUAL

; DROP dept_seqDEPT_SEQ

; CREATE dept_seq DEPT_SEQ INCREMENT BY 10 -- 시퀀스에서 생성할 번호의 증가값

 START WITH 10 -- 시퀀스에서 생성할 번호의 시작값

 MAXVALUE 90 -- 시퀀스에서 생성할 번호의 최대값

 MINVALUE 0 -- 시퀀스에서 생성할 번호의 최ㅅ값

 NOCYCLE -- 시퀀스에서 생성한 번호가 최대값에 도달할 경우 다시 시작할 것인가 여부를 결정(cycle or nocycle)

 CACHE2

; -- 시퀀스가 생성할 번호를 메모리에 미리 할당해 놓은 수를 지정

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
-- 반복시 오류 발생 
--오류 보고 -
-- ORA-08004: sequence DEPT_SEQ.NEXTVAL exceeds MAXVALUE and cannot be instantiated
    SELECT
*
    dept_sequenceDEPT_SEQUENCE;

-시퀀스 수정
alter sequence dept_seq increment by 3 maxvalue 99 cycle;

-- 뷰(View) : 가상 테이블
--            하나 이상의 테이블을 조회하는 Select 문을 저장한 객체
--            편리성 - select 문의 복잡도를 완화
--            보안성 - 테이블의 특정 열을 노출하고 싶지 않은 경우

-- 뷰 생성
create view vm_emp20 as (select empno, ename, job, deptno
FROM
    emp
WHERE
    deptno = 20);
    
select * from vm_emp20;

-- (뷰 구문의 인서트) insert
insert into vm_emp20(empno,ename,job,deptno) values(8000,'TEST','MANAGER',20);

--view와 원본테이블 연결 여부
select * from emp;

-- 생성된 뷰들의 속성 확인하기
select *
from USER_UPDATABLE_COLUMNS
where TABLE_NAME='VM_EMP20';

-- View 생성 시, 원본 데이터 수정 불가하도록 작성
-- with read only : 뷰의 열람
create view vm_emp_read as select empno, ename, job from emp with read only ;

select *
from USER_UPDATABLE_COLUMNS
where TABLE_NAME='VM_EMP_READ';

--insert into vm_emp_read(empno, ename,job) values(8001,'TEST','MANAGER); ename, job from emp with read only ;

-- 뷰 삭제
drop view vm_emp20;


-- 인덱스 : 사전이나 책의 목차 처럼 빠른 검색을 도와줌
-- 인덱스 사용 여부에 따라 Table Full Scan, Index Scan 방식으로 나뉨

-- scott가 가지고 있는 인덱스 확인하기
select * from user_indexes; -- pk 설정된 값들은 인덱스로 사용됨

--인덱스 생성
--create index 인덱스명 on 테이블명 (열이름1 asc, 열이름2 desc .....)
create index idx_emp_sal on emp(sal);

-- 인덱스가 설정된 컬럼 조회
select * from user_ind_columns;

select * from emp where deptno = 20;

-- index 삭제
drop index idx_emp_sal;