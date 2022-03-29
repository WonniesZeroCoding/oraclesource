-- member 테이블 생성
-- id(숫자, 8) pk 지정
-- name(가변 문자열, 20) not null
-- addr(가변 문자열, 50) not null
--email(가변문자열, 30) not null
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