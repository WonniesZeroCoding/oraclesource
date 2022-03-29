-- hr(����Ŭ ������ ����)
-- scott �� ������ �ִ� ������ ����

--[����1] : employees ���̺� ��ü ���� ��ȸ
SELECT
    *
FROM
    employees;

--[����2] : employees ���̺��� first_name, last_name, job_id ��ȸ
SELECT
    first_name,
    last_name,
    job_id
FROM
    employees;

--[����3] employees ���̺��� ��� ���� ��ȸ
-- employee_id : empno (��Ī)
-- manager_id : mgr
-- department_id : dept no
-- �� ������ ���� ��Ī�� �ٿ��� ��ȸ
-- ��ȸ�� ��, �μ���ȣ�� �������� ������������ �����ϵ�, �μ���ȣ�� ���ٸ�
-- ��� �̸�(First_name)�� �������� �������� ����
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
    
-- [����4] �����ȣ�� 176�� ����� last_name�� deptno ��ȸ
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    employee_id = 176;
-- [����5] ������ 12,000 �̻� �Ǵ� �������� last_name�� salary ��ȸ
SELECT
    salary,
    last_name
FROM
    employees
WHERE
    salary >= 12000;
-- [����6] ������ 5000 ~ 12000 ���� ���̰� �ƴ� ����� ��ȸ
SELECT
    *
FROM
    employees
WHERE
    salary < 5000
    OR salary > 12000;
    
-- [����7] 20�� Ȥ�� 50�� �μ����� �ٹ��ϴ� ��� ������� last_name �� department_id ��ȸ
-- ��ȸ�� ��, last_name�� ��������, department_id�� ������������ ����
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


-- [����8] Ŀ�̼��� �޴� ��� ������� last_name, salary, commission_pct�� ��ȸ�� ��
-- ������ ��������, commission_pct�� �������� ����
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
-- [����9] ������ 2500, 3500, 7000�� �ƴϸ�, ������ SA_REP, ST_CLERK�� �����ȸ
-- ��ü ���� ��ȸ
SELECT
    *
FROM
    employees
WHERE
    salary NOT IN ( 2500, 3500, 7000 )
    AND job_id IN ( 'SA_REP', 'ST_CLERK' );


-- [����10] '2008-02-20' ~ '2008-05-01' ���̿� ���� ������� last_name, employee_id,hire_date ��ȸ
-- hire_date�� ������������ ���� �� ��¥�� ' ' (Ȭ����ǥ�� �������)
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
    --------- between �������� �ٲٱ�
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

-- [����11] '2004' �⵵�� ���� ��� ������� last_name, hire_date�� ��ȸ�Ͽ� �Ի��� �������� �������� ����
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
    --------- between �������� �ٲٱ�
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2004-01-01' AND '2004-12-31'
ORDER BY
    hire_date ASC;
    
--[���� 12] '2004' �⵵�� ���� ��� ������� last_name, hire_date�� ��ȸ�Ͽ� �Ի��� �������� �������� ����
--LIKE�� ���ϵ� ī�� ���� ������ �ٲ�
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date LIKE '04%'
ORDER BY
    hire_date;
--[���� 13] last_name�� u�� ���ԵǴ� ������� ��� �� last_name ��ȸ
SELECT
    last_name,
    employee_id
FROM
    employees
WHERE
    last_name LIKE '%u%'; 
--[���� 14] last_name�� �׹�° ���ڰ� a�� ������� ��� �� last_name ��ȸ
SELECT
    last_name,
    employee_id
FROM
    employees
WHERE
    last_name LIKE '___a%';
--[���� 15] last_name�� aȤ�� e�� ����ִ� ������� last_name ��ȸ ��, last_name �������� ���
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%'
    OR last_name LIKE '%e%'
ORDER BY
    last_name ASC;
--[���� 16] last_name�� a�� e�� ����ִ� ������� last_name ��ȸ ��, last_name �������� ���
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%e%'
    OR last_name LIKE '%e%a%'
ORDER BY
    last_name ASC;
 
--[���� 17] �Ŵ����� ���� ������� last_name, job_id ��ȸ    
SELECT
    last_name,
    job_id,
    manager_id
FROM
    employees
WHERE
    manager_id IS NULL;

--[���� 18] ST_CLERK�� job_id�� ���� ����� ���� �μ� id ��ȸ
SELECT
    department_id
FROM
    employees
WHERE
    job_id NOT IN ( 'ST_CLERK' )
    AND department_id IS NOT NULL; 
--��, �μ���ȣ�� NULL�� ���� �����Ѵ�

--[���� 19] commission_pct �� null �� �ƴ� ����� �߿��� commission = salary * commison_pct �� ���Ͽ�, employee_id, first_name, job_id�� �Բ� ���
SELECT
    employee_id,
    first_name,
    job_id,
    salary * commission_pct AS commission
FROM
    employees
WHERE
    commission_pct IS NOT NULL;
    
