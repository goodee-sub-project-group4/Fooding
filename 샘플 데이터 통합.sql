------------- TB_USER 관리자,회원 -------------
--관리자
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'fooding01', '1111', '푸딩01', '', '', '', '', '', '', '', 'A');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'fooding02', '2222', '푸딩02', '', '', '', '', '', '', '', 'A');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'fooding03', '3333', '푸딩03', '', '', '', '', '', '', '', 'A');
--유저
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user01', 'jJ123!', '팜하니', '빵하니', 'hanni01@naver.com', '01000001111', 'F', '20040101', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user02', 'jJ123@', '강해린', '아기고양이', 'kitty@naver.com', '01000002222', 'F', '20040102', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user06', 'aA123!', '김석진', '월드와이드', 'jjjin06@naver.com', '01012341111', 'M', '20040101', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user07', 'aA123@', '김남준', '랩몬', 'monster@naver.com', '01012342222', 'M', '20040101', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user08', 'aA123#', '전정국', '쿠키', 'kook@naver.com', '01012343333', 'M', '20040101', SYSDATE, SYSDATE, 'N');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user03', 'jJ123#', '김민지', '곰돌이', 'minji33@naver.com', '01000003333', 'N', '20040103', SYSDATE, SYSDATE, 'Y');
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
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user18', 'bB123#', '홍은채', '만채', 'hong18@naver.com', '01022771111', 'F', '200601210', SYSDATE, SYSDATE, 'S');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user24', 'bB223$', '이용복', '필깅이', 'felixlee@naver.com', '01056781111', 'N', '20040201', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user25', 'bB323!', '황현진', '황자님', 'prince25@naver.com', '01067891111', 'M', '20040401', SYSDATE, SYSDATE, 'N');

------------- RESTAURANT  업체 -------------
INSERT INTO RESTAURANT VALUES -- 첫로그인 테스트용 업체 / 아이디 : 1200
(SEQ_RESNO.NEXTVAL,'1234', '미미식당', '김미미',  '899-52-52007', '서울시 금천구 가산동', '대륭3차 11층', '서울특별시', '금천구', '02-555-6666', '010-6666-7777', 'FOODY@EMAIL.COM', 'Y', SYSDATE, SYSDATE, SYSDATE, 'C', '12345123', '12345123', null, '8:00', '21:00', '15:00', '16:00', 'japanese', 0);
INSERT INTO RESTAURANT VALUES -- 일반테스트 업체 / 아이디 1201
(SEQ_RESNO.NEXTVAL,'1234', '루키식당', '하이루',  '777-52-52007', '서울시 금천구 가산동', '대륭3차 11층', '서울특별시', '금천구', '02-555-6666', '010-6666-7777', 'FOODY@EMAIL.COM', 'Y', SYSDATE, SYSDATE, SYSDATE, 'Y', '12345123', '12345123', 'resources/restaurantSample/1_rosebud.jpg', '8:00', '19:00', null , null, 'bar',0);

------------- QUESTION 문의답변 -------------
INSERT INTO QUESTION VALUES
(SEQ_QNO.NEXTVAL, '이용문의', '알러지가 있습니다', '오이알러지가 있어요. 오이가 들어간 메뉴를 알려주세요'
, SYSDATE, NULL, NULL, NULL, NULL, 'N', '1', 'U', 1201, 'R');
INSERT INTO QUESTION VALUES
(SEQ_QNO.NEXTVAL, '이용문의', '애견동반 가능한가요?', '애견동반이라는 얘기가 있어서 문의드려요'
, SYSDATE, NULL, NULL, NULL, NULL, 'N', '2', 'U', 1201, 'R');
INSERT INTO QUESTION VALUES
(SEQ_QNO.NEXTVAL, '예약문의', '지난 예약때 물건을 놓고 온것 같아요.', '빨간색 카드지갑인데 혹시 분실물 있나요?'
, SYSDATE, SYSDATE, NULL, '네. 보관중입니다. 찾으러 오세요.^^', SYSDATE, 'Y', '3', 'U', 1201, 'R');

