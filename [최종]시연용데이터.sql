

---------------------------------------
--     [확인필수] fooding_최종.sql 파일을 스크립트 실행해도 기존 데이터가 삭제안되고 그대로 남아있는 증상 있음
--     [해결방법]
--               "해당 계정의 모든테이블 및 제약조건 삭제"
--               >> 해당 구문을 드래그해서 별도 실행한 후에 전체 스크립트 실행할것!
----------------------------------------



------------- 시연용 TB_USER 관리자,회원 -------------
--관리자
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'fooding01', '1111', '푸딩01', '', '', '', '', '', '', '', 'A');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'fooding02', '2222', '푸딩02', '', '', '', '', '', '', '', 'A');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'fooding03', '3333', '푸딩03', '', '', '', '', '', '', '', 'A');
--유저
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user01', '1111', '팜하니', '농장주인', 'farmer@naver.com', '01000001111', 'F', '20040101', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user02', '2222', '강해린', '아기고양이', 'kitty@naver.com', '01000002222', 'F', '20040102', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user03', '3333', '김민지', '핫세', 'minji33@naver.com', '01000003333', 'F', '20040103', SYSDATE, SYSDATE, 'Y');

------------- 시연용 RESTAURANT  업체 -------------
INSERT INTO RESTAURANT VALUES -- 첫로그인 테스트용 업체 / 아이디 : 1200
(SEQ_RESNO.NEXTVAL,'1234', '미미식당', '김미미',  '899-52-52007', '서울시 금천구 가산동', '대륭3차 11층', '서울특별시', '금천구', '02-555-6666', '010-6666-7777', 'FOODY@EMAIL.COM', 'Y', SYSDATE, SYSDATE, SYSDATE, 'C', '12345123', '12345123', null, '8:00', '21:00', '15:00', '16:00', 'japanese', 0);
INSERT INTO RESTAURANT VALUES -- 일반테스트 업체 / 아이디 1201
(SEQ_RESNO.NEXTVAL,'1234', '루키식당', '하이루',  '777-52-52007', '서울시 금천구 가산동', '대륭3차 11층', '서울특별시', '금천구', '02-555-6666', '010-6666-7777', 'FOODY@EMAIL.COM', 'Y', SYSDATE, SYSDATE, SYSDATE, 'Y', '12345123', '12345123', 'resources/restaurantSample/1_rosebud.jpg', '8:00', '19:00', null , null, 'bar',0);

------------- 시연용 MENU 메뉴 -------------
INSERT INTO MENU VALUES (SEQ_MNO.NEXTVAL, 1201, '모짜렐라비프라자냐', 15000, NULL, 'resources/restaurantSample/모짜렐라비프라자냐.jpg');
INSERT INTO MENU VALUES (SEQ_MNO.NEXTVAL, 1201, '멕시칸비프파히타', 18000, NULL, 'resources/restaurantSample/멕시칸비프파히타.jpg');
INSERT INTO MENU VALUES (SEQ_MNO.NEXTVAL, 1201, '콜라', 2000, NULL, 'resources/restaurantSample/콜라.jpg');

------------- QUESTION 문의답변 -------------
INSERT INTO QUESTION VALUES
(SEQ_QNO.NEXTVAL, '예약문의', '지난 예약때 물건을 놓고 온것 같아요.', '빨간색 카드지갑인데 혹시 분실물 있나요?'
, SYSDATE, SYSDATE, NULL, '네. 보관중입니다. 찾으러 오세요.^^', SYSDATE, 'Y', '6', 'U', 1201, 'R');
INSERT INTO QUESTION VALUES
(SEQ_QNO.NEXTVAL, '예약문의', '예약했는데 날짜를 바꾸고 싶어요!', '일단 취소를 해주시면 다시 예약하겠습니다.'
, SYSDATE, SYSDATE, NULL, '네. 취소 완료하였습니다.^^', SYSDATE, 'Y', '6', 'U', 1201, 'R');
INSERT INTO QUESTION VALUES
(SEQ_QNO.NEXTVAL, '이용문의', '알러지가 있습니다', '오이알러지가 있어요. 오이가 들어간 메뉴를 알려주세요'
, SYSDATE, NULL, NULL, NULL, NULL, 'N', '4', 'U', 1201, 'R');
INSERT INTO QUESTION VALUES
(SEQ_QNO.NEXTVAL, '이용문의', '애견동반 가능한가요?', '애견동반이라는 얘기가 있어서 문의드려요'
, SYSDATE, NULL, NULL, NULL, NULL, 'N', '5', 'U', 1201, 'R');


