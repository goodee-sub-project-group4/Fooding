-----------------삭제------------------

--해당 계정의 모든테이블 및 제약조건 삭제
BEGIN
    FOR C IN (SELECT * FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE "'||C.TABLE_NAME||'" CASCADE CONSTRAINTS');
    END LOOP;
END;
/

-- 해당 계정의 모든 트리거 삭제
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/

--해당 계정의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--해당 계정의 모든 뷰 삭제
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/

--------------------------------------------------------
--  파일이 생성됨 - 수요일-2월-08-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence SEQ_ATNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ATNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 140 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_BKNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_BKNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 240 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_BLNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_BLNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 100 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_BMNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_BMNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 140 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_FAQNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_FAQNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 160 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_MNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_MNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 140 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_MTNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_MTNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 100 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_NANO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_NANO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_NONO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_NONO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 160 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PMNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_PMNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 140 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_PNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_PNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 160 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_QNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_QNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 140 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_RESNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_RESNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1270 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_RVNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_RVNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 140 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_SNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_SNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 100 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_UNO
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_UNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 160 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ATTACHMENT
--------------------------------------------------------

  CREATE TABLE "ATTACHMENT" 
   (	"FILE_NO" NUMBER, 
	"RES_NO" NUMBER, 
	"REF_BNO" NUMBER, 
	"ORIGIN_NAME" VARCHAR2(50 BYTE), 
	"CHANGE_NAME" VARCHAR2(50 BYTE), 
	"FILE_PATH" VARCHAR2(50 BYTE), 
	"UPLOAD_DATE" DATE DEFAULT SYSDATE, 
	"FILE_LEVEL" NUMBER, 
	"STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y', 
	"BOARD_TYPE" VARCHAR2(1 BYTE)
   ) ;

   COMMENT ON COLUMN "ATTACHMENT"."FILE_NO" IS '파일번호 SEQ_ATNO';
   COMMENT ON COLUMN "ATTACHMENT"."RES_NO" IS '업체 번호';
   COMMENT ON COLUMN "ATTACHMENT"."REF_BNO" IS '게시글번호';
   COMMENT ON COLUMN "ATTACHMENT"."ORIGIN_NAME" IS '원본파일명';
   COMMENT ON COLUMN "ATTACHMENT"."CHANGE_NAME" IS '저장파일명';
   COMMENT ON COLUMN "ATTACHMENT"."FILE_PATH" IS '파일경로';
   COMMENT ON COLUMN "ATTACHMENT"."UPLOAD_DATE" IS '업로드시점';
   COMMENT ON COLUMN "ATTACHMENT"."FILE_LEVEL" IS '순번';
   COMMENT ON COLUMN "ATTACHMENT"."STATUS" IS '상태';
   COMMENT ON COLUMN "ATTACHMENT"."BOARD_TYPE" IS '(공지사항 N / 리뷰 R / 1:1문의 Q / 메인배너 B)';
--------------------------------------------------------
--  DDL for Table BLACK
--------------------------------------------------------

  CREATE TABLE "BLACK" 
   (	"BLACK_NO" NUMBER, 
	"B_PERSON" NUMBER, 
	"T_PERSON" NUMBER, 
	"BLACK_TITEL" VARCHAR2(100 BYTE), 
	"BLACK_CONTENT" VARCHAR2(4000 BYTE), 
	"BLACK_TYPE" VARCHAR2(2 BYTE)
   ) ;

   COMMENT ON COLUMN "BLACK"."BLACK_NO" IS '신고번호 SEQ_BLNO';
   COMMENT ON COLUMN "BLACK"."B_PERSON" IS '신고자';
   COMMENT ON COLUMN "BLACK"."T_PERSON" IS '신고대상';
   COMMENT ON COLUMN "BLACK"."BLACK_TITEL" IS '신고제목';
   COMMENT ON COLUMN "BLACK"."BLACK_CONTENT" IS '신고내용';
   COMMENT ON COLUMN "BLACK"."BLACK_TYPE" IS '(리뷰 RV / 업체 RR)';
--------------------------------------------------------
--  DDL for Table BOOK
--------------------------------------------------------

  CREATE TABLE "BOOK" 
   (	"BOOK_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"RES_NO" NUMBER, 
	"BOOK_NAME" VARCHAR2(20 BYTE), 
	"BOOK_PHONE" VARCHAR2(20 BYTE), 
	"BOOK_DATE" VARCHAR2(20 BYTE), 
	"BOOK_TIME" VARCHAR2(10 BYTE), 
	"PEOPLE" NUMBER, 
	"EMAIL" VARCHAR2(50 BYTE), 
	"REQUEST" VARCHAR2(1000 BYTE), 
	"STATUS" VARCHAR2(1 BYTE) DEFAULT 'B', 
	"MODIFY_DATE" DATE DEFAULT SYSDATE, 
	"BOOK_A" DATE DEFAULT SYSDATE
   ) ;

   COMMENT ON COLUMN "BOOK"."BOOK_NO" IS '예약번호 SEQ_BKNO';
   COMMENT ON COLUMN "BOOK"."USER_NO" IS '회원번호';
   COMMENT ON COLUMN "BOOK"."RES_NO" IS '업체번호';
   COMMENT ON COLUMN "BOOK"."BOOK_NAME" IS '예약자';
   COMMENT ON COLUMN "BOOK"."BOOK_PHONE" IS '예약자 연락처';
   COMMENT ON COLUMN "BOOK"."BOOK_DATE" IS '예약날짜';
   COMMENT ON COLUMN "BOOK"."BOOK_TIME" IS '예약시간';
   COMMENT ON COLUMN "BOOK"."PEOPLE" IS '예약인원';
   COMMENT ON COLUMN "BOOK"."EMAIL" IS '이메일';
   COMMENT ON COLUMN "BOOK"."REQUEST" IS '요청사항';
   COMMENT ON COLUMN "BOOK"."STATUS" IS '(B예약완료/ C예약취소/ D 이용완료)';
   COMMENT ON COLUMN "BOOK"."MODIFY_DATE" IS '예약상태 변경시간';
   COMMENT ON COLUMN "BOOK"."BOOK_A" IS '예약 신청일';
--------------------------------------------------------
--  DDL for Table BOOK_MENU
--------------------------------------------------------

  CREATE TABLE "BOOK_MENU" 
   (	"BM_NO" NUMBER, 
	"BOOK_NO" NUMBER, 
	"MENU_NO" NUMBER, 
	"MENU_COUNT" NUMBER, 
	"BM_PRICE" NUMBER
   ) ;

   COMMENT ON COLUMN "BOOK_MENU"."BM_NO" IS '주문번호 SEQ_BMNO';
   COMMENT ON COLUMN "BOOK_MENU"."BOOK_NO" IS '예약번호';
   COMMENT ON COLUMN "BOOK_MENU"."MENU_NO" IS '메뉴번호';
   COMMENT ON COLUMN "BOOK_MENU"."MENU_COUNT" IS '수량';
   COMMENT ON COLUMN "BOOK_MENU"."BM_PRICE" IS '주문금액';
--------------------------------------------------------
--  DDL for Table FAQ
--------------------------------------------------------

  CREATE TABLE "FAQ" 
   (	"FAQ_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"CATEGORY" VARCHAR2(30 BYTE), 
	"FAQ_TITLE" VARCHAR2(100 BYTE), 
	"FAQ_CONTENT" VARCHAR2(4000 BYTE), 
	"CREATE_DATE" DATE DEFAULT SYSDATE, 
	"MODIFY_DATE" DATE DEFAULT SYSDATE, 
	"COUNT" NUMBER DEFAULT 0, 
	"WHO" VARCHAR2(1 BYTE), 
	"STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y'
   ) ;

   COMMENT ON COLUMN "FAQ"."FAQ_NO" IS 'FAQ번호(PK) SEQ_FAQNO';
   COMMENT ON COLUMN "FAQ"."USER_NO" IS '작성자 회원번호(FK)';
   COMMENT ON COLUMN "FAQ"."CATEGORY" IS '카테고리명';
   COMMENT ON COLUMN "FAQ"."COUNT" IS '조회수';
   COMMENT ON COLUMN "FAQ"."WHO" IS '구분(U회원/R업체)';
   COMMENT ON COLUMN "FAQ"."STATUS" IS '(보이기 Y / 안보이기 N))';
--------------------------------------------------------
--  DDL for Table GOOD
--------------------------------------------------------

  CREATE TABLE "GOOD" 
   (	"RES_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"GOOD_DATE" DATE
   ) ;

   COMMENT ON COLUMN "GOOD"."RES_NO" IS '업체번호';
   COMMENT ON COLUMN "GOOD"."USER_NO" IS '회원번호(PK)';
--------------------------------------------------------
--  DDL for Table MENU
--------------------------------------------------------

  CREATE TABLE "MENU" 
   (	"MENU_NO" NUMBER, 
	"RES_NO" NUMBER, 
	"MENU_NAME" VARCHAR2(50 BYTE), 
	"PRICE" NUMBER, 
	"MENU_DES" VARCHAR2(2000 BYTE), 
	"M_IMG" VARCHAR2(100 BYTE)
   ) ;

   COMMENT ON COLUMN "MENU"."MENU_NO" IS '메뉴번호 SEQ_MNO';
   COMMENT ON COLUMN "MENU"."RES_NO" IS '업체번호';
   COMMENT ON COLUMN "MENU"."MENU_NAME" IS '메뉴명';
   COMMENT ON COLUMN "MENU"."PRICE" IS '금액';
   COMMENT ON COLUMN "MENU"."MENU_DES" IS '메뉴설명';
   COMMENT ON COLUMN "MENU"."M_IMG" IS '이미지경로';
--------------------------------------------------------
--  DDL for Table MONTHLY
--------------------------------------------------------

  CREATE TABLE "MONTHLY" 
   (	"MON_NO" NUMBER, 
	"RES_NO" NUMBER, 
	"MONTHLY" NUMBER, 
	"TOTAL" NUMBER, 
	"STATUS" VARCHAR2(1 BYTE) DEFAULT 'N'
   ) ;

   COMMENT ON COLUMN "MONTHLY"."MON_NO" IS '정산번호 SEQ_MTNO';
   COMMENT ON COLUMN "MONTHLY"."RES_NO" IS '업체번호';
   COMMENT ON COLUMN "MONTHLY"."MONTHLY" IS '정산연월';
   COMMENT ON COLUMN "MONTHLY"."TOTAL" IS '정산금';
   COMMENT ON COLUMN "MONTHLY"."STATUS" IS '(완료 Y / 미완료 N)';
--------------------------------------------------------
--  DDL for Table NOTICE
--------------------------------------------------------

  CREATE TABLE "NOTICE" 
   (	"NOTICE_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"NOTICE_TITLE" VARCHAR2(100 BYTE), 
	"NOTICE_CONTENT" VARCHAR2(4000 BYTE), 
	"CREATE_DATE" DATE DEFAULT SYSDATE, 
	"MODIFY_DATE" DATE DEFAULT SYSDATE, 
	"COUNT" NUMBER DEFAULT 0, 
	"TO_WHOM" VARCHAR2(1 BYTE), 
	"STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y'
   ) ;

   COMMENT ON COLUMN "NOTICE"."NOTICE_NO" IS '공지사항번호(PK) SEQ_NONO';
   COMMENT ON COLUMN "NOTICE"."USER_NO" IS '작성자 회원번호(FK)';
   COMMENT ON COLUMN "NOTICE"."TO_WHOM" IS '구분(U회원/R업체)';
   COMMENT ON COLUMN "NOTICE"."STATUS" IS '(보이기 Y / 안보이기 N))';
--------------------------------------------------------
--  DDL for Table NOT_ABLE
--------------------------------------------------------

  CREATE TABLE "NOT_ABLE" 
   (	"NOT_NO" NUMBER, 
	"RES_NO" NUMBER, 
	"NOT_YEAR" VARCHAR2(20 BYTE), 
	"NOT_MONTH" VARCHAR2(20 BYTE), 
	"NOT_DATE" VARCHAR2(20 BYTE)
   ) ;

   COMMENT ON COLUMN "NOT_ABLE"."NOT_NO" IS '스케줄번호 SEQ_NANO';
   COMMENT ON COLUMN "NOT_ABLE"."RES_NO" IS '업체번호';
   COMMENT ON COLUMN "NOT_ABLE"."NOT_DATE" IS '날짜';
--------------------------------------------------------
--  DDL for Table PAYMENT
--------------------------------------------------------

  CREATE TABLE "PAYMENT" 
   (	"PAY_NO" NUMBER, 
	"BOOK_NO" NUMBER, 
	"RES_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"PAY_POINT" NUMBER, 
	"PAY_TOTAL" NUMBER, 
	"PAY_OP" VARCHAR2(20 BYTE), 
	"PAY_DATE" DATE DEFAULT SYSDATE, 
	"STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y'
   ) ;

   COMMENT ON COLUMN "PAYMENT"."PAY_NO" IS '결제번호 SEQ_PMNO';
   COMMENT ON COLUMN "PAYMENT"."BOOK_NO" IS '예약번호';
   COMMENT ON COLUMN "PAYMENT"."RES_NO" IS '업체번호';
   COMMENT ON COLUMN "PAYMENT"."USER_NO" IS '회원번호';
   COMMENT ON COLUMN "PAYMENT"."PAY_POINT" IS '적립금 사용';
   COMMENT ON COLUMN "PAYMENT"."PAY_TOTAL" IS '총 결제금액';
   COMMENT ON COLUMN "PAYMENT"."PAY_OP" IS '결제방법';
   COMMENT ON COLUMN "PAYMENT"."PAY_DATE" IS '결제/환불 시간';
   COMMENT ON COLUMN "PAYMENT"."STATUS" IS 'Y결제/C취소';
--------------------------------------------------------
--  DDL for Table POINT
--------------------------------------------------------

  CREATE TABLE "POINT" 
   (	"POINT_NO" NUMBER, 
	"PAY_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"RES_NO" NUMBER, 
	"POINT_NAME" VARCHAR2(100 BYTE), 
	"STATUS" VARCHAR2(1 BYTE) DEFAULT 'B', 
	"POINT_TRADE" NUMBER, 
	"POINT_NOW" NUMBER DEFAULT 0, 
	"POINT_DATE" DATE DEFAULT SYSDATE
   ) ;

   COMMENT ON COLUMN "POINT"."POINT_NO" IS '적립금 번호 SEQ_PNO';
   COMMENT ON COLUMN "POINT"."PAY_NO" IS '결제번호';
   COMMENT ON COLUMN "POINT"."USER_NO" IS '회원번호';
   COMMENT ON COLUMN "POINT"."RES_NO" IS '업체번호';
   COMMENT ON COLUMN "POINT"."POINT_NAME" IS '적립내용';
   COMMENT ON COLUMN "POINT"."STATUS" IS '(B적립/C취소/U사용)';
   COMMENT ON COLUMN "POINT"."POINT_TRADE" IS '적립/취소/사용 금액';
   COMMENT ON COLUMN "POINT"."POINT_NOW" IS '현재적립금';
   COMMENT ON COLUMN "POINT"."POINT_DATE" IS '발생날짜';
--------------------------------------------------------
--  DDL for Table QUESTION
--------------------------------------------------------

  CREATE TABLE "QUESTION" 
   (	"Q_NO" NUMBER, 
	"CATEGORY" VARCHAR2(30 BYTE), 
	"Q_TITLE" VARCHAR2(100 BYTE), 
	"Q_CONTENT" VARCHAR2(4000 BYTE), 
	"CREATE_DATE" DATE DEFAULT SYSDATE, 
	"MODIFY_DATE" DATE DEFAULT SYSDATE, 
	"DELETE_DATE" DATE DEFAULT SYSDATE, 
	"A_CONTENT" VARCHAR2(4000 BYTE), 
	"A_DATE" DATE DEFAULT SYSDATE, 
	"STATUS" VARCHAR2(1 BYTE) DEFAULT 'N', 
	"Q_PERSON" VARCHAR2(20 BYTE), 
	"Q_WHO" VARCHAR2(1 BYTE), 
	"A_PERSON" VARCHAR2(20 BYTE), 
	"A_WHO" VARCHAR2(1 BYTE)
   ) ;

   COMMENT ON COLUMN "QUESTION"."Q_NO" IS '문의번호(PK) SEQ_QNO';
   COMMENT ON COLUMN "QUESTION"."CATEGORY" IS '카테고리명';
   COMMENT ON COLUMN "QUESTION"."STATUS" IS '처리상태(Y/N)';
   COMMENT ON COLUMN "QUESTION"."Q_WHO" IS '(회원 U / 업체 R)';
   COMMENT ON COLUMN "QUESTION"."A_WHO" IS '(업체 R /관리자 A)';
--------------------------------------------------------
--  DDL for Table RESTAURANT
--------------------------------------------------------

  CREATE TABLE "RESTAURANT" 
   (	"RES_NO" NUMBER, 
	"USER_PWD" VARCHAR2(30 BYTE), 
	"RES_NAME" VARCHAR2(50 BYTE), 
	"CEO" VARCHAR2(20 BYTE), 
	"PERMIT_NO" VARCHAR2(12 BYTE), 
	"ADDRESS" VARCHAR2(200 BYTE), 
	"D_ADDRESS" VARCHAR2(200 BYTE), 
	"LOCAL_CT" VARCHAR2(20 BYTE), 
	"DLOCAL_CT" VARCHAR2(50 BYTE), 
	"PHONE" VARCHAR2(20 BYTE), 
	"CELLPHONE" VARCHAR2(13 BYTE), 
	"EMAIL" VARCHAR2(50 BYTE), 
	"PARKING" VARCHAR2(1 BYTE) DEFAULT 'Y', 
	"APPLY_DATE" DATE, 
	"ENROLL_DATE" DATE, 
	"MODIFY_DATE" DATE, 
	"STATUS" VARCHAR2(1 BYTE) DEFAULT 'W', 
	"LONGTITUDE" VARCHAR2(20 BYTE), 
	"LATITUDE" VARCHAR2(20 BYTE), 
	"R_IMG" VARCHAR2(1000 BYTE), 
	"OPEN" VARCHAR2(10 BYTE), 
	"CLOSE" VARCHAR2(10 BYTE), 
	"BREAK_S" VARCHAR2(10 BYTE), 
	"BREAK_E" VARCHAR2(10 BYTE), 
	"FOOD_CT" VARCHAR2(20 BYTE), 
	"COUNT" NUMBER DEFAULT 0
   ) ;

   COMMENT ON COLUMN "RESTAURANT"."RES_NO" IS '업체번호 SEQ_RESNO';
   COMMENT ON COLUMN "RESTAURANT"."USER_PWD" IS '업체비밀번호';
   COMMENT ON COLUMN "RESTAURANT"."RES_NAME" IS '상호명';
   COMMENT ON COLUMN "RESTAURANT"."CEO" IS '대표자명';
   COMMENT ON COLUMN "RESTAURANT"."PERMIT_NO" IS '사업자번호';
   COMMENT ON COLUMN "RESTAURANT"."ADDRESS" IS '입력 주소';
   COMMENT ON COLUMN "RESTAURANT"."D_ADDRESS" IS '입력 상세주소';
   COMMENT ON COLUMN "RESTAURANT"."LOCAL_CT" IS '지역 카테고리';
   COMMENT ON COLUMN "RESTAURANT"."DLOCAL_CT" IS '상세지역 카테고리';
   COMMENT ON COLUMN "RESTAURANT"."PHONE" IS '전화번호';
   COMMENT ON COLUMN "RESTAURANT"."CELLPHONE" IS '휴대폰 번호';
   COMMENT ON COLUMN "RESTAURANT"."EMAIL" IS '이메일';
   COMMENT ON COLUMN "RESTAURANT"."PARKING" IS '주차여부';
   COMMENT ON COLUMN "RESTAURANT"."APPLY_DATE" IS '가입신청일';
   COMMENT ON COLUMN "RESTAURANT"."ENROLL_DATE" IS '가입일';
   COMMENT ON COLUMN "RESTAURANT"."MODIFY_DATE" IS '업체 정보 수정일';
   COMMENT ON COLUMN "RESTAURANT"."STATUS" IS '(승인대기 W, 반려 N, 승인 C, 활동업체 Y,  이용정지 S)';
   COMMENT ON COLUMN "RESTAURANT"."LONGTITUDE" IS '경도';
   COMMENT ON COLUMN "RESTAURANT"."LATITUDE" IS '위도';
   COMMENT ON COLUMN "RESTAURANT"."R_IMG" IS '업체사진';
   COMMENT ON COLUMN "RESTAURANT"."OPEN" IS '영업 시작 시간';
   COMMENT ON COLUMN "RESTAURANT"."CLOSE" IS '영업 종료 시간';
   COMMENT ON COLUMN "RESTAURANT"."BREAK_S" IS '브레이크 시작 시작';
   COMMENT ON COLUMN "RESTAURANT"."BREAK_E" IS '브레이크 종료 시간';
   COMMENT ON COLUMN "RESTAURANT"."FOOD_CT" IS '음식 카테고리(업종)';
   COMMENT ON COLUMN "RESTAURANT"."COUNT" IS '조회수';
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

  CREATE TABLE "REVIEW" 
   (	"REVIEW_NO" NUMBER, 
	"RES_NO" NUMBER, 
	"USER_NO" NUMBER, 
	"BOOK_NO" NUMBER, 
	"REVIEW_CONTENT" VARCHAR2(4000 BYTE), 
	"STAR" NUMBER, 
	"CREATE_DATE" DATE DEFAULT SYSDATE, 
	"MODIFY_DATE" DATE DEFAULT SYSDATE, 
	"STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y', 
	"GOOD" VARCHAR2(1 BYTE) DEFAULT 'N', 
	"COUNT" NUMBER DEFAULT 0
   ) ;

   COMMENT ON COLUMN "REVIEW"."REVIEW_NO" IS '리뷰번호(PK) SEQ_RVNO';
   COMMENT ON COLUMN "REVIEW"."RES_NO" IS '업체번호(FK)';
   COMMENT ON COLUMN "REVIEW"."USER_NO" IS '회원번호(FK)';
   COMMENT ON COLUMN "REVIEW"."BOOK_NO" IS '예약번호(FK)';
   COMMENT ON COLUMN "REVIEW"."REVIEW_CONTENT" IS '리뷰내용';
   COMMENT ON COLUMN "REVIEW"."STAR" IS '별점(0.5단위)';
   COMMENT ON COLUMN "REVIEW"."CREATE_DATE" IS '작성일';
   COMMENT ON COLUMN "REVIEW"."MODIFY_DATE" IS '수정일';
   COMMENT ON COLUMN "REVIEW"."STATUS" IS '(보이기 Y / 안보이기 N)';
   COMMENT ON COLUMN "REVIEW"."GOOD" IS '업체좋아요';
   COMMENT ON COLUMN "REVIEW"."COUNT" IS '조회수';
--------------------------------------------------------
--  DDL for Table SITE
--------------------------------------------------------

  CREATE TABLE "SITE" 
   (	"SITE_NO" NUMBER, 
	"SITE_CONTENT" VARCHAR2(4000 BYTE), 
	"WRITE_TYPE" VARCHAR2(1 BYTE)
   ) ;

   COMMENT ON COLUMN "SITE"."SITE_NO" IS '사이트번호 SEQ_SNO';
   COMMENT ON COLUMN "SITE"."WRITE_TYPE" IS '(배너 B / 이용약관 P / 개인정보처리방침 I / 프로모션및이벤트수신 E)';
--------------------------------------------------------
--  DDL for Table TB_USER
--------------------------------------------------------

  CREATE TABLE "TB_USER" 
   (	"USER_NO" NUMBER, 
	"USER_ID" VARCHAR2(20 BYTE), 
	"USER_PWD" VARCHAR2(20 BYTE), 
	"USER_NAME" VARCHAR2(20 BYTE), 
	"NICKNAME" VARCHAR2(20 BYTE), 
	"USER_EMAIL" VARCHAR2(50 BYTE), 
	"USER_PHONE" VARCHAR2(20 BYTE), 
	"GENDER" VARCHAR2(1 BYTE) DEFAULT 'N', 
	"BIRTH" VARCHAR2(40 BYTE), 
	"ENROLL_DATE" DATE DEFAULT SYSDATE, 
	"MODIFY_DATE" DATE DEFAULT SYSDATE, 
	"STATUS" VARCHAR2(1 BYTE) DEFAULT 'Y'
   ) ;

   COMMENT ON COLUMN "TB_USER"."USER_NO" IS '회원번호(PK) SEQ_UNO';
   COMMENT ON COLUMN "TB_USER"."USER_ID" IS '아이디(UNIQUE)';
   COMMENT ON COLUMN "TB_USER"."USER_PWD" IS '비밀번호';
   COMMENT ON COLUMN "TB_USER"."USER_NAME" IS '이름';
   COMMENT ON COLUMN "TB_USER"."NICKNAME" IS '닉네임';
   COMMENT ON COLUMN "TB_USER"."USER_EMAIL" IS '이메일';
   COMMENT ON COLUMN "TB_USER"."USER_PHONE" IS '전화번호';
   COMMENT ON COLUMN "TB_USER"."GENDER" IS '성별';
   COMMENT ON COLUMN "TB_USER"."BIRTH" IS '생년월일';
   COMMENT ON COLUMN "TB_USER"."ENROLL_DATE" IS '가입일';
   COMMENT ON COLUMN "TB_USER"."MODIFY_DATE" IS '회원정보수정일';
   COMMENT ON COLUMN "TB_USER"."STATUS" IS '(정상 Y / 탈퇴 N / 이용정지 S / 관리자 A)';
REM INSERTING into ATTACHMENT
SET DEFINE OFF;
Insert into ATTACHMENT (FILE_NO,RES_NO,REF_BNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS,BOARD_TYPE) values (100,null,101,'2023020211313354412.jpg','2023020718163070724.jpg','resources/review_upfiles/',to_date('23/02/07','RR/MM/DD'),null,'Y','R');
Insert into ATTACHMENT (FILE_NO,RES_NO,REF_BNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS,BOARD_TYPE) values (101,null,104,'red_heart.png','2023020720363830055.png','resources/sc_files',to_date('23/02/07','RR/MM/DD'),null,'Y','Q');
Insert into ATTACHMENT (FILE_NO,RES_NO,REF_BNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS,BOARD_TYPE) values (120,1201,123,'사진1.jpg','2023020309460951785.jpg','resources/review_upfiles/',to_date('23/02/08','RR/MM/DD'),null,'Y','R');
Insert into ATTACHMENT (FILE_NO,RES_NO,REF_BNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS,BOARD_TYPE) values (121,1201,123,'사진2.jpg','2023020416174051873.jpg','resources/review_upfiles/',to_date('23/02/08','RR/MM/DD'),null,'Y','R');
Insert into ATTACHMENT (FILE_NO,RES_NO,REF_BNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS,BOARD_TYPE) values (122,1201,123,'사진3.jpg','2023020309442613989.jpg','resources/review_upfiles/',to_date('23/02/08','RR/MM/DD'),null,'Y','R');
Insert into ATTACHMENT (FILE_NO,RES_NO,REF_BNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS,BOARD_TYPE) values (123,null,124,'우삼겹숙주볶음.jpg','2023020810324036220.jpg','resources/review_upfiles/',to_date('23/02/08','RR/MM/DD'),null,'Y','R');
Insert into ATTACHMENT (FILE_NO,RES_NO,REF_BNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS,BOARD_TYPE) values (124,null,124,'사과주스.jpg','2023020810324028895.jpg','resources/review_upfiles/',to_date('23/02/08','RR/MM/DD'),null,'Y','R');
Insert into ATTACHMENT (FILE_NO,RES_NO,REF_BNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS,BOARD_TYPE) values (125,null,null,'배너용 (1).png','2023020811065361479.png','resources/mainBanner_upfiles/',to_date('23/02/08','RR/MM/DD'),null,'Y','B');
Insert into ATTACHMENT (FILE_NO,RES_NO,REF_BNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS,BOARD_TYPE) values (126,null,null,'배너용 (2).png','2023020811065361279.png','resources/mainBanner_upfiles/',to_date('23/02/08','RR/MM/DD'),null,'Y','B');
Insert into ATTACHMENT (FILE_NO,RES_NO,REF_BNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS,BOARD_TYPE) values (127,null,null,'배너용 (3).png','2023020811065391170.png','resources/mainBanner_upfiles/',to_date('23/02/08','RR/MM/DD'),null,'Y','B');
Insert into ATTACHMENT (FILE_NO,RES_NO,REF_BNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS,BOARD_TYPE) values (128,null,128,'또보겠지1.jpg','2023020811101645318.jpg','resources/review_upfiles/',to_date('23/02/08','RR/MM/DD'),null,'Y','R');
Insert into ATTACHMENT (FILE_NO,RES_NO,REF_BNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS,BOARD_TYPE) values (129,null,128,'또보겠지2.jpg','2023020811101617843.jpg','resources/review_upfiles/',to_date('23/02/08','RR/MM/DD'),null,'Y','R');
Insert into ATTACHMENT (FILE_NO,RES_NO,REF_BNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS,BOARD_TYPE) values (130,null,128,'또보겠지3.jpg','2023020811101639480.jpg','resources/review_upfiles/',to_date('23/02/08','RR/MM/DD'),null,'Y','R');
Insert into ATTACHMENT (FILE_NO,RES_NO,REF_BNO,ORIGIN_NAME,CHANGE_NAME,FILE_PATH,UPLOAD_DATE,FILE_LEVEL,STATUS,BOARD_TYPE) values (131,null,137,'떢볶이.jpg','2023020811341918725.jpg','resources/notice_upfiles/',to_date('23/02/08','RR/MM/DD'),null,'Y','N');
REM INSERTING into BLACK
SET DEFINE OFF;
Insert into BLACK (BLACK_NO,B_PERSON,T_PERSON,BLACK_TITEL,BLACK_CONTENT,BLACK_TYPE) values (132,1201,30,'업체 리뷰 신고','이용하지 않은 고객입니다','RV');
REM INSERTING into BOOK
SET DEFINE OFF;
Insert into BOOK (BOOK_NO,USER_NO,RES_NO,BOOK_NAME,BOOK_PHONE,BOOK_DATE,BOOK_TIME,PEOPLE,EMAIL,REQUEST,STATUS,MODIFY_DATE,BOOK_A) values (25,1,1201,'팜하니','01055556666','2023/02/01','18:30',3,'hello@gmail.com',null,'D',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'));
Insert into BOOK (BOOK_NO,USER_NO,RES_NO,BOOK_NAME,BOOK_PHONE,BOOK_DATE,BOOK_TIME,PEOPLE,EMAIL,REQUEST,STATUS,MODIFY_DATE,BOOK_A) values (30,2,1201,'김미미','01055556666','2023/02/19','12:30',2,'nice@gmail.com',null,'C',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'));
Insert into BOOK (BOOK_NO,USER_NO,RES_NO,BOOK_NAME,BOOK_PHONE,BOOK_DATE,BOOK_TIME,PEOPLE,EMAIL,REQUEST,STATUS,MODIFY_DATE,BOOK_A) values (38,3,1201,'한나','01055556666','2023/02/12','17:00',4,'true@gmail.com','주차관련으로 문의남겨놨어요','D',to_date('23/02/08','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'));
Insert into BOOK (BOOK_NO,USER_NO,RES_NO,BOOK_NAME,BOOK_PHONE,BOOK_DATE,BOOK_TIME,PEOPLE,EMAIL,REQUEST,STATUS,MODIFY_DATE,BOOK_A) values (12,1,1201,'김예은','01012345678','2023/01/01','18:00',3,'hello@gmail.com',null,'D',to_date('23/01/02','RR/MM/DD'),to_date('22/12/23','RR/MM/DD'));
Insert into BOOK (BOOK_NO,USER_NO,RES_NO,BOOK_NAME,BOOK_PHONE,BOOK_DATE,BOOK_TIME,PEOPLE,EMAIL,REQUEST,STATUS,MODIFY_DATE,BOOK_A) values (18,2,1201,'채치수','01012345678','2023/01/01','12:00',3,'hello@gmail.com',null,'D',to_date('23/01/15','RR/MM/DD'),to_date('22/12/30','RR/MM/DD'));
Insert into BOOK (BOOK_NO,USER_NO,RES_NO,BOOK_NAME,BOOK_PHONE,BOOK_DATE,BOOK_TIME,PEOPLE,EMAIL,REQUEST,STATUS,MODIFY_DATE,BOOK_A) values (19,3,1201,'강백호','01012345678','2023/01/18','19:30',4,'hello@gmail.com',null,'D',to_date('23/01/09','RR/MM/DD'),to_date('23/01/01','RR/MM/DD'));
Insert into BOOK (BOOK_NO,USER_NO,RES_NO,BOOK_NAME,BOOK_PHONE,BOOK_DATE,BOOK_TIME,PEOPLE,EMAIL,REQUEST,STATUS,MODIFY_DATE,BOOK_A) values (21,1,1201,'서태웅','01012345678','2023/01/20','18:30',5,'hello@gmail.com',null,'D',to_date('23/01/22','RR/MM/DD'),to_date('23/01/12','RR/MM/DD'));
Insert into BOOK (BOOK_NO,USER_NO,RES_NO,BOOK_NAME,BOOK_PHONE,BOOK_DATE,BOOK_TIME,PEOPLE,EMAIL,REQUEST,STATUS,MODIFY_DATE,BOOK_A) values (200,100,1201,'김민지','01000001111','2023-02-09','13:00',1,'minji@naver.com','콜라 두 잔에 2000원 맞나요? 두 잔 주시는거 맞죠?','D',to_date('23/02/08','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'));
Insert into BOOK (BOOK_NO,USER_NO,RES_NO,BOOK_NAME,BOOK_PHONE,BOOK_DATE,BOOK_TIME,PEOPLE,EMAIL,REQUEST,STATUS,MODIFY_DATE,BOOK_A) values (220,102,1203,'팜하니','01000001111','2023-02-24','20:30',1,'hanni01@naver.com',null,'D',to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'));
Insert into BOOK (BOOK_NO,USER_NO,RES_NO,BOOK_NAME,BOOK_PHONE,BOOK_DATE,BOOK_TIME,PEOPLE,EMAIL,REQUEST,STATUS,MODIFY_DATE,BOOK_A) values (221,101,1203,'강해린','01000002222','2023-02-07','11:30',1,'kitty@naver.com','싱겁게 해주세요','B',to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'));
Insert into BOOK (BOOK_NO,USER_NO,RES_NO,BOOK_NAME,BOOK_PHONE,BOOK_DATE,BOOK_TIME,PEOPLE,EMAIL,REQUEST,STATUS,MODIFY_DATE,BOOK_A) values (222,101,1203,'강해린','01000002222','2023-02-09','13:30',1,'kitty@naver.com','싱겁게 해주세요','B',to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'));
Insert into BOOK (BOOK_NO,USER_NO,RES_NO,BOOK_NAME,BOOK_PHONE,BOOK_DATE,BOOK_TIME,PEOPLE,EMAIL,REQUEST,STATUS,MODIFY_DATE,BOOK_A) values (223,100,1204,'김민지','01000001111','2023-02-18','19:00',1,'minji@naver.com','1인분 보다 많이 주세요','B',to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'));
Insert into BOOK (BOOK_NO,USER_NO,RES_NO,BOOK_NAME,BOOK_PHONE,BOOK_DATE,BOOK_TIME,PEOPLE,EMAIL,REQUEST,STATUS,MODIFY_DATE,BOOK_A) values (224,101,1204,'강해린','01000002222','2023-02-07','12:00',1,'kitty@naver.com','치즈 많이 주세요','D',to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'));
Insert into BOOK (BOOK_NO,USER_NO,RES_NO,BOOK_NAME,BOOK_PHONE,BOOK_DATE,BOOK_TIME,PEOPLE,EMAIL,REQUEST,STATUS,MODIFY_DATE,BOOK_A) values (225,102,1201,'팜하니','01000001111','2023-02-17','11:00',3,'hanni01@naver.com','빨리 주세요','C',to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'));
REM INSERTING into BOOK_MENU
SET DEFINE OFF;
Insert into BOOK_MENU (BM_NO,BOOK_NO,MENU_NO,MENU_COUNT,BM_PRICE) values (100,25,2,1,18000);
Insert into BOOK_MENU (BM_NO,BOOK_NO,MENU_NO,MENU_COUNT,BM_PRICE) values (101,25,3,3,6000);
Insert into BOOK_MENU (BM_NO,BOOK_NO,MENU_NO,MENU_COUNT,BM_PRICE) values (102,30,1,1,15000);
Insert into BOOK_MENU (BM_NO,BOOK_NO,MENU_NO,MENU_COUNT,BM_PRICE) values (103,38,1,1,15000);
Insert into BOOK_MENU (BM_NO,BOOK_NO,MENU_NO,MENU_COUNT,BM_PRICE) values (104,38,2,1,18000);
Insert into BOOK_MENU (BM_NO,BOOK_NO,MENU_NO,MENU_COUNT,BM_PRICE) values (105,38,3,2,4000);
REM INSERTING into FAQ
SET DEFINE OFF;
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (100,2,'caM','회원 FAQ 제목','■ 회원 FAQ 내용
',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (101,2,'caM','회원 FAQ 제목','■ 회원 FAQ 내용
',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (102,2,'caM','회원 FAQ 제목','■ 회원 FAQ 내용
',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (103,2,'caM','회원 FAQ 제목','■ 회원 FAQ 내용
',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (104,2,'caM','회원 FAQ 제목','■ 회원 FAQ 내용
',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (105,2,'caP','적립금은 언제 지급되나요?','■ 적립금 지급 시점

-',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (106,2,'caP','적립금은 어떻게 누적하나요?','■ 적립금 누적 방법 안내

-',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (107,2,'caP','적립금은 언제까지 사용할 수 있나요?','■ 적립금 사용 방법

-',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (108,2,'caP','발급 받은 적립금은 어디서 확인할 수 있나요?','■ 적립금 확인 방법

-',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (109,2,'caP','예약 취소 시, 사용한 적립금은 복원 되나요?','■ 적립금 복원 안내

-',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (110,2,'caS','이용 후기는 어떻게 작성하나요?','■ 이용 후기 작성 방법

-',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (111,2,'caS','푸딩은 어떤 회사인가요?','■ About 푸딩

-',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (112,2,'caS','예약 내역은 어떻게 확인하나요?','■ 예약 내역 확인 방법

-',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (113,2,'caM','회원 탈퇴를 하고 싶습니다.','■ 탈퇴 방법 안내

푸딩홈 상단 [마이페이지]>개인정보수정>[회원탈퇴]버튼

- 고객님의 개인정보를 위해 직접 탈퇴만 가능합니다.
- 잔여 적립금은 탈퇴와 함께 소멸되며 별도의 환불처리는 불가합니다.',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (114,2,'caM','회원 탈퇴 후, 재가입이 가능한가요?','■ 회원 재가입 안내

회원 탈퇴 후, 재가입 가능합니다.',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (115,2,'caM','회원 가입시 어떠한 혜택이 있나요?','■ 회원가입 혜택

- 푸딩에서 진행하는 다양한 이벤트를 적용받을 수 있습니다.
- 신규가입 시, 신규회원 대상의 적립금 혜택도 주어집니다.',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (116,2,'caM','회원 정보를 바꾸고 싶습니다.','■ 회원정보 변경 안내

푸딩홈 상단 [마이페이지]>개인정보수정

- 위의 경로를 통해 회원정보를 직접 변경하실 수 있습니다.',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (117,2,'caM','아이디, 비밀번호를 잊어버렸습니다.','■ 아이디, 비밀번호 찾기 안내

[로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]

- 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능합니다.',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (118,2,'caB','전화로 예약 할 수 있나요?','■ 전화(유선상) 예약 불가

- 예약주문은 불가하며, 푸딩은 현재 인터넷으로만 예약이 가능합니다.',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (119,2,'caB','예약하는 방법이 궁금합니다.','■ 가게 예약 방법

[카테고리] 선택 > [검색하기] > 가게 조회 > [예약] > [날짜 선택] > [시간 선택] > [메뉴 선택] > [예약인원] > [예약하기]

- 위의 경로를 통해 가게 예약을 하실 수 있습니다.',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (120,2,'caB','결제 영수증은 어떻게 발급 받나요? 수정','■ 결제 영수증 출력

- 결제하신 주문건의 영수증 출력과 관련하여 직접 조회가 어려우십니다.
  해당 내용은 푸딩 고객센터로 문의 부탁드립니다.',to_date('23/01/01','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),0,'U','N');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (121,1,'caR','업체 FAQ 제목','■ 업체 FAQ 내용
',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (122,1,'caR','업체 FAQ 제목','■ 업체 FAQ 내용
',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (123,1,'caR','업체 FAQ 제목','■ 업체 FAQ 내용
',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (124,1,'caR','업체 FAQ 제목','■ 업체 FAQ 내용
',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (125,1,'caR','업체 FAQ 제목','■ 업체 FAQ 내용
',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (126,2,'caP','적립금은 언제 지급되나요?','■ 적립금 지급 시점

-',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (127,2,'caP','적립금은 어떻게 누적하나요?','■ 적립금 누적 방법 안내

-',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (128,2,'caP','적립금은 언제까지 사용할 수 있나요?','■ 적립금 사용 방법

-',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (129,2,'caP','발급 받은 적립금은 어디서 확인할 수 있나요?','■ 적립금 확인 방법

-',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (130,2,'caP','예약 취소 시, 사용한 적립금은 복원 되나요?','■ 적립금 복원 안내

-',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (131,2,'caS','이용 후기는 어떻게 작성하나요?','■ 이용 후기 작성 방법

-',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (132,2,'caS','푸딩은 어떤 회사인가요?','■ About 푸딩

-',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (133,2,'caS','예약 내역은 어떻게 확인하나요?','■ 예약 내역 확인 방법

-',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (134,2,'caR','업체 탈퇴를 하고 싶습니다.','■ 탈퇴 방법 안내

푸딩홈 상단 [마이페이지]>개인정보수정>[회원탈퇴]버튼

- 고객님의 개인정보를 위해 직접 탈퇴만 가능합니다.
- 잔여 적립금은 탈퇴와 함께 소멸되며 별도의 환불처리는 불가합니다.',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (135,2,'caR','업체 탈퇴 후, 재가입이 가능한가요?','■ 회원 재가입 안내

회원 탈퇴 후, 재가입 가능합니다.',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (136,2,'caR','업체 정보를 바꾸고 싶습니다.','■ 업체정보 변경 안내

- 위의 경로를 통해 회원정보를 직접 변경하실 수 있습니다.',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (137,2,'caR','아이디, 비밀번호를 잊어버렸습니다.','■ 아이디, 비밀번호 찾기 안내

- 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능합니다.',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (138,2,'caB','예약하는 방법이 궁금합니다.','■ 가게 예약 방법

[카테고리] 선택 > [검색하기] > 가게 조회 > [예약] > [날짜 선택] > [시간 선택] > [메뉴 선택] > [예약인원] > [예약하기]

- 위의 경로를 통해 가게 예약을 하실 수 있습니다.',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (139,2,'caB','결제 영수증은 어떻게 발급 하나요?','■ 결제 영수증 출력

- 결제하신 주문건의 영수증 출력과 관련하여 직접 조회가 어려우십니다.
  해당 내용은 푸딩 고객센터로 문의 부탁드립니다.',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into FAQ (FAQ_NO,USER_NO,CATEGORY,FAQ_TITLE,FAQ_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,WHO,STATUS) values (140,1,'caR','업체 FAQ','ddd',to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),0,'R','Y');
REM INSERTING into GOOD
SET DEFINE OFF;
REM INSERTING into MENU
SET DEFINE OFF;
Insert into MENU (MENU_NO,RES_NO,MENU_NAME,PRICE,MENU_DES,M_IMG) values (121,1236,'사과주스',5000,'직접 짜낸 착즙주스입니다','resources/rest_upfiles/2023020809173766286.jpg');
Insert into MENU (MENU_NO,RES_NO,MENU_NAME,PRICE,MENU_DES,M_IMG) values (122,1203,'낙지볶음밥',12000,null,'resources/rest_upfiles/2023020809351773779.jpg');
Insert into MENU (MENU_NO,RES_NO,MENU_NAME,PRICE,MENU_DES,M_IMG) values (123,1203,'곤드레나물밥',9000,null,'resources/rest_upfiles/2023020809351785132.jpg');
Insert into MENU (MENU_NO,RES_NO,MENU_NAME,PRICE,MENU_DES,M_IMG) values (1,1201,'모짜렐라비프라자냐',15000,null,'resources/restaurantSample/모짜렐라비프라자냐.jpg');
Insert into MENU (MENU_NO,RES_NO,MENU_NAME,PRICE,MENU_DES,M_IMG) values (2,1201,'멕시칸비프파히타',18000,null,'resources/restaurantSample/멕시칸비프파히타.jpg');
Insert into MENU (MENU_NO,RES_NO,MENU_NAME,PRICE,MENU_DES,M_IMG) values (120,1236,'고추잡채와꽃빵',25000,'2인분기준입니다','resources/rest_upfiles/2023020809171229493.jpg');
Insert into MENU (MENU_NO,RES_NO,MENU_NAME,PRICE,MENU_DES,M_IMG) values (124,1203,'닭가슴살볶음밥',11000,null,'resources/rest_upfiles/2023020809351762263.jpg');
Insert into MENU (MENU_NO,RES_NO,MENU_NAME,PRICE,MENU_DES,M_IMG) values (125,1204,'치킨버거',14000,'맛있는 치킨','resources/rest_upfiles/2023020809483429857.png');
Insert into MENU (MENU_NO,RES_NO,MENU_NAME,PRICE,MENU_DES,M_IMG) values (126,1204,'치즈버거 세트',15000,'버거랑 감튀 세트','resources/rest_upfiles/2023020809483478059.jpg');
Insert into MENU (MENU_NO,RES_NO,MENU_NAME,PRICE,MENU_DES,M_IMG) values (127,1204,'치즈감자튀김',6000,'맛있는 감쟈','resources/rest_upfiles/2023020809483544555.jpg');
Insert into MENU (MENU_NO,RES_NO,MENU_NAME,PRICE,MENU_DES,M_IMG) values (128,1204,'콜라',3000,'콜라','resources/rest_upfiles/2023020809574792414.jfif');
Insert into MENU (MENU_NO,RES_NO,MENU_NAME,PRICE,MENU_DES,M_IMG) values (130,1200,'메뉴',1000,null,'resources/rest_upfiles/2023020811280362487.jpg');
Insert into MENU (MENU_NO,RES_NO,MENU_NAME,PRICE,MENU_DES,M_IMG) values (131,1200,'메뉴',1000,null,'resources/rest_upfiles/2023020811280377991.jpg');
REM INSERTING into MONTHLY
SET DEFINE OFF;
REM INSERTING into NOTICE
SET DEFINE OFF;
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (100,1,'회원 공지사항','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,1,'U','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (101,1,'회원 공지사항','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (102,1,'회원 공지사항','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (103,1,'회원 공지사항','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (104,1,'회원 공지사항','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,2,'U','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (105,1,'회원 공지사항','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (106,1,'회원 공지사항','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (107,1,'회원 공지사항','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (108,1,'회원 공지사항','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (109,1,'회원 공지사항','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (110,1,'업체 공지사항','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (111,1,'업체 공지사항','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (112,1,'업체 공지사항','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (113,1,'업체 공지사항','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (114,1,'업체 공지사항','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (115,1,'업체 공지사항','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (116,1,'업체 공지사항','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (117,1,'업체 공지사항','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (118,1,'업체 공지사항','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (119,1,'업체 공지사항','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,0,'R','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (120,1,'푸딩 이용약관 개정 안내','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,0,'U','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (121,1,'푸딩 이용약관 개정 안내','안녕하세요. 푸딩입니다. ',to_date('23/01/01','RR/MM/DD'),null,2,'R','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (122,1,'개인정보 처리방침 전면 개정 안내','안녕하세요. 푸딩입니다. ',to_date('23/01/05','RR/MM/DD'),null,1,'U','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (123,1,'개인정보 처리방침 전면 개정 안내','안녕하세요. 푸딩입니다. ',to_date('23/01/05','RR/MM/DD'),null,3,'R','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (124,1,'검색 기능 장애 발생 안내','안녕하세요. 푸딩입니다. ',to_date('23/01/07','RR/MM/DD'),null,0,'U','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (125,1,'검색 기능 장애 발생 안내','안녕하세요. 푸딩입니다. ',to_date('23/01/07','RR/MM/DD'),null,1,'R','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (126,1,'서비스 이용약관 개정 안내(01.15)','안녕하세요. 푸딩입니다. ',to_date('23/01/10','RR/MM/DD'),null,0,'U','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (127,1,'서비스 이용약관 개정 안내(01.15)','안녕하세요. 푸딩입니다. ',to_date('23/01/10','RR/MM/DD'),null,0,'R','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (128,1,'시스템 점검 안내','안녕하세요. 푸딩입니다. ',to_date('23/01/20','RR/MM/DD'),null,1,'U','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (129,1,'시스템 점검 안내','안녕하세요. 푸딩입니다. ',to_date('23/01/20','RR/MM/DD'),null,0,'R','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (130,1,'문자 메세지 안내 시스템 점검(01.25)','안녕하세요. 푸딩입니다. ',to_date('23/01/20','RR/MM/DD'),null,0,'U','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (131,1,'문자 메세지 안내 시스템 점검(01.25)','안녕하세요. 푸딩입니다. ',to_date('23/01/20','RR/MM/DD'),null,0,'R','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (132,1,'신한카드 시스템 정기점검 안내(01.27)','안녕하세요. 푸딩입니다. ',to_date('23/01/22','RR/MM/DD'),null,0,'U','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (133,1,'LGU+ 휴대폰 결제 및 본인확인 서비스 정기점검 예정(01.28)','안녕하세요. 푸딩입니다. ',to_date('23/01/25','RR/MM/DD'),null,0,'U','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (134,1,'SKT 휴대폰 결제 및 본인확인 서비스 정기점검 예정(01.29)','안녕하세요. 푸딩입니다. ',to_date('23/01/25','RR/MM/DD'),null,0,'U','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (135,1,'푸딩 소비자 분쟁해결 기준 안내','안녕하세요. 푸딩입니다. ',to_date('23/01/30','RR/MM/DD'),null,0,'U','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (136,1,'푸딩 소비자 분쟁해결 기준 안내','안녕하세요. 푸딩입니다. ',to_date('23/01/30','RR/MM/DD'),null,0,'R','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (137,1,'시스템 점검으로 서비스 이용 일시 중단 안내 수정','안녕하세요. 푸딩입니다. ',to_date('23/02/02','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),3,'U','N');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (138,1,'시스템 점검으로 서비스 이용 일시 중단 안내','안녕하세요. 푸딩입니다. ',to_date('23/02/02','RR/MM/DD'),null,3,'R','Y');
Insert into NOTICE (NOTICE_NO,USER_NO,NOTICE_TITLE,NOTICE_CONTENT,CREATE_DATE,MODIFY_DATE,COUNT,TO_WHOM,STATUS) values (140,1,'업체 공지사항','업체 공지사항',to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),0,'R','Y');
REM INSERTING into NOT_ABLE
SET DEFINE OFF;
Insert into NOT_ABLE (NOT_NO,RES_NO,NOT_YEAR,NOT_MONTH,NOT_DATE) values (25,1201,'2023','1','23');
Insert into NOT_ABLE (NOT_NO,RES_NO,NOT_YEAR,NOT_MONTH,NOT_DATE) values (2,1201,'2023','1','9');
Insert into NOT_ABLE (NOT_NO,RES_NO,NOT_YEAR,NOT_MONTH,NOT_DATE) values (3,1201,'2023','2','8');
Insert into NOT_ABLE (NOT_NO,RES_NO,NOT_YEAR,NOT_MONTH,NOT_DATE) values (4,1201,'2023','2','15');
Insert into NOT_ABLE (NOT_NO,RES_NO,NOT_YEAR,NOT_MONTH,NOT_DATE) values (5,1201,'2023','2','22');
Insert into NOT_ABLE (NOT_NO,RES_NO,NOT_YEAR,NOT_MONTH,NOT_DATE) values (6,1201,'2023','2','23');
Insert into NOT_ABLE (NOT_NO,RES_NO,NOT_YEAR,NOT_MONTH,NOT_DATE) values (7,1201,'2023','2','16');
Insert into NOT_ABLE (NOT_NO,RES_NO,NOT_YEAR,NOT_MONTH,NOT_DATE) values (21,1201,'2023','2','3');
Insert into NOT_ABLE (NOT_NO,RES_NO,NOT_YEAR,NOT_MONTH,NOT_DATE) values (22,1201,'2023','2','10');
Insert into NOT_ABLE (NOT_NO,RES_NO,NOT_YEAR,NOT_MONTH,NOT_DATE) values (24,1201,'2023','1','16');
REM INSERTING into PAYMENT
SET DEFINE OFF;
Insert into PAYMENT (PAY_NO,BOOK_NO,RES_NO,USER_NO,PAY_POINT,PAY_TOTAL,PAY_OP,PAY_DATE,STATUS) values (100,25,1201,3,0,24000,'신용카드',to_date('23/02/07','RR/MM/DD'),'Y');
Insert into PAYMENT (PAY_NO,BOOK_NO,RES_NO,USER_NO,PAY_POINT,PAY_TOTAL,PAY_OP,PAY_DATE,STATUS) values (101,30,1201,3,0,15000,'신용카드',to_date('23/02/07','RR/MM/DD'),'Y');
Insert into PAYMENT (PAY_NO,BOOK_NO,RES_NO,USER_NO,PAY_POINT,PAY_TOTAL,PAY_OP,PAY_DATE,STATUS) values (102,38,1201,3,0,37000,'신용카드',to_date('23/02/07','RR/MM/DD'),'Y');
Insert into PAYMENT (PAY_NO,BOOK_NO,RES_NO,USER_NO,PAY_POINT,PAY_TOTAL,PAY_OP,PAY_DATE,STATUS) values (103,12,1201,3,0,45000,'신용카드',to_date('23/02/07','RR/MM/DD'),'Y');
Insert into PAYMENT (PAY_NO,BOOK_NO,RES_NO,USER_NO,PAY_POINT,PAY_TOTAL,PAY_OP,PAY_DATE,STATUS) values (104,18,1201,3,0,37000,'신용카드',to_date('23/02/07','RR/MM/DD'),'Y');
Insert into PAYMENT (PAY_NO,BOOK_NO,RES_NO,USER_NO,PAY_POINT,PAY_TOTAL,PAY_OP,PAY_DATE,STATUS) values (105,19,1201,3,0,17000,'신용카드',to_date('23/02/07','RR/MM/DD'),'Y');
Insert into PAYMENT (PAY_NO,BOOK_NO,RES_NO,USER_NO,PAY_POINT,PAY_TOTAL,PAY_OP,PAY_DATE,STATUS) values (106,21,1201,3,0,51000,'신용카드',to_date('23/02/07','RR/MM/DD'),'Y');
Insert into PAYMENT (PAY_NO,BOOK_NO,RES_NO,USER_NO,PAY_POINT,PAY_TOTAL,PAY_OP,PAY_DATE,STATUS) values (107,200,1201,100,0,68000,'card',to_date('23/02/07','RR/MM/DD'),'Y');
Insert into PAYMENT (PAY_NO,BOOK_NO,RES_NO,USER_NO,PAY_POINT,PAY_TOTAL,PAY_OP,PAY_DATE,STATUS) values (120,220,1203,102,0,20000,'card',to_date('23/02/08','RR/MM/DD'),'Y');
Insert into PAYMENT (PAY_NO,BOOK_NO,RES_NO,USER_NO,PAY_POINT,PAY_TOTAL,PAY_OP,PAY_DATE,STATUS) values (121,221,1203,101,0,11000,'card',to_date('23/02/08','RR/MM/DD'),'Y');
Insert into PAYMENT (PAY_NO,BOOK_NO,RES_NO,USER_NO,PAY_POINT,PAY_TOTAL,PAY_OP,PAY_DATE,STATUS) values (122,222,1203,101,0,11000,'card',to_date('23/02/08','RR/MM/DD'),'Y');
Insert into PAYMENT (PAY_NO,BOOK_NO,RES_NO,USER_NO,PAY_POINT,PAY_TOTAL,PAY_OP,PAY_DATE,STATUS) values (123,223,1204,100,1680,33320,'card',to_date('23/02/08','RR/MM/DD'),'Y');
Insert into PAYMENT (PAY_NO,BOOK_NO,RES_NO,USER_NO,PAY_POINT,PAY_TOTAL,PAY_OP,PAY_DATE,STATUS) values (124,224,1204,101,0,53000,'card',to_date('23/02/08','RR/MM/DD'),'Y');
Insert into PAYMENT (PAY_NO,BOOK_NO,RES_NO,USER_NO,PAY_POINT,PAY_TOTAL,PAY_OP,PAY_DATE,STATUS) values (128,225,1201,102,1200,40800,'card',to_date('23/02/08','RR/MM/DD'),'Y');
Insert into PAYMENT (PAY_NO,BOOK_NO,RES_NO,USER_NO,PAY_POINT,PAY_TOTAL,PAY_OP,PAY_DATE,STATUS) values (129,225,1201,102,-1200,-40800,'card',to_date('23/02/08','RR/MM/DD'),'C');
REM INSERTING into POINT
SET DEFINE OFF;
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (100,null,100,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (101,null,101,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (102,null,102,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (103,null,103,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (104,null,104,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (105,null,105,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (106,null,106,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (107,null,107,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (108,null,108,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (109,null,109,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (110,null,110,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (111,null,111,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (112,null,112,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (113,null,113,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (114,null,114,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (115,null,115,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (116,null,116,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (117,null,117,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (118,null,118,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (119,null,119,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (120,null,120,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (121,null,121,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (122,null,122,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (123,null,123,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (124,null,124,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (125,null,125,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (126,null,126,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (127,null,127,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (128,null,128,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (129,null,129,null,'회원가입축하','B',1000,1000,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (130,107,100,1201,'2023-02-09 루키식당','B',680,1680,to_date('23/02/07','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (140,120,102,1203,'2023-02-24 케르반레스토랑','B',200,1200,to_date('23/02/08','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (141,121,101,1203,'2023-02-07 케르반레스토랑','B',110,1110,to_date('23/02/08','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (142,122,101,1203,'2023-02-09 케르반레스토랑','B',110,1220,to_date('23/02/08','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (143,123,100,1204,'2023-02-18 롸카두들','U',1680,0,to_date('23/02/08','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (144,123,100,1204,'2023-02-18 롸카두들','B',333,2013,to_date('23/02/08','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (145,124,101,1204,'2023-02-07 롸카두들','B',530,1750,to_date('23/02/08','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (146,null,140,null,'회원가입축하','B',1000,1000,to_date('23/02/08','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (147,128,102,1201,'2023-02-17 루키식당','U',1200,0,to_date('23/02/08','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (148,128,102,1201,'2023-02-17 루키식당','B',408,1608,to_date('23/02/08','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (149,128,102,1201,'루키식당','C',1200,1200,to_date('23/02/08','RR/MM/DD'));
Insert into POINT (POINT_NO,PAY_NO,USER_NO,RES_NO,POINT_NAME,STATUS,POINT_TRADE,POINT_NOW,POINT_DATE) values (150,null,100,null,'특별적립금','B',100000,103693,to_date('23/02/08','RR/MM/DD'));
REM INSERTING into QUESTION
SET DEFINE OFF;
Insert into QUESTION (Q_NO,CATEGORY,Q_TITLE,Q_CONTENT,CREATE_DATE,MODIFY_DATE,DELETE_DATE,A_CONTENT,A_DATE,STATUS,Q_PERSON,Q_WHO,A_PERSON,A_WHO) values (100,'예약문의','지난 예약때 물건을 놓고 온것 같아요.','빨간색 카드지갑인데 혹시 분실물 있나요?',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),null,'네. 보관중입니다. 찾으러 오세요.^^',to_date('23/02/07','RR/MM/DD'),'Y','6','U','1201','R');
Insert into QUESTION (Q_NO,CATEGORY,Q_TITLE,Q_CONTENT,CREATE_DATE,MODIFY_DATE,DELETE_DATE,A_CONTENT,A_DATE,STATUS,Q_PERSON,Q_WHO,A_PERSON,A_WHO) values (101,'예약문의','예약했는데 날짜를 바꾸고 싶어요!','일단 취소를 해주시면 다시 예약하겠습니다.',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),null,'네. 취소 완료하였습니다.^^',to_date('23/02/07','RR/MM/DD'),'Y','6','U','1201','R');
Insert into QUESTION (Q_NO,CATEGORY,Q_TITLE,Q_CONTENT,CREATE_DATE,MODIFY_DATE,DELETE_DATE,A_CONTENT,A_DATE,STATUS,Q_PERSON,Q_WHO,A_PERSON,A_WHO) values (102,'이용문의','알러지가 있습니다','오이알러지가 있어요. 오이가 들어간 메뉴를 알려주세요',to_date('23/02/07','RR/MM/DD'),null,null,null,null,'N','4','U','1201','R');
Insert into QUESTION (Q_NO,CATEGORY,Q_TITLE,Q_CONTENT,CREATE_DATE,MODIFY_DATE,DELETE_DATE,A_CONTENT,A_DATE,STATUS,Q_PERSON,Q_WHO,A_PERSON,A_WHO) values (103,'이용문의','애견동반 가능한가요?','애견동반이라는 얘기가 있어서 문의드려요',to_date('23/02/07','RR/MM/DD'),null,null,null,null,'N','5','U','1201','R');
Insert into QUESTION (Q_NO,CATEGORY,Q_TITLE,Q_CONTENT,CREATE_DATE,MODIFY_DATE,DELETE_DATE,A_CONTENT,A_DATE,STATUS,Q_PERSON,Q_WHO,A_PERSON,A_WHO) values (104,'MP','적립금...','더 주실 수 있나요?',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'안줍니다.',to_date('23/02/07','RR/MM/DD'),'Y','100','U',null,'A');
Insert into QUESTION (Q_NO,CATEGORY,Q_TITLE,Q_CONTENT,CREATE_DATE,MODIFY_DATE,DELETE_DATE,A_CONTENT,A_DATE,STATUS,Q_PERSON,Q_WHO,A_PERSON,A_WHO) values (120,'예약문의','지난 예약때 물건을 놓고 온것 같아요.','빨간색 카드지갑인데 혹시 분실물 있나요?',to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),null,'네. 보관중입니다. 찾으러 오세요.^^',to_date('23/02/08','RR/MM/DD'),'Y','1','U','1201','R');
Insert into QUESTION (Q_NO,CATEGORY,Q_TITLE,Q_CONTENT,CREATE_DATE,MODIFY_DATE,DELETE_DATE,A_CONTENT,A_DATE,STATUS,Q_PERSON,Q_WHO,A_PERSON,A_WHO) values (121,'예약문의','예약했는데 날짜를 바꾸고 싶어요!','일단 취소를 해주시면 다시 예약하겠습니다.',to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),null,'네. 취소 완료하였습니다.^^',to_date('23/02/08','RR/MM/DD'),'Y','2','U','1201','R');
Insert into QUESTION (Q_NO,CATEGORY,Q_TITLE,Q_CONTENT,CREATE_DATE,MODIFY_DATE,DELETE_DATE,A_CONTENT,A_DATE,STATUS,Q_PERSON,Q_WHO,A_PERSON,A_WHO) values (122,'이용문의','알러지가 있습니다','오이알러지가 있어요. 오이가 들어간 메뉴를 알려주세요',to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),null,'오이는 일절 사용하지 않습니다^^',to_date('23/02/08','RR/MM/DD'),'Y','3','U','1201','R');
Insert into QUESTION (Q_NO,CATEGORY,Q_TITLE,Q_CONTENT,CREATE_DATE,MODIFY_DATE,DELETE_DATE,A_CONTENT,A_DATE,STATUS,Q_PERSON,Q_WHO,A_PERSON,A_WHO) values (123,'이용문의','애견동반 가능한가요?','애견동반이라는 얘기가 있어서 문의드려요',to_date('23/02/08','RR/MM/DD'),null,null,null,null,'N','1','U','1201','R');
Insert into QUESTION (Q_NO,CATEGORY,Q_TITLE,Q_CONTENT,CREATE_DATE,MODIFY_DATE,DELETE_DATE,A_CONTENT,A_DATE,STATUS,Q_PERSON,Q_WHO,A_PERSON,A_WHO) values (124,'MP','적립금 좀 많이 주세요 ㅡㅡ ','적립금이 너무 짠 거 아닌가요 ㅡㅡ ',to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),null,to_date('23/02/08','RR/MM/DD'),'N','103','U',null,'A');
Insert into QUESTION (Q_NO,CATEGORY,Q_TITLE,Q_CONTENT,CREATE_DATE,MODIFY_DATE,DELETE_DATE,A_CONTENT,A_DATE,STATUS,Q_PERSON,Q_WHO,A_PERSON,A_WHO) values (125,'ME','안녕하세요','메롱',to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),'메롱?ㅡㅡ',to_date('23/02/08','RR/MM/DD'),'Y','101','U',null,'A');
Insert into QUESTION (Q_NO,CATEGORY,Q_TITLE,Q_CONTENT,CREATE_DATE,MODIFY_DATE,DELETE_DATE,A_CONTENT,A_DATE,STATUS,Q_PERSON,Q_WHO,A_PERSON,A_WHO) values (126,'ME','환불을 안 해준대요 ㅡㅡ ','환불 해주세요 맘에 안 들어요',to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),null,to_date('23/02/08','RR/MM/DD'),'N','103','U',null,'A');
Insert into QUESTION (Q_NO,CATEGORY,Q_TITLE,Q_CONTENT,CREATE_DATE,MODIFY_DATE,DELETE_DATE,A_CONTENT,A_DATE,STATUS,Q_PERSON,Q_WHO,A_PERSON,A_WHO) values (127,'이용문의','결제내역 확인이 안돼요','사이트 오류가 난 것 같아요',to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),null,'네. 보관중입니다. 찾으러 오세요.^^',to_date('23/02/08','RR/MM/DD'),'Y','1203','R',null,'A');
Insert into QUESTION (Q_NO,CATEGORY,Q_TITLE,Q_CONTENT,CREATE_DATE,MODIFY_DATE,DELETE_DATE,A_CONTENT,A_DATE,STATUS,Q_PERSON,Q_WHO,A_PERSON,A_WHO) values (128,'MU','안녕하세요 ','헉',to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),null,to_date('23/02/08','RR/MM/DD'),'N','100','U',null,'A');
REM INSERTING into RESTAURANT
SET DEFINE OFF;
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1200,'1234','로지다이너','김숙','567-78-88222','서울 용산구 대사관로34길 38','1층','서울특별시','용산구','02-797-8977','01089894566','hanma@naver.com','N',to_date('23/02/07','RR/MM/DD'),null,null,'S','127.005549','37.531563','resources/rest_upfiles/2023020710194664486.jpg','09:00','22:30',null,null,'western',0);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1201,'1234','루키식당','김미미','556-71-88911','서울 용산구 이태원로 294','1층','서울특별시','용산구','1544-1591','01051512256','rookie_rest@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','127.002481','37.540866','resources/rest_upfiles/2023020710113995165.jpg','10:00','21:00','14:00','16:00','japanese',689);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1203,'1234','케르반레스토랑','케르반','056-45-15887','서울 용산구 이태원로 192','1층','서울특별시','용산구','02-1412-4658','01056787834','ducobi@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','126.995370','37.534365','resources/rest_upfiles/2023020710270075778.jpg','10:00','21:00','14:00','16:00','western',540);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1204,'1234','롸카두들','김두들','551-97-88524','서울 용산구 녹사평대로40나길 9','1층','서울특별시','용산구','02-798-3456','01089894566','corverte@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','126.988143','37.534498','resources/rest_upfiles/2023020710283694103.jpeg','12:00','22:00',null,null,'western',704);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1205,'1234','발루토피비','주은미','457-56-78798','서울 용산구 녹사평대로32길 37','1층','서울특별시','용산구','02-1309-7445','01089894566','corverte@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','126.990663','37.533014','resources/rest_upfiles/2023020710301143830.jpeg',null,null,null,null,'western',2);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1206,'1234','Corvette','임지연','556-71-88912','서울 용산구 한남대로27길 66','지하1층','서울특별시','용산구','0214671500','01051512256','corverte@naver.com','N',to_date('23/02/07','RR/MM/DD'),null,null,'Y','127.002998','37.539598','resources/rest_upfiles/2023020710135246372.jpg',null,null,null,null,'chicken',1);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1207,'1234','듀코비','홍미미','551-97-88524','서울 용산구 이태원로 238','제2호 지하1층','서울특별시','용산구','07-797-8586','01089894566','ducobi@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','126.999610','37.535989','resources/rest_upfiles/2023020710170264285.jpg',null,null,null,null,'asia',2);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1208,'1234','LOOSEDOOR','유은혜','556-71-88912','서울 용산구 이태원로55나길 6','1층','서울특별시','용산구','02-1309-7445','01051512256','dotz@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','126.999092','37.536665','resources/rest_upfiles/2023020710182385128.jpg',null,null,null,null,'western',1);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1209,'1','서울인더레인','김한성','123-45-67890','서울 금천구 벚꽃로 316','지하 1층 B02호','서울특별시','금천구','0507-1380-4423','010-1234-5678','seoulintherain@naver.com','N',to_date('23/02/07','RR/MM/DD'),null,null,'Y','126.882846','37.482723','resources/rest_upfiles/2023020709061257996.jpg','16:00','23:30',null,null,'bar',5);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1210,'1234','메이다이닝','이제한','123-45-67899','서울 금천구 시흥대로 291','독산 롯데캐슬골드파크3차 WEST동 2층 240호','서울특별시','금천구','02-6407-4047','010-1111-2222','maydining@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','126.896697','37.459956','resources/rest_upfiles/2023020709080910116.jpg',null,null,null,null,'western',3);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1211,'1234','진영면옥','정진영','123-45-99999','서울 금천구 가산로 22-5','진영면옥','서울특별시','금천구','0507-1367-2383','010-1111-3333','jinyoung@naver.com','N',to_date('23/02/07','RR/MM/DD'),null,null,'C','126.900397','37.471568','resources/rest_upfiles/2023020709100067122.jpg',null,null,null,null,'asia',1);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1212,'1234','가산물갈비백년불고기','홍학철','123-45-99988','서울 금천구 가산디지털1로 128','STX V TOWER 110호','서울특별시','금천구','0507-1414-8981','010-1111-4444','100year@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','126.883694','37.477236','resources/rest_upfiles/2023020709114745875.jpg',null,null,null,null,'asia',1);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1213,'1234','동흥관','최동훈','123-45-88899','서울 금천구 시흥대로63길 20','동흥관','서울특별시','금천구','02-803-3759','010-1234-5688','easthappy@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'C','126.898597','37.455223','resources/rest_upfiles/2023020709152149777.jpeg',null,null,null,null,'chinese',2);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1214,'1234','인크커피 가산점','최진철','123-45-88888','서울 금천구 가산디지털2로 127-20','인크커피','서울특별시','금천구','02-854-7200','010-1111-5555','ink@naver.com','N',to_date('23/02/07','RR/MM/DD'),null,null,'Y','126.878072','37.479339','resources/rest_upfiles/2023020709180313943.jpg',null,null,null,null,'cafe',2);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1215,'1234','문정곱창','박문정','123-45-77777','서울 금천구 디지털로12길 37','1층 103, 104호','서울특별시','금천구','0507-1391-7291','010-1111-6666','doorfriendship@daum.net','Y',to_date('23/02/07','RR/MM/DD'),null,null,'C','126.890328','37.477245','resources/rest_upfiles/2023020709200284411.jpeg',null,null,null,null,'asia',1);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1216,'1234','가산동닭한마리','최정','123-45-66666','서울 금천구 가산로 142','가산동닭한마리','서울특별시','금천구','0507-1373-9296','010-1111-7777','chicken@daum.net','Y',to_date('23/02/07','RR/MM/DD'),null,null,'C','126.891339','37.478032','resources/rest_upfiles/2023020709223367983.jpg',null,null,null,null,'chicken',2);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1217,'1234','리틀넥한남','김채원','123-99-98765','서울 용산구 한남대로 27길 66',' 1층','서울특별시','용산구','0507-1340-9499','010-9999-9877','littleneck123@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','127.002998','37.539598','resources/rest_upfiles/2023020710154249416.png',null,null,null,null,'western',0);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1218,'1234','세르클한남','김준수','123-88-87654','서울 용산구 이태원로223-5','4F','서울특별시','용산구','0507-1349-6828','010-8888-8765','cercle_hannam@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','126.998385','37.535573','resources/rest_upfiles/2023020710212312036.png',null,null,null,null,'western',1);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1219,'1234','더베이커스테이블','김여름','321-77-76543','서울 종로구 삼청로 131','1층','서울특별시','용산구','02-725-0777','010-7777-6542','thebakers07@gmail.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','126.981491','37.587090','resources/rest_upfiles/2023020710283359586.jpeg',null,null,null,null,'western',0);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1220,'1234','다운타우너한남','하준현','333-12-96325','서울 용산구 대사관로5길 12 ','1층 다운타우너 한남점','서울특별시','용산구','070-8806-3696','010-7777-2222','downtowner@gamil.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','127.000857','37.534843','resources/rest_upfiles/2023020710310291041.png',null,null,null,null,'western',0);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1221,'1234','바바라스키친','이지은','113-45-71243','서울 용산구 대사관로5길 17','1층','서울특별시','용산구','0507-1326-0908','010-6666-4756','barbaras@gmail.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','127.000557','37.534971','resources/rest_upfiles/2023020710351632165.jpeg',null,null,null,null,'chicken',0);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1222,'1234','데이로우','한유진','555-32-12385','서울 용산구 이태원로49길 14-3','1층','서울특별시','용산구','02-790-1767','010-6776-5742','dayrow@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','126.999584','37.537264','resources/rest_upfiles/2023020710424986466.jpg',null,null,null,null,'cafe',0);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1223,'1234','라페름','양라희','333-74-76214','서울 용산구 대사관로11길 49','지하 1층','서울특별시','용산구','0507-1410-6685','010-4444-2315','la123@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','127.001635','37.535706','resources/rest_upfiles/2023020710455082324.jpg',null,null,null,null,'western',0);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1224,'1234','쏭타이','쏭타이','981-25-12378','서울 용산구 이태원로20가길 7-2','2층','서울특별시','용산구','0507-1303-2495','010-9987-9127','tailover@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','126.992680','37.533728','resources/rest_upfiles/2023020710492618751.jpeg',null,null,null,null,'asia',0);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1225,'1234','세라즈피자펍','변백현','149-25-14542','서울시 금천구 가산동','371-28 A동 2F 222호','서울특별시','금천구','02-852-0415','010-1744-1425','mimi@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'W','126.891778','37.476875','resources/rest_upfiles/fp1DaSojK3yF9OmtMXNZVlzz.jpeg.jpg',null,null,null,null,'western',25);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1226,'1234','아웃백스테이크하우스','설현','189-22-14772','서울시 금천구 가산동','60-8 7F','서울특별시','금천구','02-2136-9971','010-1234-1234','mimi@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','126.891778','37.476875','resources/rest_upfiles/네이버플레이스_코어_3(1200x970)_블랙라벨.jpg',null,null,null,null,'western',7);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1227,'1234','샐러드로','이영애','741-22-18872','서울시 금천구 독산동','291-1 현대지식산업센터 T-L124호','서울특별시','금천구','02-2181-3580','010-1234-1234','mimi@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','126.899393','37.468141','resources/rest_upfiles/20220430_142336.jpg',null,null,null,null,'western',15);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1228,'1234','매드포갈릭','김철수','195-28-17242','서울시 금천구 가산동','60-8 현대시티아울렛 8F','서울특별시','금천구','02-2136-9982','010-1234-1234','mimi@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'W','126.891778','37.476875','resources/rest_upfiles/MFG_logo_300x300.jpg',null,null,null,null,'western',44);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1229,'1234','라티시크릿셰프','박라희','144-55-19642','서울시 금천구 독산동','1156 롯데캐슬골드파크타워 B1','서울특별시','금천구','02-2136-9982','010-6487-4545','mimi@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'C','126.899393','37.468141','resources/rest_upfiles/p8cvJYs76mBOK8dBfTh3X5lr.jpg',null,null,null,null,'western',57);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1230,'1234','더제이케이키친박스','안제희','177-33-19112','서울시 금천구 가산동','371-50 에이스하이앤드타워3차','서울특별시','금천구','02-2136-9982','010-8524-4111','mimi@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'W','126.891778','37.476875','resources/rest_upfiles/1675687606499.jpg',null,null,null,null,'western',95);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1231,'1234','오픈더그린','서유리','124-88-16941','서울시 금천구 가산동','345-29','서울특별시','금천구','02-2135-9209','010-7412-9652','mimi@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'C','126.891447','37.477262','resources/rest_upfiles/FBE9D480-5C50-4C61-83D0-8D467372F5D3.jpeg',null,null,null,null,'western',145);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1232,'1234','화덕피자모넬로','시우민','142-66-19222','서울시 금천구 독산동','1155 롯데캐슬골드파크 3차상가 LF 08호','서울특별시','금천구','010-6465-1373','02-7466-7496','mimi@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'W','126.899393','37.468141','resources/rest_upfiles/BusKENP5VZEoBMZaLAnOmVmQ.jpg',null,null,null,null,'western',96);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1233,'1234','빅터스버거','김제니','141-77-77112','서울시 금천구 독산동','1155 롯데캐슬골드파크3차 126호','서울특별시','금천구','02-803-5668','010-1475-9856','mimi@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','126.899393','37.468141','resources/rest_upfiles/GoTpungvmBuvJfa-bEy3abVP.jpg','13:30','22:00',null,null,'western',77);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1234,'1234','셀렉티','라리사','162-13-54693','서울시 금천구 가산동','152-30','서울특별시','금천구','02-303-7735','010-1111-2222','mimi@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'W','126.891778','37.476875','resources/rest_upfiles/VJ2BwRSY8Y2SbJ5VIHqlE9Fa.jpg',null,null,null,null,'western',86);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1235,'1234','롱블랙스푼','김민지','112-42-34569','서울시 금천구 가산동','371-17 BYC하이시티','서울특별시','금천구','02-6947-7788','010-1245-4545','mimi@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','126.892524','37.477006','resources/rest_upfiles/_xYurc2aKTOBaJF59H-QO22V.jpeg.jpg',null,null,null,null,'western',37);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1236,'1234','마피아피자펍','성해은','155-32-19112','서울시 금천구 가산동','371-28 우림라이온스밸리 A동 B1 B106-1호','서울특별시','금천구','02-2136-9982','010-4258-4545','mimi@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'Y','126.891778','37.476875','resources/rest_upfiles/hs4cdu67K71zjvN-YpAtsAYc.jpg','08:00','23:00',null,null,'western',81);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1237,'1234','리샐러드','정규민','127-47-19241','서울시 금천구 독산동','1150 113호','서울특별시','금천구','02-5853-4322','010-1428-4545','mimi@naver.com','Y',to_date('23/02/07','RR/MM/DD'),null,null,'N','126.901283','37.468751','resources/rest_upfiles/크기변환Instagram_포스트__1.png',null,null,null,null,'western',96);
Insert into RESTAURANT (RES_NO,USER_PWD,RES_NAME,CEO,PERMIT_NO,ADDRESS,D_ADDRESS,LOCAL_CT,DLOCAL_CT,PHONE,CELLPHONE,EMAIL,PARKING,APPLY_DATE,ENROLL_DATE,MODIFY_DATE,STATUS,LONGTITUDE,LATITUDE,R_IMG,OPEN,CLOSE,BREAK_S,BREAK_E,FOOD_CT,COUNT) values (1250,'1234','브루노피자 ','김미미 ','123-12-12345','서울 금천구 독산동  1155','1층','서울특별시','금천구','02-6013-9582','010-1010-1010','gh7416@naver.com','Y',to_date('23/02/08','RR/MM/DD'),null,null,'C','126.897248','37.459916','resources/rest_upfiles/2023020811195052144.jpg',null,null,null,null,'western',2);
REM INSERTING into REVIEW
SET DEFINE OFF;
Insert into REVIEW (REVIEW_NO,RES_NO,USER_NO,BOOK_NO,REVIEW_CONTENT,STAR,CREATE_DATE,MODIFY_DATE,STATUS,GOOD,COUNT) values (101,1201,1,25,'맛있어요',4.5,to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y','N',0);
Insert into REVIEW (REVIEW_NO,RES_NO,USER_NO,BOOK_NO,REVIEW_CONTENT,STAR,CREATE_DATE,MODIFY_DATE,STATUS,GOOD,COUNT) values (121,1201,1,30,'머리카락ㅡㅡ나왔어요. 위생별로인듯',1,to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),'Y','N',0);
Insert into REVIEW (REVIEW_NO,RES_NO,USER_NO,BOOK_NO,REVIEW_CONTENT,STAR,CREATE_DATE,MODIFY_DATE,STATUS,GOOD,COUNT) values (123,1201,2,38,'굿입니다. 아주 굿',5,to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),'Y','Y',0);
Insert into REVIEW (REVIEW_NO,RES_NO,USER_NO,BOOK_NO,REVIEW_CONTENT,STAR,CREATE_DATE,MODIFY_DATE,STATUS,GOOD,COUNT) values (124,1201,100,200,'맛있어요',3.5,to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),'Y','N',0);
Insert into REVIEW (REVIEW_NO,RES_NO,USER_NO,BOOK_NO,REVIEW_CONTENT,STAR,CREATE_DATE,MODIFY_DATE,STATUS,GOOD,COUNT) values (128,1204,101,224,'맛있어요',5,to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),'Y','N',0);
REM INSERTING into SITE
SET DEFINE OFF;
REM INSERTING into TB_USER
SET DEFINE OFF;
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (1,'fooding01','1111','푸딩01',null,null,null,null,null,null,null,'A');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (2,'fooding02','2222','푸딩02',null,null,null,null,null,null,null,'A');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (3,'fooding03','3333','푸딩03',null,null,null,null,null,null,null,'A');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (100,'user01','1111','김민지','뉴진스리더','minji@naver.com','01000002222','F','20040101',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'S');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (101,'user02','3333','강해린','아기고양이','kitty@naver.com','01000002222','N','20040102',to_date('23/02/07','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (102,'user03','1111','팜하니','빵하니','hanni01@naver.com','01000001111','N','20040101',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (103,'user04','1111','김석진','월드와이드','jjjin06@naver.com','01012341111','M','20040202',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (104,'user05','1111','김남준','랩몬','monster@naver.com','01012342222','N','19990505',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (105,'user06','1111','전정국','쿠키','kook@naver.com','01012343333','N','19990109',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (106,'user13','1111','김가현','잇프피','isfp15@naver.com','01000001115','F','19960105',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (107,'user07','1111','다니엘','해바라기','danielle04@naver.com','01000004444','F','20020409',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (108,'user23','1111','김지수','지츄','jisoo11@naver.com','01000001110','F','19960101',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (109,'user14','1111','차은우','얼굴천재','facegenius@naver.com','01034543333','M','19970207',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (110,'user08','1111','강동원','참치','tuna26@naver.com','01012311111','M','19810101',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (111,'user15','1111','박보검','보거미','hipark@naver.com','01098761111','F','19931231',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (112,'user24','1111','김제니','젠득이','jennie12@naver.com','01000001112','F','19960102',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (113,'user09','1111','서강준','비타민','vitamin@naver.com','01023422222','N','20000202',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (114,'user16','1111','김채원','채채','chaechae@naver.com','01022441111','F','20000801',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (115,'user25','1111','공유','커피프린스','coffelover@naver.com','01099991111','M','19811203',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (116,'user10','1111','이혜인','헨이이','hyein2008@naver.com','01000005555','F','20040125',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (117,'user17','1111','허윤진','핫걸','hotgirl17@naver.com','01022331111','F','20000103',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (118,'user11','1111','정호석','호비','hopp10@naver.com','01012345555','M','20040101',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (119,'user18','1111','김태형','태태','vvvvv09@naver.com','01012344444','F','20040101',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (120,'user12','1111','김리사','셀리사','lisaaa@naver.com','01000001114','F',null,to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (121,'user26','1111','김로제','챙람쥐','rosie13@naver.com','01000001113','N','19960303',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (122,'user19','1111','안유진','안댕댕','puppy19@naver.com','01088001111','N','20040101',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (123,'user20','1111','김지원','치즈냥이','liz20@naver.com','01002024222','F','20040102',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (124,'user27','1111','한지성','다람지','han23@naver.com','01045673333','M','20001003',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (125,'user21','1111','이민호','리노','minho21@naver.com','01023451111','N','20001221',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (126,'user28','1111','홍은채','만채','hong18@naver.com','01022771111','F',null,to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (127,'user22','1111','서창빈','비니','bin22@naver.com','01034562222','F','20001102',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (128,'user29','1111','이용복','필깅이','felixlee@naver.com','01056781111','N','20040201',to_date('23/02/07','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),'N');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (129,'user30','1111','황현진','황자님','prince25@naver.com','01067891111','M','20040401',to_date('23/02/07','RR/MM/DD'),to_date('23/02/07','RR/MM/DD'),'Y');
Insert into TB_USER (USER_NO,USER_ID,USER_PWD,USER_NAME,NICKNAME,USER_EMAIL,USER_PHONE,GENDER,BIRTH,ENROLL_DATE,MODIFY_DATE,STATUS) values (140,'hahaha0123','1234','하하하','귀여운강쥐','hahaha0123@naver.com','01064095744','F','20040101',to_date('23/02/08','RR/MM/DD'),to_date('23/02/08','RR/MM/DD'),'N');
--------------------------------------------------------
--  DDL for Index PK_ATTACHMENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_ATTACHMENT" ON "ATTACHMENT" ("FILE_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_NOTICE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_NOTICE" ON "NOTICE" ("NOTICE_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_SITE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_SITE" ON "SITE" ("SITE_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_BLACK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_BLACK" ON "BLACK" ("BLACK_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_MONTHLY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_MONTHLY" ON "MONTHLY" ("MON_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_TB_USER
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_TB_USER" ON "TB_USER" ("USER_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_NOT_ABLE
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_NOT_ABLE" ON "NOT_ABLE" ("RES_NO", "NOT_YEAR", "NOT_MONTH", "NOT_DATE") 
  ;
--------------------------------------------------------
--  DDL for Index PK_MENU
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_MENU" ON "MENU" ("MENU_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_FAQ
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_FAQ" ON "FAQ" ("FAQ_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_QUESTION
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_QUESTION" ON "QUESTION" ("Q_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_BOOK_MENU
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_BOOK_MENU" ON "BOOK_MENU" ("BM_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_REVIEW
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_REVIEW" ON "REVIEW" ("REVIEW_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_PAYMENT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_PAYMENT" ON "PAYMENT" ("PAY_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_BOOK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_BOOK" ON "BOOK" ("BOOK_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_RESTAURANT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_RESTAURANT" ON "RESTAURANT" ("RES_NO") 
  ;
--------------------------------------------------------
--  DDL for Index PK_POINT
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_POINT" ON "POINT" ("POINT_NO") 
  ;
--------------------------------------------------------
--  Constraints for Table TB_USER
--------------------------------------------------------

  ALTER TABLE "TB_USER" ADD CONSTRAINT "PK_TB_USER" PRIMARY KEY ("USER_NO") ENABLE;
  ALTER TABLE "TB_USER" ADD UNIQUE ("NICKNAME") ENABLE;
  ALTER TABLE "TB_USER" ADD UNIQUE ("USER_ID") ENABLE;
  ALTER TABLE "TB_USER" ADD CHECK (STATUS IN('Y','N','S','A')) ENABLE;
  ALTER TABLE "TB_USER" ADD CHECK (GENDER IN('F','M','N')) ENABLE;
  ALTER TABLE "TB_USER" MODIFY ("USER_PWD" NOT NULL ENABLE);
  ALTER TABLE "TB_USER" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "TB_USER" MODIFY ("USER_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NOT_ABLE
--------------------------------------------------------

  ALTER TABLE "NOT_ABLE" ADD CONSTRAINT "PK_NOT_ABLE" PRIMARY KEY ("RES_NO", "NOT_YEAR", "NOT_MONTH", "NOT_DATE") ENABLE;
  ALTER TABLE "NOT_ABLE" MODIFY ("RES_NO" NOT NULL ENABLE);
  ALTER TABLE "NOT_ABLE" MODIFY ("NOT_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table GOOD
--------------------------------------------------------

  ALTER TABLE "GOOD" MODIFY ("GOOD_DATE" NOT NULL ENABLE);
  ALTER TABLE "GOOD" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "GOOD" MODIFY ("RES_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table ATTACHMENT
--------------------------------------------------------

  ALTER TABLE "ATTACHMENT" ADD CONSTRAINT "PK_ATTACHMENT" PRIMARY KEY ("FILE_NO") ENABLE;
  ALTER TABLE "ATTACHMENT" ADD CHECK (BOARD_TYPE IN('N','R','Q','B')) ENABLE;
  ALTER TABLE "ATTACHMENT" ADD CHECK (STATUS IN('Y', 'N')) ENABLE;
  ALTER TABLE "ATTACHMENT" MODIFY ("BOARD_TYPE" NOT NULL ENABLE);
  ALTER TABLE "ATTACHMENT" MODIFY ("FILE_PATH" NOT NULL ENABLE);
  ALTER TABLE "ATTACHMENT" MODIFY ("CHANGE_NAME" NOT NULL ENABLE);
  ALTER TABLE "ATTACHMENT" MODIFY ("ORIGIN_NAME" NOT NULL ENABLE);
  ALTER TABLE "ATTACHMENT" MODIFY ("FILE_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SITE
--------------------------------------------------------

  ALTER TABLE "SITE" ADD CONSTRAINT "PK_SITE" PRIMARY KEY ("SITE_NO") ENABLE;
  ALTER TABLE "SITE" ADD CHECK (WRITE_TYPE IN('B','P','I','E')) ENABLE;
  ALTER TABLE "SITE" MODIFY ("WRITE_TYPE" NOT NULL ENABLE);
  ALTER TABLE "SITE" MODIFY ("SITE_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "SITE" MODIFY ("SITE_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY ("REVIEW_NO") ENABLE;
  ALTER TABLE "REVIEW" ADD CHECK (GOOD IN('Y','N')) ENABLE;
  ALTER TABLE "REVIEW" ADD CHECK (STATUS IN('Y','N')) ENABLE;
  ALTER TABLE "REVIEW" MODIFY ("STAR" NOT NULL ENABLE);
  ALTER TABLE "REVIEW" MODIFY ("REVIEW_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "REVIEW" MODIFY ("BOOK_NO" NOT NULL ENABLE);
  ALTER TABLE "REVIEW" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "REVIEW" MODIFY ("RES_NO" NOT NULL ENABLE);
  ALTER TABLE "REVIEW" MODIFY ("REVIEW_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BLACK
--------------------------------------------------------

  ALTER TABLE "BLACK" ADD CONSTRAINT "PK_BLACK" PRIMARY KEY ("BLACK_NO") ENABLE;
  ALTER TABLE "BLACK" ADD CHECK (BLACK_TYPE IN('RV', 'RR')) ENABLE;
  ALTER TABLE "BLACK" MODIFY ("BLACK_TYPE" NOT NULL ENABLE);
  ALTER TABLE "BLACK" MODIFY ("BLACK_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "BLACK" MODIFY ("BLACK_TITEL" NOT NULL ENABLE);
  ALTER TABLE "BLACK" MODIFY ("T_PERSON" NOT NULL ENABLE);
  ALTER TABLE "BLACK" MODIFY ("B_PERSON" NOT NULL ENABLE);
  ALTER TABLE "BLACK" MODIFY ("BLACK_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MONTHLY
--------------------------------------------------------

  ALTER TABLE "MONTHLY" ADD CONSTRAINT "PK_MONTHLY" PRIMARY KEY ("MON_NO") ENABLE;
  ALTER TABLE "MONTHLY" ADD CHECK (STATUS IN('Y','N')) ENABLE;
  ALTER TABLE "MONTHLY" MODIFY ("MONTHLY" NOT NULL ENABLE);
  ALTER TABLE "MONTHLY" MODIFY ("RES_NO" NOT NULL ENABLE);
  ALTER TABLE "MONTHLY" MODIFY ("MON_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MENU
--------------------------------------------------------

  ALTER TABLE "MENU" ADD CONSTRAINT "PK_MENU" PRIMARY KEY ("MENU_NO") ENABLE;
  ALTER TABLE "MENU" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "MENU" MODIFY ("MENU_NAME" NOT NULL ENABLE);
  ALTER TABLE "MENU" MODIFY ("RES_NO" NOT NULL ENABLE);
  ALTER TABLE "MENU" MODIFY ("MENU_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FAQ
--------------------------------------------------------

  ALTER TABLE "FAQ" ADD CONSTRAINT "PK_FAQ" PRIMARY KEY ("FAQ_NO") ENABLE;
  ALTER TABLE "FAQ" ADD CHECK (STATUS IN('Y', 'N')) ENABLE;
  ALTER TABLE "FAQ" ADD CHECK (WHO IN('U','R')) ENABLE;
  ALTER TABLE "FAQ" MODIFY ("WHO" NOT NULL ENABLE);
  ALTER TABLE "FAQ" MODIFY ("FAQ_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "FAQ" MODIFY ("FAQ_TITLE" NOT NULL ENABLE);
  ALTER TABLE "FAQ" MODIFY ("CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "FAQ" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "FAQ" MODIFY ("FAQ_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table POINT
--------------------------------------------------------

  ALTER TABLE "POINT" ADD CONSTRAINT "PK_POINT" PRIMARY KEY ("POINT_NO") ENABLE;
  ALTER TABLE "POINT" ADD CHECK (STATUS IN('B','C','U')) ENABLE;
  ALTER TABLE "POINT" MODIFY ("POINT_TRADE" NOT NULL ENABLE);
  ALTER TABLE "POINT" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "POINT" MODIFY ("POINT_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table QUESTION
--------------------------------------------------------

  ALTER TABLE "QUESTION" ADD CONSTRAINT "PK_QUESTION" PRIMARY KEY ("Q_NO") ENABLE;
  ALTER TABLE "QUESTION" ADD CHECK (A_WHO IN('R', 'A')) ENABLE;
  ALTER TABLE "QUESTION" ADD CHECK (Q_WHO IN('U', 'R')) ENABLE;
  ALTER TABLE "QUESTION" ADD CHECK (STATUS IN('Y', 'N')) ENABLE;
  ALTER TABLE "QUESTION" MODIFY ("Q_WHO" NOT NULL ENABLE);
  ALTER TABLE "QUESTION" MODIFY ("Q_PERSON" NOT NULL ENABLE);
  ALTER TABLE "QUESTION" MODIFY ("Q_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "QUESTION" MODIFY ("Q_TITLE" NOT NULL ENABLE);
  ALTER TABLE "QUESTION" MODIFY ("CATEGORY" NOT NULL ENABLE);
  ALTER TABLE "QUESTION" MODIFY ("Q_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RESTAURANT
--------------------------------------------------------

  ALTER TABLE "RESTAURANT" ADD CONSTRAINT "PK_RESTAURANT" PRIMARY KEY ("RES_NO") ENABLE;
  ALTER TABLE "RESTAURANT" ADD CHECK (STATUS IN('W','N','C','Y','S')) ENABLE;
  ALTER TABLE "RESTAURANT" ADD CHECK (PARKING IN('Y', 'N')) ENABLE;
  ALTER TABLE "RESTAURANT" MODIFY ("FOOD_CT" NOT NULL ENABLE);
  ALTER TABLE "RESTAURANT" MODIFY ("LATITUDE" NOT NULL ENABLE);
  ALTER TABLE "RESTAURANT" MODIFY ("LONGTITUDE" NOT NULL ENABLE);
  ALTER TABLE "RESTAURANT" MODIFY ("APPLY_DATE" NOT NULL ENABLE);
  ALTER TABLE "RESTAURANT" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "RESTAURANT" MODIFY ("CELLPHONE" NOT NULL ENABLE);
  ALTER TABLE "RESTAURANT" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "RESTAURANT" MODIFY ("DLOCAL_CT" NOT NULL ENABLE);
  ALTER TABLE "RESTAURANT" MODIFY ("LOCAL_CT" NOT NULL ENABLE);
  ALTER TABLE "RESTAURANT" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "RESTAURANT" MODIFY ("PERMIT_NO" NOT NULL ENABLE);
  ALTER TABLE "RESTAURANT" MODIFY ("CEO" NOT NULL ENABLE);
  ALTER TABLE "RESTAURANT" MODIFY ("RES_NAME" NOT NULL ENABLE);
  ALTER TABLE "RESTAURANT" MODIFY ("USER_PWD" NOT NULL ENABLE);
  ALTER TABLE "RESTAURANT" MODIFY ("RES_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PAYMENT
--------------------------------------------------------

  ALTER TABLE "PAYMENT" ADD CONSTRAINT "PK_PAYMENT" PRIMARY KEY ("PAY_NO") ENABLE;
  ALTER TABLE "PAYMENT" ADD CHECK (STATUS IN('Y','C')) ENABLE;
  ALTER TABLE "PAYMENT" MODIFY ("PAY_OP" NOT NULL ENABLE);
  ALTER TABLE "PAYMENT" MODIFY ("PAY_TOTAL" NOT NULL ENABLE);
  ALTER TABLE "PAYMENT" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "PAYMENT" MODIFY ("RES_NO" NOT NULL ENABLE);
  ALTER TABLE "PAYMENT" MODIFY ("BOOK_NO" NOT NULL ENABLE);
  ALTER TABLE "PAYMENT" MODIFY ("PAY_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOOK_MENU
--------------------------------------------------------

  ALTER TABLE "BOOK_MENU" ADD CONSTRAINT "PK_BOOK_MENU" PRIMARY KEY ("BM_NO") ENABLE;
  ALTER TABLE "BOOK_MENU" MODIFY ("BM_PRICE" NOT NULL ENABLE);
  ALTER TABLE "BOOK_MENU" MODIFY ("MENU_COUNT" NOT NULL ENABLE);
  ALTER TABLE "BOOK_MENU" MODIFY ("MENU_NO" NOT NULL ENABLE);
  ALTER TABLE "BOOK_MENU" MODIFY ("BOOK_NO" NOT NULL ENABLE);
  ALTER TABLE "BOOK_MENU" MODIFY ("BM_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOOK
--------------------------------------------------------

  ALTER TABLE "BOOK" ADD CONSTRAINT "PK_BOOK" PRIMARY KEY ("BOOK_NO") ENABLE;
  ALTER TABLE "BOOK" ADD CHECK (STATUS IN('B', 'C', 'D')) ENABLE;
  ALTER TABLE "BOOK" MODIFY ("PEOPLE" NOT NULL ENABLE);
  ALTER TABLE "BOOK" MODIFY ("BOOK_TIME" NOT NULL ENABLE);
  ALTER TABLE "BOOK" MODIFY ("BOOK_DATE" NOT NULL ENABLE);
  ALTER TABLE "BOOK" MODIFY ("BOOK_PHONE" NOT NULL ENABLE);
  ALTER TABLE "BOOK" MODIFY ("BOOK_NAME" NOT NULL ENABLE);
  ALTER TABLE "BOOK" MODIFY ("RES_NO" NOT NULL ENABLE);
  ALTER TABLE "BOOK" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "BOOK" MODIFY ("BOOK_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY ("NOTICE_NO") ENABLE;
  ALTER TABLE "NOTICE" ADD CHECK (STATUS IN('Y', 'N')) ENABLE;
  ALTER TABLE "NOTICE" ADD CHECK (TO_WHOM IN('U', 'R')) ENABLE;
  ALTER TABLE "NOTICE" MODIFY ("TO_WHOM" NOT NULL ENABLE);
  ALTER TABLE "NOTICE" MODIFY ("NOTICE_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "NOTICE" MODIFY ("NOTICE_TITLE" NOT NULL ENABLE);
  ALTER TABLE "NOTICE" MODIFY ("USER_NO" NOT NULL ENABLE);
  ALTER TABLE "NOTICE" MODIFY ("NOTICE_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BOOK
--------------------------------------------------------

  ALTER TABLE "BOOK" ADD CONSTRAINT "FK_RESTAURANT_TO_BOOK_1" FOREIGN KEY ("RES_NO")
	  REFERENCES "RESTAURANT" ("RES_NO") ENABLE;
  ALTER TABLE "BOOK" ADD CONSTRAINT "FK_TB_USER_TO_BOOK_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "TB_USER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOOK_MENU
--------------------------------------------------------

  ALTER TABLE "BOOK_MENU" ADD CONSTRAINT "FK_BOOK_TO_BOOK_MENU_1" FOREIGN KEY ("BOOK_NO")
	  REFERENCES "BOOK" ("BOOK_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FAQ
--------------------------------------------------------

  ALTER TABLE "FAQ" ADD CONSTRAINT "FK_TB_USER_TO_FAQ_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "TB_USER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table GOOD
--------------------------------------------------------

  ALTER TABLE "GOOD" ADD CONSTRAINT "FK_RESTAURANT_TO_GOOD_1" FOREIGN KEY ("RES_NO")
	  REFERENCES "RESTAURANT" ("RES_NO") ENABLE;
  ALTER TABLE "GOOD" ADD CONSTRAINT "FK_TB_USER_TO_GOOD_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "TB_USER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MENU
--------------------------------------------------------

  ALTER TABLE "MENU" ADD CONSTRAINT "FK_RESTAURANT_TO_MENU_1" FOREIGN KEY ("RES_NO")
	  REFERENCES "RESTAURANT" ("RES_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MONTHLY
--------------------------------------------------------

  ALTER TABLE "MONTHLY" ADD CONSTRAINT "FK_RESTAURANT_TO_MONTHLY_1" FOREIGN KEY ("RES_NO")
	  REFERENCES "RESTAURANT" ("RES_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_TB_USER_TO_NOTICE_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "TB_USER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NOT_ABLE
--------------------------------------------------------

  ALTER TABLE "NOT_ABLE" ADD CONSTRAINT "FK_RESTAURANT_TO_NOT_ABLE_1" FOREIGN KEY ("RES_NO")
	  REFERENCES "RESTAURANT" ("RES_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PAYMENT
--------------------------------------------------------

  ALTER TABLE "PAYMENT" ADD CONSTRAINT "FK_BOOK_TO_PAYMENT_1" FOREIGN KEY ("BOOK_NO")
	  REFERENCES "BOOK" ("BOOK_NO") ENABLE;
  ALTER TABLE "PAYMENT" ADD CONSTRAINT "FK_RESTAURANT_TO_PAYMENT_1" FOREIGN KEY ("RES_NO")
	  REFERENCES "RESTAURANT" ("RES_NO") ENABLE;
  ALTER TABLE "PAYMENT" ADD CONSTRAINT "FK_TB_USER_TO_PAYMENT_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "TB_USER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table POINT
--------------------------------------------------------

  ALTER TABLE "POINT" ADD CONSTRAINT "FK_PAYMENT_TO_POINT_1" FOREIGN KEY ("PAY_NO")
	  REFERENCES "PAYMENT" ("PAY_NO") ENABLE;
  ALTER TABLE "POINT" ADD CONSTRAINT "FK_RESTAURANT_TO_POINT_1" FOREIGN KEY ("RES_NO")
	  REFERENCES "RESTAURANT" ("RES_NO") ENABLE;
  ALTER TABLE "POINT" ADD CONSTRAINT "FK_TB_USER_TO_POINT_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "TB_USER" ("USER_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_BOOK_TO_REVIEW_1" FOREIGN KEY ("BOOK_NO")
	  REFERENCES "BOOK" ("BOOK_NO") ENABLE;
  ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_RESTAURANT_TO_REVIEW_1" FOREIGN KEY ("RES_NO")
	  REFERENCES "RESTAURANT" ("RES_NO") ENABLE;
  ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_TB_USER_TO_REVIEW_1" FOREIGN KEY ("USER_NO")
	  REFERENCES "TB_USER" ("USER_NO") ENABLE;
