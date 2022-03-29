-- hr(오라클 연습용 계정)
-- scott 가 가지고 있는 정보의 원본

--[문제1] : employees 테이블 전체 내용 조회
SELECT
    *
FROM
    employees;

--[문제2] : employees 테이블의 first_name, last_name, job_id 조회
SELECT
    first_name,
    last_name,
    job_id
FROM
    employees;

--[문제3] employees 테이블의 모든 열을 조회
-- employee_id : empno (별칭)
-- manager_id : mgr
-- department_id : dept no
-- 위 세개의 열은 별칭을 붙여서 조회
-- 조회할 때, 부서번호를 기준으로 내림차순으로 정렬하되, 부서번호가 같다면
-- 사원 이름(First_name)을 기준으로 오름차순 정렬
SELECT
    first_name,
    last_name,
    email,
    phone_number,
    commission_pct,
    hire_date,
    job_id,
    salary,
    employee_id   AS empno,
    manager_id    AS mgr,
    department_id AS deptno
FROM
    employees
ORDER BY
    department_id DESC,
    first_name ASC;
    
-- [문제4] 사원번호가 176인 사원의 last_name과 deptno 조회
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    employee_id = 176;
-- [문제5] 연봉이 12,000 이상 되는 직원들의 last_name과 salary 조회
SELECT
    salary,
    last_name
FROM
    employees
WHERE
    salary >= 12000;
-- [문제6] 연봉이 5000 ~ 12000 범위 사이가 아닌 사원들 조회
SELECT
    *
FROM
    employees
WHERE
    salary < 5000
    OR salary > 12000;
    
-- [문제7] 20번 혹은 50번 부서에서 근무하는 모든 사원들의 last_name 및 department_id 조회
-- 조회한 후, last_name의 오름차순, department_id의 오름차순으로 정렬
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN ( 20, 50 )
ORDER BY
    last_name ASC,
    department_id ASC;


-- [문제8] 커미션을 받는 모든 사원들의 last_name, salary, commission_pct를 조회한 후
-- 연봉의 내림차순, commission_pct의 내림차순 정렬
SELECT
    last_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct > 0
ORDER BY
    salary DESC,
    commission_pct DESC;
-- [문제9] 연봉이 2500, 3500, 7000이 아니며, 직업이 SA_REP, ST_CLERK인 사원조회
-- 전체 정보 조회
SELECT
    *
FROM
    employees
WHERE
    salary NOT IN ( 2500, 3500, 7000 )
    AND job_id IN ( 'SA_REP', 'ST_CLERK' );


-- [문제10] '2008-02-20' ~ '2008-05-01' 사이에 고용된 사원들의 last_name, employee_id,hire_date 조회
-- hire_date의 내림차순으로 정렬 ※ 날짜도 ' ' (홑따옴표로 묶어야함)
SELECT
    last_name,
    employee_id,
    hire_date
FROM
    employees
WHERE
        hire_date >= '2008-02-20'
    AND hire_date <= '2008-05-01'
ORDER BY
    hire_date DESC; 
    --------- between 구문으로 바꾸기
SELECT
    last_name,
    employee_id,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2008-02-20' AND '2008-05-01'
ORDER BY
    hire_date DESC; 

-- [문제11] '2004' 년도에 고용된 모든 사람들의 last_name, hire_date를 조회하여 입사일 기준으로 오름차순 정렬
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
        hire_date >= '2004-01-01'
    AND hire_date <= '2004-12-31'
ORDER BY
    hire_date ASC;
    --------- between 구문으로 바꾸기
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2004-01-01' AND '2004-12-31'
ORDER BY
    hire_date ASC;
    
--[문제 12] '2004' 년도에 고용된 모든 사람들의 last_name, hire_date를 조회하여 입사일 기준으로 오름차순 정렬
--LIKE와 와일드 카드 쓰는 문제로 바꿈
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date LIKE '04%'
ORDER BY
    hire_date;
--[문제 13] last_name에 u가 포함되는 사원들의 사번 및 last_name 조회
SELECT
    last_name,
    employee_id
FROM
    employees
WHERE
    last_name LIKE '%u%'; 
--[문제 14] last_name의 네번째 글자가 a인 사원들의 사번 및 last_name 조회
SELECT
    last_name,
    employee_id
FROM
    employees
WHERE
    last_name LIKE '___a%';
--[문제 15] last_name의 a혹은 e가 들어있는 사원들의 last_name 조회 후, last_name 오름차순 출력
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%'
    OR last_name LIKE '%e%'
ORDER BY
    last_name ASC;
--[문제 16] last_name의 a와 e가 들어있는 사원들의 last_name 조회 후, last_name 오름차순 출력
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%e%'
    OR last_name LIKE '%e%a%'