------------- BOOK 예약 -------------
--1200 업체
INSERT INTO BOOK VALUES (1, 1, 1200, '팜하니', '01055556666'
, '2023/02/11', '18:00', 3, 'hello@gmail.com', NULL, 'D', SYSDATE, SYSDATE);
INSERT INTO BOOK VALUES (2, 2, 1200, '김미미', '01055556666'
, '2023/02/19', '12:30', 2, 'nice@gmail.com', NULL, 'C', SYSDATE, SYSDATE);
--1201 업체
INSERT INTO BOOK VALUES (25, 1, 1201, '팜하니', '01055556666'
, '2023/02/01', '18:30', 3, 'hello@gmail.com', NULL, 'D', SYSDATE, SYSDATE);
INSERT INTO BOOK VALUES (30, 2, 1201, '김미미', '01055556666'
, '2023/02/19', '12:30', 2, 'nice@gmail.com', NULL, 'C', SYSDATE, SYSDATE);
INSERT INTO BOOK VALUES (38, 3, 1201, '한나', '01055556666'
, '2023/02/12', '17:00', 4, 'true@gmail.com', '주차관련으로 문의남겨놨어요', 'B', SYSDATE, SYSDATE);


------------- BOOK_MENU 주문메뉴 -------------
--25번주문
INSERT INTO BOOK_MENU VALUES (SEQ_BMNO.NEXTVAL, 25, 2, 1, 18000); 
INSERT INTO BOOK_MENU VALUES (SEQ_BMNO.NEXTVAL, 25, 3, 3, 6000);
--30번주문
INSERT INTO BOOK_MENU VALUES (SEQ_BMNO.NEXTVAL, 30, 1, 1, 15000); 
--38번주문
INSERT INTO BOOK_MENU VALUES (SEQ_BMNO.NEXTVAL, 38, 1, 1, 15000); 
INSERT INTO BOOK_MENU VALUES (SEQ_BMNO.NEXTVAL, 38, 2, 1, 18000); 
INSERT INTO BOOK_MENU VALUES (SEQ_BMNO.NEXTVAL, 38, 3, 2, 4000);

------------- PAYMENT 결제 -------------
INSERT INTO PAYMENT VALUES (SEQ_PMNO.NEXTVAL, 25, 1201, 3, 0, 24000, '신용카드', SYSDATE, 'Y');   
INSERT INTO PAYMENT VALUES (SEQ_PMNO.NEXTVAL, 30, 1201, 3, 0, 15000, '신용카드', SYSDATE, 'Y');   
INSERT INTO PAYMENT VALUES (SEQ_PMNO.NEXTVAL, 38, 1201, 3, 0, 37000, '신용카드', SYSDATE, 'Y'); 





------------- 정산 테스트용 -------------
INSERT INTO BOOK VALUES (12, 1, 1201, '김예은', '01012345678'
, '2023/01/01', '18:00', 3, 'hello@gmail.com', NULL, 'D', '2023/01/02', '2022/12/23');
INSERT INTO BOOK VALUES (18, 1, 1201, '채치수', '01012345678'
, '2023/01/01', '12:00', 3, 'hello@gmail.com', NULL, 'D', '2023/01/15', '2022/12/30');
INSERT INTO BOOK VALUES (19, 1, 1201, '강백호', '01012345678'
, '2023/01/18', '19:30', 4, 'hello@gmail.com', NULL, 'D', '2023/01/09', '2023/01/01');
INSERT INTO BOOK VALUES (21, 1, 1201, '서태웅', '01012345678'
, '2023/01/20', '18:30', 5, 'hello@gmail.com', NULL, 'D', '2023/01/22', '2023/01/12');

