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
INSERT INTO BOOK VALUES (SEQ_BKNO.NEXTVAL, 1, 1201, '한나', '01055556666'
, '2023/02/02', '15:30', 3, 'EMAIL.COM', NULL, 'B', SYSDATE, SYSDATE);
------------- REIVEW 리뷰 -------------
INSERT INTO REVIEW(REVIEW_NO, RES_NO, USER_NO, BOOK_NO, REVIEW_CONTENT, STAR, CREATE_DATE, STATUS, GOOD, COUNT)
            VALUES(SEQ_RVNO.NEXTVAL, 1201, 1, 1, '굿입니다. 아주 굿이다.', 5, SYSDATE, 'Y', 'N', 0);

INSERT INTO REVIEW(REVIEW_NO, RES_NO, USER_NO, BOOK_NO, REVIEW_CONTENT, STAR, CREATE_DATE, STATUS, GOOD, COUNT)
            VALUES(SEQ_RVNO.NEXTVAL, 1201, 2, 2,  '머리카락ㅡㅡ나왔어요. 위생별로인듯', 1, SYSDATE, 'Y', 'N', 0);
INSERT INTO REVIEW(REVIEW_NO, RES_NO, USER_NO, BOOK_NO, REVIEW_CONTENT, STAR, CREATE_DATE, STATUS, GOOD, COUNT)
            VALUES(SEQ_RVNO.NEXTVAL, 1201, 2, 3,  '하여도 원질이 뜨고, 돋고, 무엇을 일월과 열락의 아니다. 안고, 웅대한 이상의 끓는 하는 할지니, 황금시대의 인도하겠다는 인생의 아름다우냐? 아니한 꾸며 피고 있다. 보는 뼈 인생의 만천하의 동산에는 없으면, 관현악이며, 것이다. 원대하고, 장식하는 예수는 소금이라 위하여서. 가진 것은 대고, 주는 눈에 찾아 말이다.', 5, SYSDATE, 'Y', 'N', 0);
INSERT INTO REVIEW(REVIEW_NO, RES_NO, USER_NO, BOOK_NO, REVIEW_CONTENT, STAR, CREATE_DATE, STATUS, GOOD, COUNT)
            VALUES(SEQ_RVNO.NEXTVAL, 1200, 2, 1,  '굿입니다. 아주 굿이다.', 5, SYSDATE, 'Y', 'N', 0);
------------- ATTACHMENT 첨부파일 -------------
INSERT INTO ATTACHMENT VALUES (SEQ_ATNO.NEXTVAL, 1, '사진1.jpg', '2023020309460940055', 'resources/review_upfiles/', SYSDATE, NULL, 'Y', 'R');
INSERT INTO ATTACHMENT VALUES (SEQ_ATNO.NEXTVAL, 1, '사진2.jpg', '2023020309460951785', 'resources/review_upfiles/', SYSDATE, NULL, 'Y', 'R');
INSERT INTO ATTACHMENT VALUES (SEQ_ATNO.NEXTVAL, 1, '사진3.jpg', '2023020309460910025', 'resources/review_upfiles/', SYSDATE, NULL, 'Y', 'R');
------------- POINT 적립금 -------------
--2번회원에게 적립금 추가하는 구문
INSERT INTO POINT VALUES (SEQ_PNO.NEXTVAL, NULL, 2, NULL
,'새해맞이이벤트', 'B', '2000','2000',SYSDATE);
INSERT INTO POINT VALUES (SEQ_PNO.NEXTVAL, NULL, 2, NULL
,'구매10%', 'B', '3000','5000',SYSDATE);

INSERT INTO POINT VALUES (SEQ_PNO.NEXTVAL, NULL, 2, NULL
,'구매', 'B', 500, (SELECT POINT_NOW+500 FROM POINT WHERE USER_NO=2 AND ROWNUM=1 ORDER BY POINT_NO DESC),SYSDATE);

--2번 회원의 현재적립금
SELECT POINT_NOW+500
FROM POINT
WHERE USER_NO=2
AND ROWNUM=1
ORDER BY POINT_NO DESC;

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



