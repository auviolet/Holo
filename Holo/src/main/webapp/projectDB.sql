
/* �쉶�썝 �뀒�씠釉� */
CREATE TABLE members(
member_id VARCHAR2(50)
, member_pw varchar2(30)
, member_name varchar2(20)
, member_nickname varchar2(20)
, member_sex NUMBER
, member_level NUMBER
)
comment on table members  is 'Member';

/* 방명록 테이블 생성 */
CREATE TABLE guest_books(
guestbook_idx NUMBER
, guestbook_subject varchar2(100)
, guestbook_content varchar2(2000)
, guestbook_regdate DATE
, guestbook_count NUMBER /*클릭 숫자*/
, guestbook_hit	NUMBER /*좋아요? 숫자*/
, guestbook_writer varchar2(20) /*member_nickname*/
)
comment on table guest_books  is 'Guestbooks';
/*
ALTER TABLE guest_books RENAME guestbook_subejct TO guestbook_subject;
*/
SELECT * from comments;
/* 諛⑸챸濡� �뙎湲� �뀒�씠釉� */
CREATE TABLE comments(
comment_idx NUMBER
, comment_ref_idx NUMBER /* 부모글 참조한 댓글 우선순위주기 위한*/
, comment_content varchar2(900)
, comment_writer varchar2(20)/*member_nickname*/
)
comment on table comments  is 'Comments';

/* �쓬�떇�젏 �뀒�씠釉� */
CREATE TABLE bistros(
bistro_idx NUMBER
, bistro_name varchar2(50)
, bistro_addr varchar2(200)
, bistro_tel varchar2(20)
, bistro_office_hour varchar2(100)
, bistro_comment varchar2(1000)
, bistro_keyword varchar2(200)
, bistro_img varchar2(600)
)

comment on table bistros  is 'Bistros';


/*  �뀒�씠釉� */
CREATE TABLE reviews(
review_idx NUMBER
, review_grade NUMBER
, review_date DATE
, review_comment varchar2(300)
, bistro_idx NUMBER
, member_id VARCHAR2(50)
)
comment on table reviews  is 'Reviews';

SELECT * FROM tab;
COMMIT;
SELECT * FROM user_sequences;

/*시퀀스 삭제*/
/*
DROP sequence bistro_idx_seq;
DROP sequence comment_idx_seq;
DROP sequence guestbook_idx_seq;
DROP sequence review_idx_seq;
*/

/* 시퀀스 생성 */
CREATE SEQUENCE guestbook_idx_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;

CREATE SEQUENCE comment_idx_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;

CREATE SEQUENCE bistro_idx_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;

CREATE SEQUENCE review_idx_seq
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE;


/* 기본키 제약조건  */
alter table members add constraint memebers_member_id_pk primary key(member_id);

alter table guest_books add constraint guestbooks_guestbook_idx_pk primary key(guestbook_idx);

alter table comments add constraint comments_comment_idx_pk primary key(comment_idx);

alter table bistros add constraint bistros_bistro_idx_pk primary key(bistro_idx);

alter table reviews add constraint reviews_review_idx_pk primary key(review_idx);

/* 외래키 제약조건 */
alter table reviews ADD CONSTRAINT reviews_member_id_fk FOREIGN KEY(member_id)  REFERENCES members(member_id);
alter table reviews ADD CONSTRAINT reviews_bistro_idx_fk FOREIGN KEY(bistro_idx)  REFERENCES bistros(bistro_idx);

alter table guest_books ADD CONSTRAINT guestbooks_member_id_fk FOREIGN KEY(member_id)  REFERENCES members(member_id);

alter table comments ADD CONSTRAINT comments_member_id_fk FOREIGN KEY(member_id)  REFERENCES members(member_id);
alter table comments ADD CONSTRAINT comments_guestbook_idx_fk FOREIGN KEY(guestbook_idx)  REFERENCES guest_books(guestbook_idx);

/* 제약조건 삭제*/
/*
ALTER TABLE reviews DROP CONSTRAINT reviews_member_id_fk;
ALTER TABLE reviews DROP CONSTRAINT reviews_bistro_idx_fk;
ALTER TABLE guest_books DROP CONSTRAINT guestbooks_member_id_fk;
ALTER TABLE comments DROP CONSTRAINT comments_member_id_fk;
ALTER TABLE comments DROP CONSTRAINT comments_guestbook_idx_fk;
*/

/*테이블 모두(틀도) 삭제*/
/*
DROP TABLE members;
DROP TABLE guest_books;
DROP TABLE comments;
DROP TABLE reviews;
DROP TABLE bistros;*/