INSERT INTO PAYMENT VALUES (SEQ_PMNO.NEXTVAL, 12, 1201, 3, 0, 45000, '신용카드', SYSDATE, 'Y'); 
INSERT INTO PAYMENT VALUES (SEQ_PMNO.NEXTVAL, 18, 1201, 3, 0, 37000, '신용카드', SYSDATE, 'Y'); 
INSERT INTO PAYMENT VALUES (SEQ_PMNO.NEXTVAL, 19, 1201, 3, 0, 17000, '신용카드', SYSDATE, 'Y'); 
INSERT INTO PAYMENT VALUES (SEQ_PMNO.NEXTVAL, 21, 1201, 3, 0, 51000, '신용카드', SYSDATE, 'Y'); 

------------- REIVEW 리뷰 -------------
INSERT INTO REVIEW(REVIEW_NO, RES_NO, USER_NO, BOOK_NO, REVIEW_CONTENT, STAR, CREATE_DATE, STATUS, GOOD, COUNT) VALUES
(SEQ_RVNO.NEXTVAL, 1201, 1, 25, '정말 맛있어요! 리뷰도 길게 남기고 사진도 함께 남길께요. 정말 맛있어요! 리뷰도 길게 남기고 사진도 함께 남길께요.', 5, SYSDATE, 'Y', 'N', 0);
INSERT INTO REVIEW(REVIEW_NO, RES_NO, USER_NO, BOOK_NO, REVIEW_CONTENT, STAR, CREATE_DATE, STATUS, GOOD, COUNT) VALUES
(SEQ_RVNO.NEXTVAL, 1201, 4, 30,  '머리카락ㅡㅡ나왔어요. 위생별로인듯', 1, SYSDATE, 'Y', 'N', 0);
INSERT INTO REVIEW(REVIEW_NO, RES_NO, USER_NO, BOOK_NO, REVIEW_CONTENT, STAR, CREATE_DATE, STATUS, GOOD, COUNT) VALUES
(SEQ_RVNO.NEXTVAL, 1201, 2, 38,  '굿입니다. 아주 굿', 5, SYSDATE, 'Y', 'Y', 0);

------------- ATTACHMENT 첨부파일 -------------
INSERT INTO ATTACHMENT VALUES (SEQ_ATNO.NEXTVAL, 1, '사진1.jpg', '2023020309460951785.jpg', 'resources/review_upfiles/', SYSDATE, NULL, 'Y', 'R');
INSERT INTO ATTACHMENT VALUES (SEQ_ATNO.NEXTVAL, 1, '사진2.jpg', '2023020416174051873.jpg', 'resources/review_upfiles/', SYSDATE, NULL, 'Y', 'R');
INSERT INTO ATTACHMENT VALUES (SEQ_ATNO.NEXTVAL, 1, '사진3.jpg', '2023020309442613989.jpg', 'resources/review_upfiles/', SYSDATE, NULL, 'Y', 'R');

------------- NOT_ABLE 예약불가날짜 -------------
INSERT INTO NOT_ABLE VALUES (SEQ_NANO.NEXTVAL, 1201, 2023, 1, 2);
INSERT INTO NOT_ABLE VALUES (SEQ_NANO.NEXTVAL, 1201, 2023, 1, 9);
INSERT INTO NOT_ABLE VALUES (SEQ_NANO.NEXTVAL, 1201, 2023, 2, 8);
INSERT INTO NOT_ABLE VALUES (SEQ_NANO.NEXTVAL, 1201, 2023, 2, 15);
INSERT INTO NOT_ABLE VALUES (SEQ_NANO.NEXTVAL, 1201, 2023, 2, 22);
---------------------------------------------------


