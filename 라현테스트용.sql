------------- RESTAURANT  업체 -------------
INSERT INTO RESTAURANT VALUES --일반업체 / 아이디 : 1200
(SEQ_RESNO.NEXTVAL,'1234', '미미식당', '김미미',  '899-52-52007', '서울시 금천구 가산동', '대륭3차 11층', ' 서울', '금천구', '02-555-6666', '010-6666-7777', 'FOODY@EMAIL.COM', 'Y', SYSDATE, SYSDATE, SYSDATE, 'Y', '12345123', '12345123', null, '8:00', '21:00', '15:00', '16:00', 'japanese', 0);
INSERT INTO RESTAURANT VALUES --첫로그인 테스트용 업체 / 아이디 1201
(SEQ_RESNO.NEXTVAL,'1234', '루키식당', '하이루',  '777-52-52007', '서울시 금천구 가산동', '대륭3차 11층', ' 서울', '금천구', '02-555-6666', '010-6666-7777', 'FOODY@EMAIL.COM', 'Y', SYSDATE, SYSDATE, SYSDATE, 'C', '12345123', '12345123', null, '8:00', '19:00', null , null, 'bar',0);
------------- TB_USER 회원 -------------
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user01', '1111', '팜하니', '농장주인', 'farmer@naver.com', '01000001111', 'F', '20040101', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user02', '2222', '강해린', '아기고양이', 'kitty@naver.com', '01000002222', 'F', '20040102', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user03', '3333', '김민지', '핫세', 'minji33@naver.com', '01000003333', 'F', '20040103', SYSDATE, SYSDATE, 'Y');
------------- QUESTION 문의답변 -------------
INSERT INTO QUESTION VALUES
(SEQ_QNO.NEXTVAL, '이용문의', '알러지가 있습니다', '오이알러지가 있어요. 오이가 들어간 메뉴를 알려주세요'
, SYSDATE, NULL, NULL, NULL, NULL, 'N', '1', 'U', 1201, 'R');
INSERT INTO QUESTION VALUES
(SEQ_QNO.NEXTVAL, '이용문의', '애견동반 가능한가요?', '애견동반이라는 얘기가 있어서 문의드려요'
, SYSDATE, NULL, NULL, NULL, NULL, 'N', '2', 'U', 1201, 'R');
------------- BOOK 예약 -------------
INSERT INTO BOOK VALUES (SEQ_BKNO.NEXTVAL, 1, 1201, '김미미', '01055556666'
, '2023/01/01', '15:30', 3, 'EMAIL.COM', NULL, 'B', SYSDATE, SYSDATE);
INSERT INTO BOOK VALUES (SEQ_BKNO.NEXTVAL, 1, 1201, '김미미', '01055556666'
, '2023/02/01', '15:30', 3, 'EMAIL.COM', NULL, 'B', SYSDATE, SYSDATE);
------------- REIVEW 리뷰 -------------
INSERT INTO REVIEW(REVIEW_NO, RES_NO, USER_NO, BOOK_NO, REVIEW_CONTENT, STAR, CREATE_DATE, STATUS, GOOD, COUNT)
            VALUES(SEQ_RVNO.NEXTVAL, 1201, 1, 1, '굿입니다. 아주 굿이다.', 5, SYSDATE, 'Y', 'N', 0);

INSERT INTO REVIEW(REVIEW_NO, RES_NO, USER_NO, BOOK_NO, REVIEW_CONTENT, STAR, CREATE_DATE, STATUS, GOOD, COUNT)
            VALUES(SEQ_RVNO.NEXTVAL, 1201, 2, 2,  '머리카락ㅡㅡ나왔어요. 위생별로인듯', 1, SYSDATE, 'Y', 'N', 0);
----------------------------------------------------


--첫로그인 상태로 바꾸기
UPDATE RESTAURANT SET STATUS='C' WHERE RES_NO=1201;
--미답변상태로만들기
UPDATE QUESTION SET STATUS='N' WHERE Q_NO=1;
--삭제
DELETE FROM QUESTION WHERE Q_NO=10;

--반드시 커밋후 테스트할것!!
COMMIT;

ROLLBACK;