ORDER BY
    last_name ASC;
 
--[문제 17] 매니저가 없는 사원들의 last_name, job_id 조회    
SELECT
    last_name,
    job_id,
    manager_id
FROM
    employees
WHERE
    manager_id IS NULL;

--[문제 18] ST_CLERK인 job_id를 가진 사원이 없는 부서 id 조회
SELECT
    department_id
FROM
    employees
WHERE
    job_id NOT IN ( 'ST_CLERK' )
    AND department_id IS NOT NULL; 
--단, 부서번호가 NULL인 값은 제외한다

--[문제 19] commission_pct 가 null 이 아닌 사원들 중에서 commission = salary * commison_pct 를 구하여, employee_id, first_name, job_id와 함께 출력
SELECT
    employee_id,
    first_name,
    job_id,
    salary * commission_pct AS commission
FROM
    employees
WHERE
    commission_pct IS NOT NULL;
    
--[문제] first_name이 Curtis인 사람의 frist_name, last_name, phone_number, job_id 조회
--단, job_id의 결과는 소문자로 출력하기
SELECT
    first_name,
    last_name,
    phone_number,
    job_id,
    lower(job_id)
FROM
    employees
WHERE
    first_name = 'Curtis';

--[문제] 부서번호가 60,70,80,90 인 사원들의 employee_id, first_name, last_name, department_id, job id 조회하기
--단, job_id가 IT_PROG 인 사원의 경우 프로그래머로 변경하여 출력
SELECT
    employee_id,
    first_name,
    last_name,
    department_id,
    job_id,
    replace(job_id, 'IT_PROG', '프로그래머')
FROM
    employees
WHERE
    department_id IN ( 60, 70, 80, 90 );
--[문제] job_id가 AD_PRES, PU_CLERK인 사원들의 employee_id, first_name, last_name, department_id, job id 조회하기
--단, 사원명은 first_name 과 last_name을 연결하여 출력
SELECT
    employee_id,
    first_name
    || ' '
    || last_name,
    department_id,
    job_id
FROM
    employees
WHERE
    job_id IN ( 'AD_PRES', 'PU_CLERK' );
    
-- 실습문제
-- employees 의 department_id가 80의 각 사원의 급여를 기준
-- 급여 2000미만 : 세율 0%
-- 급여 2000이상 ~ 4000미만 : 세율 9%
-- 급여 4000이상 ~ 6000미만 20%
-- 급여 6000이상 ~ 8000미만 30%
-- 급여 8000이상 ~ 10000미만 40%
-- 급여 10000이상 12000미만 42%
-- 급여 12000이상 14000미만 44%
-- 급여 14000이상 45%

SELECT
    last_name,
    salary,
    decode(trunc(salary / 2000), 0, 0.00, 1, 0.09,
           2, 0.20, 3, 0.30, 4,
           0.40, 5, 0.42, 6, 0.44,
           7, 0.45) AS tax_rate
FROM
    employees
WHERE
    department_id = 80;

-- 문제 : 회사 내의 최대 연봉 및 최소 연봉 차를 출력

SELECT
    MAX(salary) - MIN(salary)
FROM
    employees;

-- 문제 : 매니저로 근무하는 사원들의 총 숫자를 출력
SELECT
    COUNT(DISTINCT manager_id)
FROM
    employees;


-- 부서별 직원 수를 구하여, 부서번호의 오름차순으로 출력
SELECT
    department_id,
    COUNT(department_id)
FROM
    employees
GROUP BY
    department_id
ORDER BY
    department_id;
-- 부서별 급여의 평균 연봉 출력(부서번호별 오름차순)
SELECT
    department_id,
    round(AVG(salary))
FROM
    employees
GROUP BY
    department_id
ORDER BY
    department_id;
-- 동일한 직업을 가진 사원들의 수를 출력
SELECT
    job_id,
    COUNT(employee_id)
FROM
    employees
GROUP BY
    job_id
ORDER BY
    job_id;

SELECT
    *
FROM
    employees;
-- [실습] 자신의 담당 매니저의 고용일보다 빠른 입사자 찾기(employees 셀프조인)
--- 나의 풀이---
SELECT
    e1.employee_id,
    e1.hire_date,
    e2.manager_id,
    e2.hire_date
FROM
    employees e1,
    employees e2
WHERE
    e1.hire_date > e2.hire_date;
    -------- 풀이 -----------
SELECT
    e1.employee_id,
    e1.last_name AS 내입사일,
    e1.hire_date,
    e1.manager_id,
    e2.hire_date AS 매니저입사일
FROM
         employees e1
    JOIN employees e2 ON e1.manager_id = e2.employee_id
WHERE
    e1.hire_date < e2.hire_date