-------------  TB_USER 데이터 -------------
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user04', 'jJ123$', '다니엘', '해바라기', 'danielle04@naver.com', '01000004444', 'F', '20040104', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user26', 'bB323@', '강동원', '참치', 'tuna26@naver.com', '01012311111', 'M', '19810101', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user27', 'bB323#', '서강준', '비타민', 'vitamin@naver.com', '01023422222', 'M', '19930203', SYSDATE, SYSDATE, 'N');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user05', 'jJ123%', '이혜인', '헨이이', 'hyein2008@naver.com', '01000005555', 'F', '20040105', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user10', 'aA223!', '정호석', '호비', 'hopp10@naver.com', '01012345555', 'N', '20040101', SYSDATE, SYSDATE, 'S');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user14', 'aA323!', '김리사', '셀리사', 'lisaaa@naver.com', '01000001114', 'F', '19960104', SYSDATE, SYSDATE, 'S');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user15', 'aA323@', '김가현', '잇프피', 'isfp15@naver.com', '01000001115', 'F', '19960105', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user28', 'bB323$', '차은우', '얼굴천재', 'facegenius@naver.com', '01034543333', 'M', '19970207', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user29', 'cC123!', '박보검', '보거미', 'hipark@naver.com', '01098761111', 'M', '19931231', SYSDATE, SYSDATE, 'S');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user16', 'bB123!', '김채원', '채채', 'chaechae@naver.com', '01022441111', 'F', '20000801', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user17', 'bB123@', '허윤진', '핫걸', 'hotgirl17@naver.com', '01022331111', 'F', '2000103', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user09', 'aA123$', '김태형', '태태', 'vvvvv09@naver.com', '01012344444', 'M', '20040101', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user19', 'bB123$', '안유진', '안댕댕', 'puppy19@naver.com', '01088001111', 'F', '20040101', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user20', 'bB123%', '김지원', '치즈냥이', 'liz20@naver.com', '01002024222', 'F', '20040102', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user21', 'bB223!', '이민호', '리노', 'minho21@naver.com', '01023451111', 'M', '20001201', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user22', 'bB223@', '서창빈', '비니', 'bin22@naver.com', '01034562222', 'M', '20001102', SYSDATE, SYSDATE, 'S');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user11', 'aA223@', '김지수', '지츄', 'jisoo11@naver.com', '01000001110', 'F', '19960101', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user12', 'aA223#', '김제니', '젠득이', 'jennie12@naver.com', '01000001112', 'F', '19960102', SYSDATE, SYSDATE, 'N');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user30', 'cC123@', '공유', '커피프린스', 'coffelover@naver.com', '01099991111', 'M', '19811203', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user13', 'aA223$', '김로제', '챙람쥐', 'rosie13@naver.com', '01000001113', 'N', '19960303', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user23', 'bB223#', '한지성', '다람지', 'han23@naver.com', '01045673333', 'M', '20001003', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user18', 'bB123#', '홍은채', '만채', 'hong18@naver.com', '01022771111', 'F', '20061210', SYSDATE, SYSDATE, 'S');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user24', 'bB223$', '이용복', '필깅이', 'felixlee@naver.com', '01056781111', 'N', '20040201', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user25', 'bB323!', '황현진', '황자님', 'prince25@naver.com', '01067891111', 'M', '20040401', SYSDATE, SYSDATE, 'N');
-------------  REVIEW 데이터 -------------
INSERT INTO REVIEW VALUES (SEQ_RVNO.NEXTVAL, SEQ_RESNO.CURRVAL, 5, 2, '너무 맛있어요 분위기도 넘 좋아요~!', 4.5, SYSDATE, SYSDATE, 'Y', 'N', DEFAULT);
INSERT INTO REVIEW VALUES (SEQ_RVNO.NEXTVAL, SEQ_RESNO.CURRVAL, 6, 1, '기분이 나쁘네요...', 2.5, SYSDATE, SYSDATE, 'Y', 'N', DEFAULT);
INSERT INTO REVIEW VALUES (SEQ_RVNO.NEXTVAL, SEQ_RESNO.CURRVAL, 9, 2, '넘 맛잇어요ㅋㅋ 담에 또 올게요', 5.0, SYSDATE, SYSDATE, 'Y', 'N', DEFAULT);
INSERT INTO REVIEW VALUES (SEQ_RVNO.NEXTVAL, SEQ_RESNO.CURRVAL, 11, 1, '메롱~!', 4.5, SYSDATE, SYSDATE, 'Y', 'N', DEFAULT);
INSERT INTO REVIEW VALUES (SEQ_RVNO.NEXTVAL, SEQ_RESNO.CURRVAL, 22, 2, '여기 다시 올거같아요', 4.0, SYSDATE, SYSDATE, 'Y', 'N', DEFAULT);
INSERT INTO REVIEW VALUES (SEQ_RVNO.NEXTVAL, SEQ_RESNO.CURRVAL, 23, 2, '정말 맛있고 직원들 친절해서 넘 좋았어요 담에 다시 방문할게요~', 4.5, SYSDATE, SYSDATE, 'Y', 'N', DEFAULT);
INSERT INTO REVIEW VALUES (SEQ_RVNO.NEXTVAL, SEQ_RESNO.CURRVAL, 21, 1, '맛있긴한데 웨이팅이 넘길었어요ㅠㅠ', 3.5, SYSDATE, SYSDATE, 'Y', 'N', DEFAULT);
INSERT INTO REVIEW VALUES (SEQ_RVNO.NEXTVAL, SEQ_RESNO.CURRVAL, 16, 2, '미국에서 먹는 맛 그 잡채', 5.0, SYSDATE, SYSDATE, 'Y', 'N', DEFAULT);
INSERT INTO REVIEW VALUES (SEQ_RVNO.NEXTVAL, SEQ_RESNO.CURRVAL, 17, 1, '맛있습니당 냠냠', 4.5, SYSDATE, SYSDATE, 'Y', 'N', DEFAULT);
INSERT INTO REVIEW VALUES (SEQ_RVNO.NEXTVAL, SEQ_RESNO.CURRVAL, 20, 2, '강쥐 출입가능해서 넘 좋앗고요 담에도 친구강쥐랑 다시 올게요 넘 맛있어요 최고><', 4.0, SYSDATE, SYSDATE, 'Y', 'N', DEFAULT);
-------------  POINT 데이터 -------------
INSERT INTO POINT VALUES (SEQ_PNO.NEXTVAL, NULL, 3, NULL
,'새해맞이이벤트', 'B', '2000','2000',SYSDATE);
INSERT INTO POINT VALUES (SEQ_PNO.NEXTVAL, NULL, 3, NULL
,'구매10%', 'B', '3000','5000',SYSDATE);
-------------  NOTICE 데이터 -------------
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '회원 공지사항', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '회원 공지사항', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '회원 공지사항', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '회원 공지사항', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '회원 공지사항', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '회원 공지사항', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '회원 공지사항', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '회원 공지사항', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '회원 공지사항', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '회원 공지사항', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '업체 공지사항', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'R', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '업체 공지사항', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'R', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '업체 공지사항', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'R', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '업체 공지사항', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'R', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '업체 공지사항', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'R', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '업체 공지사항', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'R', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '업체 공지사항', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'R', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '업체 공지사항', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'R', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '업체 공지사항', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'R', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '업체 공지사항', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'R', 'Y');

INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '푸딩 이용약관 개정 안내', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '푸딩 이용약관 개정 안내', '안녕하세요. 푸딩입니다. ', '23/01/01', '', 0, 'R', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '개인정보 처리방침 전면 개정 안내', '안녕하세요. 푸딩입니다. ', '23/01/05', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '개인정보 처리방침 전면 개정 안내', '안녕하세요. 푸딩입니다. ', '23/01/05', '', 0, 'R', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '검색 기능 장애 발생 안내', '안녕하세요. 푸딩입니다. ', '23/01/07', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '검색 기능 장애 발생 안내', '안녕하세요. 푸딩입니다. ', '23/01/07', '', 0, 'R', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '서비스 이용약관 개정 안내(01.15)', '안녕하세요. 푸딩입니다. ', '23/01/10', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '서비스 이용약관 개정 안내(01.15)', '안녕하세요. 푸딩입니다. ', '23/01/10', '', 0, 'R', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '시스템 점검 안내', '안녕하세요. 푸딩입니다. ', '23/01/20', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '시스템 점검 안내', '안녕하세요. 푸딩입니다. ', '23/01/20', '', 0, 'R', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '문자 메세지 안내 시스템 점검(01.25)', '안녕하세요. 푸딩입니다. ', '23/01/20', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '문자 메세지 안내 시스템 점검(01.25)', '안녕하세요. 푸딩입니다. ', '23/01/20', '', 0, 'R', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '신한카드 시스템 정기점검 안내(01.27)', '안녕하세요. 푸딩입니다. ', '23/01/22', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, 'LGU+ 휴대폰 결제 및 본인확인 서비스 정기점검 예정(01.28)', '안녕하세요. 푸딩입니다. ', '23/01/25', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, 'SKT 휴대폰 결제 및 본인확인 서비스 정기점검 예정(01.29)', '안녕하세요. 푸딩입니다. ', '23/01/25', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '푸딩 소비자 분쟁해결 기준 안내', '안녕하세요. 푸딩입니다. ', '23/01/30', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '푸딩 소비자 분쟁해결 기준 안내', '안녕하세요. 푸딩입니다. ', '23/01/30', '', 0, 'R', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '시스템 점검으로 서비스 이용 일시 중단 안내', '안녕하세요. 푸딩입니다. ', '23/02/02', '', 0, 'U', 'Y');
INSERT INTO NOTICE VALUES(SEQ_NONO.NEXTVAL, 1, '시스템 점검으로 서비스 이용 일시 중단 안내', '안녕하세요. 푸딩입니다. ', '23/02/02', '', 0, 'R', 'Y');

