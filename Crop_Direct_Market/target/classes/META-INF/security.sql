-- role 등록
insert into roles(authority,description,create_date) values('ROLE_ADMIN','관리자',sysdate);
insert into roles(authority,description,create_date) values('ROLE_SELLER','판매자',sysdate);
insert into roles(authority,description,create_date) values('ROLE_CONSUMER','소비자',sysdate);
commit;
-- authorities로 role.authority 와 users.user_id 매핑
insert into authorities values('ROLE_ADMIN','smlee2');commit;