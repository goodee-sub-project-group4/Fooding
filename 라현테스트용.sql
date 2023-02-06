------------- TB_USER 관리자,회원 -------------
--관리자
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'fooding01', '1111', '푸딩01', '', '', '', '', '', '', '', 'A');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'fooding02', '2222', '푸딩02', '', '', '', '', '', '', '', 'A');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'fooding03', '3333', '푸딩03', '', '', '', '', '', '', '', 'A');
--유저
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user01', '1111', '팜하니', '농장주인', 'farmer@naver.com', '01000001111', 'F', '20040101', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user02', '2222', '강해린', '아기고양이', 'kitty@naver.com', '01000002222', 'F', '20040102', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user03', '3333', '김민지', '핫세', 'minji33@naver.com', '01000003333', 'F', '20040103', SYSDATE, SYSDATE, 'Y');

------------- RESTAURANT  업체 -------------
INSERT INTO RESTAURANT VALUES -- 첫로그인 테스트용 업체 / 아이디 : 1200
(SEQ_RESNO.NEXTVAL,'1234', '미미식당', '김미미',  '899-52-52007', '서울시 금천구 가산동', '대륭3차 11층', '서울특별시', '금천구', '02-555-6666', '010-6666-7777', 'FOODY@EMAIL.COM', 'Y', SYSDATE, SYSDATE, SYSDATE, 'C', '12345123', '12345123', null, '8:00', '21:00', '15:00', '16:00', 'japanese', 0);
INSERT INTO RESTAURANT VALUES -- 일반테스트 업체 / 아이디 1201
(SEQ_RESNO.NEXTVAL,'1234', '루키식당', '하이루',  '777-52-52007', '서울시 금천구 가산동', '대륭3차 11층', '서울특별시', '금천구', '02-555-6666', '010-6666-7777', 'FOODY@EMAIL.COM', 'Y', SYSDATE, SYSDATE, SYSDATE, 'Y', '12345123', '12345123', 'resources/restaurantSample/1_rosebud.jpg', '8:00', '19:00', null , null, 'bar',0);

------------- MENU 메뉴 -------------
INSERT INTO MENU VALUES (SEQ_MNO.NEXTVAL, 1201, '모짜렐라비프라자냐', 15000, NULL, 'resources/restaurantSample/모짜렐라비프라자냐.jpg');
INSERT INTO MENU VALUES (SEQ_MNO.NEXTVAL, 1201, '멕시칸비프파히타', 18000, NULL, 'resources/restaurantSample/멕시칸비프파히타.jpg');
INSERT INTO MENU VALUES (SEQ_MNO.NEXTVAL, 1201, '콜라', 2000, NULL, 'resources/restaurantSample/콜라.jpg');

------------- QUESTION 문의답변 -------------
INSERT INTO QUESTION VALUES
(SEQ_QNO.NEXTVAL, '이용문의', '알러지가 있습니다', '오이알러지가 있어요. 오이가 들어간 메뉴를 알려주세요'
, SYSDATE, NULL, NULL, NULL, NULL, 'N', '4', 'U', 1201, 'R');
INSERT INTO QUESTION VALUES
(SEQ_QNO.NEXTVAL, '이용문의', '애견동반 가능한가요?', '애견동반이라는 얘기가 있어서 문의드려요'
, SYSDATE, NULL, NULL, NULL, NULL, 'N', '5', 'U', 1201, 'R');
INSERT INTO QUESTION VALUES
(SEQ_QNO.NEXTVAL, '예약문의', '지난 예약때 물건을 놓고 온것 같아요.', '빨간색 카드지갑인데 혹시 분실물 있나요?'
, SYSDATE, SYSDATE, NULL, '네. 보관중입니다. 찾으러 오세요.^^', SYSDATE, 'Y', '6', 'U', 1201, 'R');

------------- BOOK 예약 -------------
INSERT INTO BOOK VALUES (10, 1, 1201, '팜하니', '01055556666'
, '2023/02/01', '18:30', 3, 'hello@gmail.com', NULL, 'D', SYSDATE, SYSDATE);
INSERT INTO BOOK VALUES (22, 2, 1201, '김미미', '01055556666'
, '2023/02/19', '12:30', 2, 'nice@gmail.com', NULL, 'C', SYSDATE, SYSDATE);
INSERT INTO BOOK VALUES (13, 3, 1201, '한나', '01055556666'
, '2023/02/12', '17:00', 4, 'true@gmail.com', '주차관련으로 문의남겨놨어요', 'B', SYSDATE, SYSDATE);


------------- BOOK_MENU 주문메뉴 -------------
--13번주문
INSERT INTO BOOK_MENU VALUES (SEQ_BMNO.NEXTVAL, 13, 1, 1, 15000); 
INSERT INTO BOOK_MENU VALUES (SEQ_BMNO.NEXTVAL, 13, 2, 1, 18000); 
INSERT INTO BOOK_MENU VALUES (SEQ_BMNO.NEXTVAL, 13, 3, 2, 4000);
--22번주문
INSERT INTO BOOK_MENU VALUES (SEQ_BMNO.NEXTVAL, 22, 1, 1, 15000); 
--10번주문
INSERT INTO BOOK_MENU VALUES (SEQ_BMNO.NEXTVAL, 10, 2, 1, 18000); 
INSERT INTO BOOK_MENU VALUES (SEQ_BMNO.NEXTVAL, 10, 3, 3, 6000);