ORDER BY
    e1.employee_id;


-- [실습} 도시 이름이 T로 시작하는 지역에 사는 사원들의 사번, last_name, department_id, city
-- 출력(employees, departments, locations 테이블 조인)
--- 나의 풀이---
SELECT
    employee_id,
    last_name,
    d.department_id,
    city
FROM
    employees   e,
    departments d,
    locations   l
WHERE
        e.department_id = d.department_id
    AND d.location_id = l.location_id
    AND city LIKE 'T%';
    ----- 풀이 -----
SELECT
    employee_id,
    last_name,
    d.department_id,
    city
FROM
         employees e
    JOIN departments d ON e.department_id = d.department_id
    JOIN locations   l ON d.location_id = l.location_id
WHERE
    city LIKE 'T%';

--[실습] 위치 ID가 1700인 사원들의 employee_id, last_name, department_id, salary
-- 출력(employees, departments 조인)
----- 내 풀이 -----
SELECT
    e.employee_id,
    e.last_name,
    e.department_id,
    e.salary,
    d.department_id,
    d.location_id
FROM
         employees e
    JOIN departments d ON e.department_id = d.department_id
                          AND d.location_id = 1700;
    ------ 풀이 ------
SELECT
    employee_id,
    last_name,
    d.department_id,
    salary
FROM
         employees e
    JOIN departments d ON e.department_id = d.department_id
WHERE
    d.location_id = 1700;

--[실습] 각 부서별 평균 연봉(소수점 2자리까지), 사원 수 조회
-- department_name, location_id, sal_avg, cnt 출력
-- (employees, departments) 조인
----- 내풀이 -----
SELECT
    department_name,
    location_id,
    round(AVG(salary), 2) AS avg_sal,
    COUNT(employee_id)    AS cnt
FROM
         employees e
    JOIN departments d ON e.department_id = d.department_id
GROUP BY
    department_name,
    location_id;
    ----- 풀이 -----
SELECT
    department_name,
    location_id,
    round(AVG(salary), 2) AS sal_avg,
    COUNT(employee_id)    AS cnt
FROM
         employees e
    JOIN departments d ON e.department_id = d.department_id
GROUP BY
    department_name,
    location_id
ORDER BY
    location_id;   

--[실습] excutive 부서에 근무하는 모든 사원들의 department_id, last_name, job_id 출력
-- (employees, departments 조인)
----- 내 풀이 -----
SELECT
    d.department_id,
    department_name,
    job_id,
    last_name
FROM
    employees   e,
    departments d
WHERE
        e.department_id = d.department_id
    AND department_name = 'excutive';
    ----- 풀이 -----

SELECT
    e.department_name,
    e.last_name,
    e.job_id
FROM
         employees e
    JOIN departments d ON e.department_id = d.department_id
WHERE
    d.department_name = 'excutive';
    
    
    
-- [실습] 기존의 직업을 여전히 가지고 있는 사원들의 employee_id, job_id 출력
--  job_history 내부 조인
--- 내풀이 ---
SELECT
    e1.employee_id,
    e2.employee_id,
    e1.job_id,
    e2.job_id,
    j.employee_id,
    j.job_id
FROM
         employees e1
    JOIN job_history j ON e1.employee_id = j.employee_id
    JOIN employees   e2 ON e2.employee_id = j.employee_id
WHERE
    e2.job_id = j.job_id;
    ----- 풀이 -----
SELECT
    e.employee_id,
    e.job_id
FROM
         employees e
    JOIN job_history j ON e.employee_id = j.employee_id
WHERE
    e.job_id = j.job_id;
    
-- [실습] 각 사원별 소속부서에서 자신보다 늦게 고용되었으나 보다 많은 연봉을 받는 사원의
-- department_id, last_name, salary, hire_date 출력 
-- employees 셀프 조인
---- 내풀이----
SELECT
    e1.department_id,
    e1.last_name,
    e1.salary,
    e2.department_id,
    e2.last_name,
    e2.salary
FROM
    employees e1,
    employees e2
WHERE
        e1.department_id = e2.department_id
    AND e1.hire_date < e2.hire_date
    AND e1.salary < e2.salary;
    
    ----- 풀이 -----
SELECT distinct
    e2.department_id,
    e2.last_name,
    e2.salary,
    e2.hire_date
FROM
         employees e1
    JOIN employees e2 ON e1.department_id = e2.department_id
WHERE
        e1.hire_date < e2.hire_date
    AND e1.salary < e2.salary order by e2.department_id;
    


-- index
create table indextbl as select distinct first_name, last_name, hire_date from employees;

select * from indextbl;

select * from indextbl where first_name='jack';

create index idx_indextbl_firstname on indextbl(first_name);