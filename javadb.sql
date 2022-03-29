-- member ���̺� ����
-- id(����, 8) pk ����
-- name(���� ���ڿ�, 20) not null
-- addr(���� ���ڿ�, 50) not null
--email(�������ڿ�, 30) not null
--age number(3)

CREATE TABLE member (
    id    NUMBER(8) PRIMARY KEY,
    name  VARCHAR2(20) NOT NULL,
    addr  VARCHAR2(50) NOT NULL,
    email VARCHAR2(30) NOT NULL,
    age   NUMBER(3)
);

select * from member;

create sequence member_seq;

commit;