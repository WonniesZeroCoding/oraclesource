-- sql ������ ��ҹ��ڸ� �������� ���� ( ��, ��й�ȣ�� ������ )
-- scott / TIGER 

-- hr ������� ��й�ȣ ����

ALTER USER hr IDENTIFIED BY hr
    ACCOUNT UNLOCK; 
    

-- ����Ŭ ������ ���̽��� Ư¡
-- ���̺�, �ε���, �� ..... �������� ��ü�� ����ں��� �����ǰ� ����
-- ����� == ��Ű�� (�����ͺ��̽� ���� ����)


-- ����� ����
-- create user ���̵� identified by ��й�ȣ;

create user test1 identified by 12345; --���� ���ѿ���

-- ���� �ο�
-- grant creat ���Ѹ� to �����;


-- ORA-01045: user TEST1 lacks CREATE SESSION privilege; logon denied

grant create session to test1;

-- ORA-01031: insufficient privileges

-- ���̺� ���� ���� �ο�
grant create table to test1;

-- ������ ������ �ְ� �Ǹ� �ʹ� ������ --> �� (���� ���ѵ��� ���� ���� ����)
grant resource,connect to test1;

-- resource : ������, table, Ʈ���� .. ��ü ������ �� �ִ� ������ �� ����
-- connect : create session �� ��� ����

-- ����� ��й�ȣ ����
alter user test1 identified by 54321;

-- ����� ����
drop user test1 cascade;

-- ���� �� ����� ������
create user javadb identified by 12345;

grant resource, connect to javadb;

-- scott ���� view ������ ���� �ο�
grant create view to scott;


