------------- FAQ 회원/업체 -------------
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caM','회원 FAQ 제목','■ 회원 FAQ 내용
',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caM','회원 FAQ 제목','■ 회원 FAQ 내용
',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caM','회원 FAQ 제목','■ 회원 FAQ 내용
',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caM','회원 FAQ 제목','■ 회원 FAQ 내용
',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caM','회원 FAQ 제목','■ 회원 FAQ 내용
',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caP','적립금은 언제 지급되나요?','■ 적립금 지급 시점

-',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caP','적립금은 어떻게 누적하나요?','■ 적립금 누적 방법 안내

-',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caP','적립금은 언제까지 사용할 수 있나요?','■ 적립금 사용 방법

-',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caP','발급 받은 적립금은 어디서 확인할 수 있나요?','■ 적립금 확인 방법

-',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caP','예약 취소 시, 사용한 적립금은 복원 되나요?','■ 적립금 복원 안내

-',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caS','이용 후기는 어떻게 작성하나요?','■ 이용 후기 작성 방법

-',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caS','푸딩은 어떤 회사인가요?','■ About 푸딩

-',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caS','예약 내역은 어떻게 확인하나요?','■ 예약 내역 확인 방법

-',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caM','회원 탈퇴를 하고 싶습니다.','■ 탈퇴 방법 안내

푸딩홈 상단 [마이페이지]>개인정보수정>[회원탈퇴]버튼

- 고객님의 개인정보를 위해 직접 탈퇴만 가능합니다.
- 잔여 적립금은 탈퇴와 함께 소멸되며 별도의 환불처리는 불가합니다.',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caM','회원 탈퇴 후, 재가입이 가능한가요?','■ 회원 재가입 안내

회원 탈퇴 후, 재가입 가능합니다.',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caM','회원 가입시 어떠한 혜택이 있나요?','■ 회원가입 혜택

- 푸딩에서 진행하는 다양한 이벤트를 적용받을 수 있습니다.
- 신규가입 시, 신규회원 대상의 적립금 혜택도 주어집니다.',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caM','회원 정보를 바꾸고 싶습니다.','■ 회원정보 변경 안내

푸딩홈 상단 [마이페이지]>개인정보수정

- 위의 경로를 통해 회원정보를 직접 변경하실 수 있습니다.',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caM','아이디, 비밀번호를 잊어버렸습니다.','■ 아이디, 비밀번호 찾기 안내

[로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]

- 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능합니다.',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caB','전화로 예약 할 수 있나요?','■ 전화(유선상) 예약 불가

- 예약주문은 불가하며, 푸딩은 현재 인터넷으로만 예약이 가능합니다.',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caB','예약하는 방법이 궁금합니다.','■ 가게 예약 방법

[카테고리] 선택 > [검색하기] > 가게 조회 > [예약] > [날짜 선택] > [시간 선택] > [메뉴 선택] > [예약인원] > [예약하기]

- 위의 경로를 통해 가게 예약을 하실 수 있습니다.',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caB','결제 영수증은 어떻게 발급 받나요?','■ 결제 영수증 출력

