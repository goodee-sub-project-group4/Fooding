-- TB_USER
--관리자
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'fooding01', '1111', '푸딩01', '', '', '', '', '', '', '', 'A');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'fooding02', '2222', '푸딩02', '', '', '', '', '', '', '', 'A');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'fooding03', '3333', '푸딩03', '', '', '', '', '', '', '', 'A');
--유저
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user01', '1111', '팜하니', '농장주인', 'farmer@naver.com', '01000001111', 'F', '20040101', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user02', '2222', '강해린', '아기고양이', 'kitty@naver.com', '01000002222', 'F', '20040102', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user03', '3333', '김민지', '핫세', 'minji33@naver.com', '01000003333', 'F', '20040103', SYSDATE, SYSDATE, 'Y');


------------- RESTAURANT  업체 -------------
INSERT INTO RESTAURANT VALUES --일반업체 / 아이디 : 1200
(SEQ_RESNO.NEXTVAL,'1234', '미미식당', '김미미',  '899-52-52007', '서울시 금천구 가산동', '대륭3차 11층', ' 서울', '금천구', '02-555-6666', '010-6666-7777', 'FOODY@EMAIL.COM', 'Y', SYSDATE, SYSDATE, SYSDATE, 'Y', '12345123', '12345123', null, '8:00', '21:00', '15:00', '16:00', 'japanese', 0);
INSERT INTO RESTAURANT VALUES --첫로그인 테스트용 업체 / 아이디 1201
(SEQ_RESNO.NEXTVAL,'1234', '루키식당', '하이루',  '777-52-52007', '서울시 금천구 가산동', '대륭3차 11층', ' 서울', '금천구', '02-555-6666', '010-6666-7777', 'FOODY@EMAIL.COM', 'Y', SYSDATE, SYSDATE, SYSDATE, 'C', '12345123', '12345123', null, '8:00', '19:00', null , null, 'bar',0);

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

-- REVIEW
INSERT INTO REVIEW VALUES (SEQ_RVNO.NEXTVAL, SEQ_RESNO.CURRVAL, 1, 2, '너무 맛있어요 분위기도 넘 좋아요~!', 4.5, SYSDATE, SYSDATE, 'Y', 'N', DEFAULT);
INSERT INTO REVIEW VALUES (SEQ_RVNO.NEXTVAL, SEQ_RESNO.CURRVAL, 2, 1, '기분이 나쁘네요...', 2.5, SYSDATE, SYSDATE, 'Y', 'N', DEFAULT);
INSERT INTO REVIEW VALUES (SEQ_RVNO.NEXTVAL, SEQ_RESNO.CURRVAL, 3, 2, '넘 맛잇어요ㅋㅋ 담에 또 올게요', 5.0, SYSDATE, SYSDATE, 'Y', 'N', DEFAULT);
INSERT INTO REVIEW VALUES (SEQ_RVNO.NEXTVAL, SEQ_RESNO.CURRVAL, 2, 1, '메롱~!', 4.5, SYSDATE, SYSDATE, 'Y', 'N', DEFAULT);
INSERT INTO REVIEW VALUES (SEQ_RVNO.NEXTVAL, SEQ_RESNO.CURRVAL, 3, 2, '여기 다시 올거같아요', 4.0, SYSDATE, SYSDATE, 'Y', 'N', DEFAULT);

------------- ATTACHMENT 첨부파일 -------------
INSERT INTO ATTACHMENT VALUES (SEQ_ATNO.NEXTVAL, 1, '사진1.jpg', '2023020309460951785', 'resources/review_upfiles/', SYSDATE, NULL, 'Y', 'R');
INSERT INTO ATTACHMENT VALUES (SEQ_ATNO.NEXTVAL, 1, '사진2.jpg', '2023020301010996124', 'resources/review_upfiles/', SYSDATE, NULL, 'Y', 'R');
INSERT INTO ATTACHMENT VALUES (SEQ_ATNO.NEXTVAL, 1, '사진3.jpg', '2023020309442613989', 'resources/review_upfiles/', SYSDATE, NULL, 'Y', 'R');

------------- POINT 적립금 -------------
INSERT INTO POINT VALUES (SEQ_PNO.NEXTVAL, NULL, 2, NULL
,'새해맞이이벤트', 'B', '2000','2000',SYSDATE);
INSERT INTO POINT VALUES (SEQ_PNO.NEXTVAL, NULL, 2, NULL
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



--첫로그인 상태로 바꾸기
UPDATE RESTAURANT SET STATUS='C' WHERE RES_NO=1201;
--미답변상태로만들기
UPDATE QUESTION SET STATUS='N' WHERE Q_NO=1;
--삭제
DELETE FROM QUESTION WHERE Q_NO=10;
            
COMMIT;