------------- PAYMENT 결제 -------------
INSERT INTO PAYMENT VALUES (SEQ_PMNO.NEXTVAL, 13, 1201, 3, 0, 37000, '신용카드', SYSDATE, 'Y'); 
INSERT INTO PAYMENT VALUES (SEQ_PMNO.NEXTVAL, 22, 1201, 3, 0, 15000, '신용카드', SYSDATE, 'Y');   
INSERT INTO PAYMENT VALUES (SEQ_PMNO.NEXTVAL, 10, 1201, 3, 0, 24000, '신용카드', SYSDATE, 'Y');   


------------- ATTACHMENT 첨부파일 -------------
INSERT INTO ATTACHMENT VALUES (SEQ_ATNO.NEXTVAL, 1, '사진1.jpg', '2023020309460951785.jpg', 'resources/review_upfiles/', SYSDATE, NULL, 'Y', 'R');
INSERT INTO ATTACHMENT VALUES (SEQ_ATNO.NEXTVAL, 1, '사진2.jpg', '2023020416174051873.jpg', 'resources/review_upfiles/', SYSDATE, NULL, 'Y', 'R');
INSERT INTO ATTACHMENT VALUES (SEQ_ATNO.NEXTVAL, 1, '사진3.jpg', '2023020309442613989.jpg', 'resources/review_upfiles/', SYSDATE, NULL, 'Y', 'R');

------------- 정산 테스트용 -------------
INSERT INTO BOOK VALUES (2, 1, 1201, '김예은', '01012345678'
, '2023/01/01', '18:00', 3, 'hello@gmail.com', NULL, 'D', '2023/01/02', '2022/12/23');
INSERT INTO BOOK VALUES (8, 1, 1201, '채치수', '01012345678'
, '2023/01/01', '12:00', 3, 'hello@gmail.com', NULL, 'D', '2023/01/15', '2022/12/30');
INSERT INTO BOOK VALUES (11, 1, 1201, '강백호', '01012345678'
, '2023/01/18', '19:30', 4, 'hello@gmail.com', NULL, 'D', '2023/01/09', '2023/01/01');
INSERT INTO BOOK VALUES (19, 1, 1201, '서태웅', '01012345678'
, '2023/01/20', '18:30', 5, 'hello@gmail.com', NULL, 'D', '2023/01/22', '2023/01/12');

INSERT INTO PAYMENT VALUES (SEQ_PMNO.NEXTVAL, 2, 1201, 3, 0, 45000, '신용카드', SYSDATE, 'Y'); 
INSERT INTO PAYMENT VALUES (SEQ_PMNO.NEXTVAL, 8, 1201, 3, 0, 37000, '신용카드', SYSDATE, 'Y'); 
INSERT INTO PAYMENT VALUES (SEQ_PMNO.NEXTVAL, 11, 1201, 3, 0, 17000, '신용카드', SYSDATE, 'Y'); 
INSERT INTO PAYMENT VALUES (SEQ_PMNO.NEXTVAL, 19, 1201, 3, 0, 51000, '신용카드', SYSDATE, 'Y'); 

------------- REIVEW 리뷰 -------------
INSERT INTO REVIEW(REVIEW_NO, RES_NO, USER_NO, BOOK_NO, REVIEW_CONTENT, STAR, CREATE_DATE, STATUS, GOOD, COUNT) VALUES
(SEQ_RVNO.NEXTVAL, 1201, 1, 2, '정말 맛있어요! 리뷰도 길게 남기고 사진도 함께 남길께요. 정말 맛있어요! 리뷰도 길게 남기고 사진도 함께 남길께요.', 5, SYSDATE, 'Y', 'N', 0);
INSERT INTO REVIEW(REVIEW_NO, RES_NO, USER_NO, BOOK_NO, REVIEW_CONTENT, STAR, CREATE_DATE, STATUS, GOOD, COUNT) VALUES
(SEQ_RVNO.NEXTVAL, 1201, 2, 8,  '머리카락ㅡㅡ나왔어요. 위생별로인듯', 1, SYSDATE, 'Y', 'N', 0);
INSERT INTO REVIEW(REVIEW_NO, RES_NO, USER_NO, BOOK_NO, REVIEW_CONTENT, STAR, CREATE_DATE, STATUS, GOOD, COUNT) VALUES
(SEQ_RVNO.NEXTVAL, 1201, 2, 11,  '굿입니다. 아주 굿', 5, SYSDATE, 'Y', 'Y', 0);

------------- NOT_ABLE 예약불가날짜 -------------
INSERT INTO NOT_ABLE VALUES (SEQ_NANO.NEXTVAL, 1201, 2023, 2, 8);
---------------------------------------------------

--첫로그인 상태로 바꾸기
UPDATE RESTAURANT SET STATUS='C' WHERE RES_NO=1200;
--미답변상태로만들기
UPDATE QUESTION SET STATUS='N' WHERE Q_NO=1;
--삭제
DELETE FROM QUESTION WHERE Q_NO=10;

--반드시 커밋후 테스트할것!!
COMMIT;

ROLLBACK;