- 결제하신 주문건의 영수증 출력과 관련하여 직접 조회가 어려우십니다.
  해당 내용은 푸딩 고객센터로 문의 부탁드립니다.',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'U','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,1,'caR','업체 FAQ 제목','■ 업체 FAQ 내용
',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'R','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,1,'caR','업체 FAQ 제목','■ 업체 FAQ 내용
',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'R','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,1,'caR','업체 FAQ 제목','■ 업체 FAQ 내용
',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'R','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,1,'caR','업체 FAQ 제목','■ 업체 FAQ 내용
',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'R','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,1,'caR','업체 FAQ 제목','■ 업체 FAQ 내용
',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'R','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caP','적립금은 언제 지급되나요?','■ 적립금 지급 시점

-',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'R','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caP','적립금은 어떻게 누적하나요?','■ 적립금 누적 방법 안내

-',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'R','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caP','적립금은 언제까지 사용할 수 있나요?','■ 적립금 사용 방법

-',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'R','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caP','발급 받은 적립금은 어디서 확인할 수 있나요?','■ 적립금 확인 방법

-',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'R','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caP','예약 취소 시, 사용한 적립금은 복원 되나요?','■ 적립금 복원 안내

-',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'R','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caS','이용 후기는 어떻게 작성하나요?','■ 이용 후기 작성 방법

-',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'R','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caS','푸딩은 어떤 회사인가요?','■ About 푸딩

-',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'R','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caS','예약 내역은 어떻게 확인하나요?','■ 예약 내역 확인 방법

-',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'R','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caR','업체 탈퇴를 하고 싶습니다.','■ 탈퇴 방법 안내

푸딩홈 상단 [마이페이지]>개인정보수정>[회원탈퇴]버튼

- 고객님의 개인정보를 위해 직접 탈퇴만 가능합니다.
- 잔여 적립금은 탈퇴와 함께 소멸되며 별도의 환불처리는 불가합니다.',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'R','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caR','업체 탈퇴 후, 재가입이 가능한가요?','■ 회원 재가입 안내

회원 탈퇴 후, 재가입 가능합니다.',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'R','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caR','업체 정보를 바꾸고 싶습니다.','■ 업체정보 변경 안내

- 위의 경로를 통해 회원정보를 직접 변경하실 수 있습니다.',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'R','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caR','아이디, 비밀번호를 잊어버렸습니다.','■ 아이디, 비밀번호 찾기 안내

- 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능합니다.',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'R','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caB','예약하는 방법이 궁금합니다.','■ 가게 예약 방법

[카테고리] 선택 > [검색하기] > 가게 조회 > [예약] > [날짜 선택] > [시간 선택] > [메뉴 선택] > [예약인원] > [예약하기]