-- 관리자
INSERT INTO QUESTION VALUES
(SEQ_QNO.NEXTVAL, 'MP', '적립금이요...', '더 주실 수 없나요?'
, SYSDATE, SYSDATE, NULL, '아니요.^^', SYSDATE, 'Y', '3', 'U', 1201, 'A');
INSERT INTO QUESTION VALUES
(SEQ_QNO.NEXTVAL, 'MU', '', '빨간색 카드지갑인데 혹시 분실물 있나요?'
, SYSDATE, SYSDATE, NULL, '네. 보관중입니다. 찾으러 오세요.^^', SYSDATE, 'Y', '3', 'U', 1201, 'A');
INSERT INTO QUESTION VALUES
(SEQ_QNO.NEXTVAL, 'MU', '지난 예약때 물건을 놓고 온것 같아요.', '빨간색 카드지갑인데 혹시 분실물 있나요?'
, SYSDATE, SYSDATE, NULL, '네. 보관중입니다. 찾으러 오세요.^^', SYSDATE, 'Y', '3', 'U', 1201, 'A');
INSERT INTO QUESTION VALUES
(SEQ_QNO.NEXTVAL, 'ME', '지난 예약때 물건을 놓고 온것 같아요.', '빨간색 카드지갑인데 혹시 분실물 있나요?'
, SYSDATE, SYSDATE, NULL, '네. 보관중입니다. 찾으러 오세요.^^', SYSDATE, 'Y', '3', 'U', 1201, 'A');
INSERT INTO QUESTION VALUES
(SEQ_QNO.NEXTVAL, 'ME', '지난 예약때 물건을 놓고 온것 같아요.', '빨간색 카드지갑인데 혹시 분실물 있나요?'
, SYSDATE, SYSDATE, NULL, '네. 보관중입니다. 찾으러 오세요.^^', SYSDATE, 'Y', '3', 'U', 1201, 'A');

-- 업체





------------- BOOK 예약 -------------
INSERT INTO BOOK VALUES (SEQ_BKNO.NEXTVAL, 4, 1201, '팜하니', '01055556666'
, '2023/01/21', '18:30', 3, 'hello@gmail.com', NULL, 'D', SYSDATE, SYSDATE);
INSERT INTO BOOK VALUES (SEQ_BKNO.NEXTVAL, 5, 1201, '김미미', '01055556666'
, '2023/02/01', '12:30', 2, 'nice@gmail.com', NULL, 'B', SYSDATE, SYSDATE);
INSERT INTO BOOK VALUES (SEQ_BKNO.NEXTVAL, 6, 1201, '한나', '01055556666'
, '2023/02/12', '17:00', 4, 'true@gmail.com', '주차관련으로 문의남겨놨어요', 'B', SYSDATE, SYSDATE);

-- REVIEW
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

------------- ATTACHMENT 첨부파일 -------------
INSERT INTO ATTACHMENT VALUES (SEQ_ATNO.NEXTVAL, 1201, '사진1.jpg', '2023020309460951785.jpg', 'resources/review_upfiles/', SYSDATE, NULL, 'Y', 'R');
INSERT INTO ATTACHMENT VALUES (SEQ_ATNO.NEXTVAL, 1201, '사진2.jpg', '2023020416174051873.jpg', 'resources/review_upfiles/', SYSDATE, NULL, 'Y', 'R');
INSERT INTO ATTACHMENT VALUES (SEQ_ATNO.NEXTVAL, 1201, '사진3.jpg', '2023020309442613989.jpg', 'resources/review_upfiles/', SYSDATE, NULL, 'Y', 'R');


------------- POINT 적립금 -------------
INSERT INTO POINT VALUES (SEQ_PNO.NEXTVAL, NULL, 3, NULL
,'새해맞이이벤트', 'B', '2000','2000',SYSDATE);
INSERT INTO POINT VALUES (SEQ_PNO.NEXTVAL, NULL, 3, NULL
,'구매10%', 'B', '3000','5000',SYSDATE);

------------- NOTICE 회원/업체 공지사항 -------------
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



-- payment
INSERT INTO PAYMENT VALUES (SEQ_PMNO.NEXTVAL, 1, 1200, 3, 0, 40000, '신용카드', DEFAULT, 'Y');
INSERT INTO PAYMENT VALUES (SEQ_PMNO.NEXTVAL, 2, 1200, 3, 2000, 40000, '신용카드', DEFAULT, 'Y');

--첫로그인 상태로 바꾸기
UPDATE RESTAURANT SET STATUS='C' WHERE RES_NO=1201;
--미답변상태로만들기
UPDATE QUESTION SET STATUS='N' WHERE Q_NO=1;
--삭제
DELETE FROM QUESTION WHERE Q_NO=10;
            
COMMIT;