--[����] first_name�� Curtis�� ����� frist_name, last_name, phone_number, job_id ��ȸ
--��, job_id�� ����� �ҹ��ڷ� ����ϱ�
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

--[����] �μ���ȣ�� 60,70,80,90 �� ������� employee_id, first_name, last_name, department_id, job id ��ȸ�ϱ�
--��, job_id�� IT_PROG �� ����� ��� ���α׷��ӷ� �����Ͽ� ���
SELECT
    employee_id,
    first_name,
    last_name,
    department_id,
    job_id,
    replace(job_id, 'IT_PROG', '���α׷���')
FROM
    employees
WHERE
    department_id IN ( 60, 70, 80, 90 );
--[����] job_id�� AD_PRES, PU_CLERK�� ������� employee_id, first_name, last_name, department_id, job id ��ȸ�ϱ�
--��, ������� first_name �� last_name�� �����Ͽ� ���
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
    
-- �ǽ�����
-- employees �� department_id�� 80�� �� ����� �޿��� ����
-- �޿� 2000�̸� : ���� 0%
-- �޿� 2000�̻� ~ 4000�̸� : ���� 9%
-- �޿� 4000�̻� ~ 6000�̸� 20%
-- �޿� 6000�̻� ~ 8000�̸� 30%
-- �޿� 8000�̻� ~ 10000�̸� 40%
-- �޿� 10000�̻� 12000�̸� 42%
-- �޿� 12000�̻� 14000�̸� 44%
-- �޿� 14000�̻� 45%

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

-- ���� : ȸ�� ���� �ִ� ���� �� �ּ� ���� ���� ���

SELECT
    MAX(salary) - MIN(salary)
FROM
    employees;

-- ���� : �Ŵ����� �ٹ��ϴ� ������� �� ���ڸ� ���
SELECT
    COUNT(DISTINCT manager_id)
FROM
    employees;


-- �μ��� ���� ���� ���Ͽ�, �μ���ȣ�� ������������ ���
SELECT
    department_id,
    COUNT(department_id)
FROM
    employees
GROUP BY
    department_id
ORDER BY
    department_id;
-- �μ��� �޿��� ��� ���� ���(�μ���ȣ�� ��������)
SELECT
    department_id,
    round(AVG(salary))
FROM
    employees
GROUP BY
    department_id
ORDER BY
    department_id;
-- ������ ������ ���� ������� ���� ���
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
-- [�ǽ�] �ڽ��� ��� �Ŵ����� ����Ϻ��� ���� �Ի��� ã��(employees ��������)
--- ���� Ǯ��---
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
    -------- Ǯ�� -----------
SELECT
    e1.employee_id,
    e1.last_name AS ���Ի���,
    e1.hire_date,
    e1.manager_id,
    e2.hire_date AS �Ŵ����Ի���
FROM
         employees e1
    JOIN employees e2 ON e1.manager_id = e2.employee_id
WHERE
    e1.hire_date < e2.hire_date
ORDER BY
    e1.employee_id;


-- [�ǽ�} ���� �̸��� T�� �����ϴ� ������ ��� ������� ���, last_name, department_id, city
-- ���(employees, departments, locations ���̺� ����)
--- ���� Ǯ��---
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
    ----- Ǯ�� -----
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

--[�ǽ�] ��ġ ID�� 1700�� ������� employee_id, last_name, department_id, salary
-- ���(employees, departments ����)
----- �� Ǯ�� -----
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
    ------ Ǯ�� ------
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

--[�ǽ�] �� �μ��� ��� ����(�Ҽ��� 2�ڸ�����), ��� �� ��ȸ
-- department_name, location_id, sal_avg, cnt ���
-- (employees, departments) ����
----- ��Ǯ�� -----
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
    ----- Ǯ�� -----
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

--[�ǽ�] excutive �μ��� �ٹ��ϴ� ��� ������� department_id, last_name, job_id ���
-- (employees, departments ����)
----- �� Ǯ�� -----
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
    ----- Ǯ�� -----

SELECT
    e.department_name,
    e.last_name,
    e.job_id
FROM
         employees e
    JOIN departments d ON e.department_id = d.department_id
WHERE
    d.department_name = 'excutive';
    
    
    
-- [�ǽ�] ������ ������ ������ ������ �ִ� ������� employee_id, job_id ���
--  job_history ���� ����
--- ��Ǯ�� ---
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
    ----- Ǯ�� -----
SELECT
    e.employee_id,
    e.job_id
FROM
         employees e
    JOIN job_history j ON e.employee_id = j.employee_id
WHERE
    e.job_id = j.job_id;
    
-- [�ǽ�] �� ����� �ҼӺμ����� �ڽź��� �ʰ� ���Ǿ����� ���� ���� ������ �޴� �����
-- department_id, last_name, salary, hire_date ��� 
-- employees ���� ����
---- ��Ǯ��----
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
    
    ----- Ǯ�� -----
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