- 위의 경로를 통해 가게 예약을 하실 수 있습니다.',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'R','Y');
INSERT INTO FAQ (FAQ_NO, USER_NO, CATEGORY, FAQ_TITLE, FAQ_CONTENT, CREATE_DATE, MODIFY_DATE, COUNT, WHO, STATUS) VALUES (SEQ_FAQNO.NEXTVAL,2,'caB','결제 영수증은 어떻게 발급 하나요?','■ 결제 영수증 출력

- 결제하신 주문건의 영수증 출력과 관련하여 직접 조회가 어려우십니다.
  해당 내용은 푸딩 고객센터로 문의 부탁드립니다.',to_date('01/01/2023', 'MM/DD/RRRR'),NULL,0,'R','Y');


---------------- 한수 시연용 업체 ---------------- 
-- 서울특별시 금천구 western 
INSERT INTO RESTAURANT (RES_NO, USER_PWD, RES_NAME, CEO, PERMIT_NO, ADDRESS, D_ADDRESS, LOCAL_CT, DLOCAL_CT, PHONE, CELLPHONE, EMAIL, APPLY_DATE, LONGTITUDE, LATITUDE, R_IMG, FOOD_CT, COUNT)
VALUES (SEQ_RESNO.NEXTVAL, '1234', '맥도날드', '김점순', '789-25-14752', '서울시 금천구 가산동', '대륭 3차 11층', '서울특별시', '금천구', '02-123-1234', '010-1234-1234', 'mimi@naver.com', SYSDATE, 
'10', '20', 'resources/rest_upfiles/2023020120361514930.jpg', 'western', '27'); 

INSERT INTO RESTAURANT (RES_NO, USER_PWD, RES_NAME, CEO, PERMIT_NO, ADDRESS, D_ADDRESS, LOCAL_CT, DLOCAL_CT, PHONE, CELLPHONE, EMAIL, APPLY_DATE, LONGTITUDE, LATITUDE, R_IMG, FOOD_CT, COUNT)
VALUES (SEQ_RESNO.NEXTVAL, '1234', '이태리식당', '박점순', '789-25-14752', '서울시 금천구 가산동', '대륭 3차 11층', '서울특별시', '금천구', '02-123-1234', '010-1234-1234', 'mimi@naver.com', SYSDATE, 
'10', '20', 'resources/rest_upfiles/2023020120361514930.jpg', 'western', '35'); 


-- 서울특별시 금천구 japanese
INSERT INTO RESTAURANT (RES_NO, USER_PWD, RES_NAME, CEO, PERMIT_NO, ADDRESS, D_ADDRESS, LOCAL_CT, DLOCAL_CT, PHONE, CELLPHONE, EMAIL, APPLY_DATE, LONGTITUDE, LATITUDE, R_IMG, FOOD_CT, COUNT)
VALUES (SEQ_RESNO.NEXTVAL, '1234', '미소야', '박철수', '789-25-14752', '서울시 금천구 가산동', '대륭 3차 11층', '서울특별시', '금천구', '02-123-1234', '010-1234-1234', 'mimi@naver.com', SYSDATE, 
'10', '20', 'resources/rest_upfiles/2023020120361514930.jpg', 'japanese', '12'); 

INSERT INTO RESTAURANT (RES_NO, USER_PWD, RES_NAME, CEO, PERMIT_NO, ADDRESS, D_ADDRESS, LOCAL_CT, DLOCAL_CT, PHONE, CELLPHONE, EMAIL, APPLY_DATE, LONGTITUDE, LATITUDE, R_IMG, FOOD_CT, COUNT)
VALUES (SEQ_RESNO.NEXTVAL, '1234', '돈까스가맛있는집', '이철수', '789-25-14752', '서울시 금천구 가산동', '대륭 3차 11층', '서울특별시', '금천구', '02-123-1234', '010-1234-1234', 'mimi@naver.com', SYSDATE, 
'10', '20', 'resources/rest_upfiles/2023020120361514930.jpg', 'japanese', '2'); 


-- 서울특별시 관악구 western 
INSERT INTO RESTAURANT (RES_NO, USER_PWD, RES_NAME, CEO, PERMIT_NO, ADDRESS, D_ADDRESS, LOCAL_CT, DLOCAL_CT, PHONE, CELLPHONE, EMAIL, APPLY_DATE, LONGTITUDE, LATITUDE, R_IMG, FOOD_CT, COUNT)
VALUES (SEQ_RESNO.NEXTVAL, '1234', '파스타가맛있는집', '김영희', '789-25-14752', '서울 관악구', '남부순환로145길 29', '서울특별시', '관악구', '02-123-1234', '010-1234-1234', 'mimi@naver.com', SYSDATE, 
'10', '20', 'resources/rest_upfiles/2023020120361514930.jpg', 'western', '4'); 

-- 서울특별시 관악구 japanese 
INSERT INTO RESTAURANT (RES_NO, USER_PWD, RES_NAME, CEO, PERMIT_NO, ADDRESS, D_ADDRESS, LOCAL_CT, DLOCAL_CT, PHONE, CELLPHONE, EMAIL, APPLY_DATE, LONGTITUDE, LATITUDE, R_IMG, FOOD_CT, COUNT)
VALUES (SEQ_RESNO.NEXTVAL, '1234', '도쿄식당', '김영희', '789-25-14752', '서울 관악구', '남부순환로145길 29', '서울특별시', '관악구', '02-123-1234', '010-1234-1234', 'mimi@naver.com', SYSDATE, 
'10', '20', 'resources/rest_upfiles/2023020120361514930.jpg', 'japanese', '8'); 








----------------------------------------------------------

COMMIT;

    
ROLLBACK;



