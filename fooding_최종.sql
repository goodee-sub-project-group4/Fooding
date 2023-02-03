-----------------삭제------------------
-- 해당 계정의 모든 트리거 삭제
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/
--해당 계정의 모든테이블 및 제약조건 삭제
BEGIN
    FOR C IN (SELECT * FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE "'||C.TABLE_NAME||'" CASCADE CONSTRAINTS');
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
---------------------------------------

CREATE TABLE "BOOK" (
	"BOOK_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"RES_NO"	NUMBER		NOT NULL,
	"BOOK_NAME"	VARCHAR2(20)		NOT NULL,
	"BOOK_PHONE"	VARCHAR2(20)		NOT NULL,
	"BOOK_DATE"	VARCHAR2(20)		NOT NULL,
	"BOOK_TIME"	VARCHAR2(10)		NOT NULL,
	"PEOPLE"	NUMBER		NOT NULL,
	"EMAIL"	VARCHAR2(50)		NULL,
	"REQUEST"	VARCHAR2(1000)		NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'B'	NULL CHECK(STATUS IN('B', 'C', 'D')),
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"BOOK_A"	DATE	DEFAULT SYSDATE	NULL
);

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

CREATE TABLE "QUESTION" (
	"Q_NO"	NUMBER		NOT NULL,
	"CATEGORY"	VARCHAR2(30)		NOT NULL,
	"Q_TITLE"	VARCHAR2(100)		NOT NULL,
	"Q_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"DELETE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"A_CONTENT"	VARCHAR2(4000)		NULL,
	"A_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'N'	NULL CHECK(STATUS IN('Y', 'N')),
	"Q_PERSON"	VARCHAR2(20)		NOT NULL,
	"Q_WHO"	VARCHAR2(1)		NOT NULL CHECK(Q_WHO IN('U', 'R')),
	"A_PERSON"	VARCHAR2(20)		NULL,
	"A_WHO"	VARCHAR2(1)		NULL CHECK(A_WHO IN('R', 'A'))
);

COMMENT ON COLUMN "QUESTION"."Q_NO" IS '문의번호(PK) SEQ_QNO';

COMMENT ON COLUMN "QUESTION"."CATEGORY" IS '카테고리명';

COMMENT ON COLUMN "QUESTION"."STATUS" IS '처리상태(Y/N)';

COMMENT ON COLUMN "QUESTION"."Q_WHO" IS '(회원 U / 업체 R)';

COMMENT ON COLUMN "QUESTION"."A_WHO" IS '(업체 R /관리자 A)';

CREATE TABLE "FAQ" (
	"FAQ_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"CATEGORY"	VARCHAR2(30)		NOT NULL,
	"FAQ_TITLE"	VARCHAR2(100)		NOT NULL,
	"FAQ_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE 	NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE 	NULL,
	"COUNT"	NUMBER	DEFAULT 0	NULL,
	"WHO"	VARCHAR2(1)		NOT NULL CHECK(WHO IN('U','R')),
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL CHECK(STATUS IN('Y', 'N'))
);

COMMENT ON COLUMN "FAQ"."FAQ_NO" IS 'FAQ번호(PK) SEQ_FAQNO';

COMMENT ON COLUMN "FAQ"."USER_NO" IS '작성자 회원번호(FK)';

COMMENT ON COLUMN "FAQ"."CATEGORY" IS '카테고리명';

COMMENT ON COLUMN "FAQ"."COUNT" IS '조회수';

COMMENT ON COLUMN "FAQ"."WHO" IS '구분(U회원/R업체)';

COMMENT ON COLUMN "FAQ"."STATUS" IS '(보이기 Y / 안보이기 N))';

CREATE TABLE "NOTICE" (
	"NOTICE_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"NOTICE_TITLE"	VARCHAR2(100)		NOT NULL,
	"NOTICE_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"COUNT"	NUMBER	DEFAULT 0	NULL,
	"TO_WHOM"	VARCHAR2(1)		NOT NULL CHECK(TO_WHOM IN('U', 'R')),
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL CHECK(STATUS IN('Y', 'N'))
);

COMMENT ON COLUMN "NOTICE"."NOTICE_NO" IS '공지사항번호(PK) SEQ_NONO';

COMMENT ON COLUMN "NOTICE"."USER_NO" IS '작성자 회원번호(FK)';

COMMENT ON COLUMN "NOTICE"."TO_WHOM" IS '구분(U회원/R업체)';

COMMENT ON COLUMN "NOTICE"."STATUS" IS '(보이기 Y / 안보이기 N))';

CREATE TABLE "RESTAURANT" (
	"RES_NO"	NUMBER		NOT NULL,
    "USER_PWD" VARCHAR2(30) NOT NULL,
	"RES_NAME"	VARCHAR2(50)		NOT NULL,
	"CEO"	VARCHAR2(20)		NOT NULL,
	"PERMIT_NO"	VARCHAR2(12)		NOT NULL,
	"ADDRESS"	VARCHAR2(200)		NOT NULL,
	"D_ADDRESS"	VARCHAR2(200)		NULL,
	"LOCAL_CT"	VARCHAR2(20)		NOT NULL,
	"DLOCAL_CT"	VARCHAR2(50)		NOT NULL,
	"PHONE"	VARCHAR2(20)		NOT NULL,
	"CELLPHONE"	VARCHAR2(13)		NOT NULL,
	"EMAIL"	VARCHAR2(50)		NOT NULL,
	"PARKING"	VARCHAR2(1)	DEFAULT 'Y'	NULL CHECK(PARKING IN('Y', 'N')),
	"APPLY_DATE"	DATE		NOT NULL,
	"ENROLL_DATE"	DATE		NULL,
	"MODIFY_DATE"	DATE		NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'W'	NULL CHECK(STATUS IN('W','N','C','Y','S')),
	"LONGTITUDE"	VARCHAR2(20)		NOT NULL,
	"LATITUDE"	VARCHAR2(20)		NOT NULL,
	"R_IMG"	VARCHAR2(50)		NULL,
	"OPEN"	VARCHAR2(10)		NULL,
	"CLOSE"	VARCHAR2(10)		NULL,
	"BREAK_S"	VARCHAR2(10)		NULL,
	"BREAK_E"	VARCHAR2(10)		NULL,
	"FOOD_CT"	VARCHAR2(20)		NOT NULL,
    "COUNT"	   NUMBER	DEFAULT 0	NULL
);

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

CREATE TABLE "MONTHLY" (
	"MON_NO"	NUMBER		NOT NULL,
	"RES_NO"	NUMBER		NOT NULL,
	"MONTHLY"	NUMBER		NOT NULL,
	"TOTAL"	NUMBER		NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'N'	NULL CHECK(STATUS IN('Y','N'))
);

COMMENT ON COLUMN "MONTHLY"."MON_NO" IS '정산번호 SEQ_MTNO';

COMMENT ON COLUMN "MONTHLY"."RES_NO" IS '업체번호';

COMMENT ON COLUMN "MONTHLY"."MONTHLY" IS '정산연월';

COMMENT ON COLUMN "MONTHLY"."TOTAL" IS '정산금';

COMMENT ON COLUMN "MONTHLY"."STATUS" IS '(완료 Y / 미완료 N)';

CREATE TABLE "NOT_ABLE" (
	"NOT_NO"	NUMBER		NOT NULL,
	"RES_NO"	NUMBER		NOT NULL,
	"NOT_DAY"	VARCHAR2(20)		NULL
);

COMMENT ON COLUMN "NOT_ABLE"."NOT_NO" IS '스케줄번호 SEQ_NANO';

COMMENT ON COLUMN "NOT_ABLE"."RES_NO" IS '업체번호';

COMMENT ON COLUMN "NOT_ABLE"."NOT_DAY" IS '날짜';

CREATE TABLE "ATTACHMENT" (
	"FILE_NO"	NUMBER		NOT NULL,
	"REF_BNO"	NUMBER		NULL,
	"ORIGIN_NAME"	VARCHAR2(50)		NOT NULL,
	"CHANGE_NAME"	VARCHAR2(50)		NOT NULL,
	"FILE_PATH"	VARCHAR2(50)		NOT NULL,
	"UPLOAD_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"FILE_LEVEL"	NUMBER		NULL,
    "STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL CHECK(STATUS IN('Y', 'N')),
	"BOARD_TYPE"	VARCHAR2(1)		NOT NULL CHECK(BOARD_TYPE IN('N','R','Q','B'))
);

COMMENT ON COLUMN "ATTACHMENT"."FILE_NO" IS '파일번호 SEQ_ATNO';

COMMENT ON COLUMN "ATTACHMENT"."REF_BNO" IS '게시글번호';

COMMENT ON COLUMN "ATTACHMENT"."ORIGIN_NAME" IS '원본파일명';

COMMENT ON COLUMN "ATTACHMENT"."CHANGE_NAME" IS '저장파일명';

COMMENT ON COLUMN "ATTACHMENT"."FILE_PATH" IS '파일경로';

COMMENT ON COLUMN "ATTACHMENT"."UPLOAD_DATE" IS '업로드시점';

COMMENT ON COLUMN "ATTACHMENT"."FILE_LEVEL" IS '순번';

COMMENT ON COLUMN "ATTACHMENT"."STATUS" IS '상태';

COMMENT ON COLUMN "ATTACHMENT"."BOARD_TYPE" IS '(공지사항 N / 리뷰 R / 1:1문의 Q / 메인배너 B)';

CREATE TABLE "MENU" (
	"MENU_NO"	NUMBER		NOT NULL,
	"RES_NO"	NUMBER		NOT NULL,
	"MENU_NAME"	VARCHAR2(50)		NOT NULL,
	"PRICE"	NUMBER		NOT NULL,
	"MENU_DES"	VARCHAR2(2000)		NULL,
	"M_IMG"	VARCHAR2(100)		NULL
);

COMMENT ON COLUMN "MENU"."MENU_NO" IS '메뉴번호 SEQ_MNO';

COMMENT ON COLUMN "MENU"."RES_NO" IS '업체번호';

COMMENT ON COLUMN "MENU"."MENU_NAME" IS '메뉴명';

COMMENT ON COLUMN "MENU"."PRICE" IS '금액';

COMMENT ON COLUMN "MENU"."MENU_DES" IS '메뉴설명';

COMMENT ON COLUMN "MENU"."M_IMG" IS '이미지경로';

CREATE TABLE "GOOD" (
	"RES_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"GOOD_DATE"	DATE		NOT NULL
);

COMMENT ON COLUMN "GOOD"."RES_NO" IS '업체번호';

COMMENT ON COLUMN "GOOD"."USER_NO" IS '회원번호(PK)';

CREATE TABLE "TB_USER" (
	"USER_NO"	NUMBER		NOT NULL,
	"USER_ID"	VARCHAR2(20)		NOT NULL UNIQUE,
	"USER_PWD"	VARCHAR2(20)		NOT NULL,
	"USER_NAME"	VARCHAR2(20)		NULL,
	"NICKNAME"	VARCHAR2(20)		NULL UNIQUE,
	"USER_EMAIL"	VARCHAR2(50)		NULL,
	"USER_PHONE"	VARCHAR2(20)		NULL,
	"GENDER"	VARCHAR2(1)	DEFAULT 'N'	NULL CHECK(GENDER IN('F','M','N')),
	"BIRTH"	VARCHAR2(40)		NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL CHECK(STATUS IN('Y','N','S','A'))
);

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

CREATE TABLE "REVIEW" (
	"REVIEW_NO"	NUMBER		NOT NULL,
	"RES_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"BOOK_NO"   NUMBER      NOT NULL,
	"REVIEW_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"STAR"	NUMBER		NOT NULL,
	"CREATE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MODIFY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL CHECK(STATUS IN('Y','N')),
	"GOOD"	VARCHAR2(1)	DEFAULT 'N'	NULL CHECK(GOOD IN('Y','N')),
	"COUNT"	NUMBER	DEFAULT 0	NULL
);

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

CREATE TABLE "BOOK_MENU" (
	"BM_NO"	NUMBER		NOT NULL,
	"BOOK_NO"	NUMBER		NOT NULL,
	"MENU_NO"	NUMBER		NOT NULL,
	"MENU_COUNT"	NUMBER		NOT NULL,
	"BM_PRICE"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOOK_MENU"."BM_NO" IS '주문번호 SEQ_BMNO';

COMMENT ON COLUMN "BOOK_MENU"."BOOK_NO" IS '예약번호';

COMMENT ON COLUMN "BOOK_MENU"."MENU_NO" IS '메뉴번호';

COMMENT ON COLUMN "BOOK_MENU"."MENU_COUNT" IS '수량';

COMMENT ON COLUMN "BOOK_MENU"."BM_PRICE" IS '주문금액';

CREATE TABLE "PAYMENT" (
	"PAY_NO"	NUMBER		NOT NULL,
	"BOOK_NO"	NUMBER		NOT NULL,
	"RES_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"PAY_POINT"	NUMBER		NULL,
	"PAY_TOTAL"	NUMBER		NOT NULL,
	"PAY_OP"	VARCHAR2(20)		NOT NULL,
	"PAY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'Y'	NULL CHECK(STATUS IN('Y','C'))
);

COMMENT ON COLUMN "PAYMENT"."PAY_NO" IS '결제번호 SEQ_PMNO';

COMMENT ON COLUMN "PAYMENT"."BOOK_NO" IS '예약번호';

COMMENT ON COLUMN "PAYMENT"."RES_NO" IS '업체번호';

COMMENT ON COLUMN "PAYMENT"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "PAYMENT"."PAY_POINT" IS '적립금 사용';

COMMENT ON COLUMN "PAYMENT"."PAY_TOTAL" IS '총 결제금액';

COMMENT ON COLUMN "PAYMENT"."PAY_OP" IS '결제방법';

COMMENT ON COLUMN "PAYMENT"."PAY_DATE" IS '결제/환불 시간';

COMMENT ON COLUMN "PAYMENT"."STATUS" IS 'Y결제/C취소';

CREATE TABLE "POINT" (
	"POINT_NO"	NUMBER		NOT NULL,
	"PAY_NO"	NUMBER		NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"RES_NO"	NUMBER		NULL,
	"POINT_NAME"	VARCHAR2(100)		NULL,
	"STATUS"	VARCHAR2(1)	DEFAULT 'B'	NULL CHECK(STATUS IN('B','C','U')),
	"POINT_TRADE"	NUMBER		NOT NULL,
	"POINT_NOW"	NUMBER	DEFAULT 0	NULL,
	"POINT_DATE"	DATE	DEFAULT SYSDATE	NULL
);

COMMENT ON COLUMN "POINT"."POINT_NO" IS '적립금 번호 SEQ_PNO';

COMMENT ON COLUMN "POINT"."PAY_NO" IS '결제번호';

COMMENT ON COLUMN "POINT"."USER_NO" IS '회원번호';

COMMENT ON COLUMN "POINT"."RES_NO" IS '업체번호';

COMMENT ON COLUMN "POINT"."POINT_NAME" IS '적립내용';

COMMENT ON COLUMN "POINT"."STATUS" IS '(B적립/C취소/U사용)';

COMMENT ON COLUMN "POINT"."POINT_TRADE" IS '적립/취소/사용 금액';

COMMENT ON COLUMN "POINT"."POINT_NOW" IS '현재적립금';

COMMENT ON COLUMN "POINT"."POINT_DATE" IS '발생날짜';

CREATE TABLE "SITE" (
	"SITE_NO"	NUMBER		NOT NULL,
	"SITE_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"WRITE_TYPE"	VARCHAR2(1)		NOT NULL CHECK(WRITE_TYPE IN('B','P','I','E'))
);

COMMENT ON COLUMN "SITE"."SITE_NO" IS '사이트번호 SEQ_SNO';
COMMENT ON COLUMN "SITE"."WRITE_TYPE" IS '(배너 B / 이용약관 P / 개인정보처리방침 I / 프로모션및이벤트수신 E)';

CREATE TABLE "BLACK" (
	"BLACK_NO"	NUMBER		NOT NULL,
	"B_PERSON"	NUMBER		NOT NULL,
	"T_PERSON"	NUMBER		NOT NULL,
	"BLACK_TITEL"	VARCHAR2(100)		NOT NULL,
	"BLACK_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"BLACK_TYPE"	VARCHAR2(2)		NOT NULL CHECK(BLACK_TYPE IN('RV', 'RR'))
);

COMMENT ON COLUMN "BLACK"."BLACK_NO" IS '신고번호 SEQ_BLNO';

COMMENT ON COLUMN "BLACK"."B_PERSON" IS '신고자';

COMMENT ON COLUMN "BLACK"."T_PERSON" IS '신고대상';

COMMENT ON COLUMN "BLACK"."BLACK_TITEL" IS '신고제목';

COMMENT ON COLUMN "BLACK"."BLACK_CONTENT" IS '신고내용';

COMMENT ON COLUMN "BLACK"."BLACK_TYPE" IS '(리뷰 RV / 업체 RR)';

ALTER TABLE "BOOK" ADD CONSTRAINT "PK_BOOK" PRIMARY KEY (
	"BOOK_NO"
);

ALTER TABLE "QUESTION" ADD CONSTRAINT "PK_QUESTION" PRIMARY KEY (
	"Q_NO"
);

ALTER TABLE "FAQ" ADD CONSTRAINT "PK_FAQ" PRIMARY KEY (
	"FAQ_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"NOTICE_NO"
);

ALTER TABLE "RESTAURANT" ADD CONSTRAINT "PK_RESTAURANT" PRIMARY KEY (
	"RES_NO"
);

ALTER TABLE "MONTHLY" ADD CONSTRAINT "PK_MONTHLY" PRIMARY KEY (
	"MON_NO"
);

ALTER TABLE "NOT_ABLE" ADD CONSTRAINT "PK_NOT_ABLE" PRIMARY KEY (
	"NOT_NO"
);

ALTER TABLE "ATTACHMENT" ADD CONSTRAINT "PK_ATTACHMENT" PRIMARY KEY (
	"FILE_NO"
);

ALTER TABLE "MENU" ADD CONSTRAINT "PK_MENU" PRIMARY KEY (
	"MENU_NO"
);

ALTER TABLE "TB_USER" ADD CONSTRAINT "PK_TB_USER" PRIMARY KEY (
	"USER_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY (
	"REVIEW_NO"
);

ALTER TABLE "BOOK_MENU" ADD CONSTRAINT "PK_BOOK_MENU" PRIMARY KEY (
	"BM_NO"
);

ALTER TABLE "PAYMENT" ADD CONSTRAINT "PK_PAYMENT" PRIMARY KEY (
	"PAY_NO"
);

ALTER TABLE "POINT" ADD CONSTRAINT "PK_POINT" PRIMARY KEY (
	"POINT_NO"
);

ALTER TABLE "SITE" ADD CONSTRAINT "PK_SITE" PRIMARY KEY (
	"SITE_NO"
);

ALTER TABLE "BLACK" ADD CONSTRAINT "PK_BLACK" PRIMARY KEY (
	"BLACK_NO"
);

ALTER TABLE "BOOK" ADD CONSTRAINT "FK_TB_USER_TO_BOOK_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_USER" (
	"USER_NO"
);

ALTER TABLE "BOOK" ADD CONSTRAINT "FK_RESTAURANT_TO_BOOK_1" FOREIGN KEY (
	"RES_NO"
)
REFERENCES "RESTAURANT" (
	"RES_NO"
);

ALTER TABLE "FAQ" ADD CONSTRAINT "FK_TB_USER_TO_FAQ_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_USER" (
	"USER_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_TB_USER_TO_NOTICE_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_USER" (
	"USER_NO"
);

ALTER TABLE "MONTHLY" ADD CONSTRAINT "FK_RESTAURANT_TO_MONTHLY_1" FOREIGN KEY (
	"RES_NO"
)
REFERENCES "RESTAURANT" (
	"RES_NO"
);

ALTER TABLE "NOT_ABLE" ADD CONSTRAINT "FK_RESTAURANT_TO_NOT_ABLE_1" FOREIGN KEY (
	"RES_NO"
)
REFERENCES "RESTAURANT" (
	"RES_NO"
);

ALTER TABLE "MENU" ADD CONSTRAINT "FK_RESTAURANT_TO_MENU_1" FOREIGN KEY (
	"RES_NO"
)
REFERENCES "RESTAURANT" (
	"RES_NO"
);

ALTER TABLE "GOOD" ADD CONSTRAINT "FK_RESTAURANT_TO_GOOD_1" FOREIGN KEY (
	"RES_NO"
)
REFERENCES "RESTAURANT" (
	"RES_NO"
);

ALTER TABLE "GOOD" ADD CONSTRAINT "FK_TB_USER_TO_GOOD_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_USER" (
	"USER_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_RESTAURANT_TO_REVIEW_1" FOREIGN KEY (
	"RES_NO"
)
REFERENCES "RESTAURANT" (
	"RES_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_BOOK_TO_REVIEW_1" FOREIGN KEY (
	"BOOK_NO"
)
REFERENCES "BOOK" (
	"BOOK_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_TB_USER_TO_REVIEW_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_USER" (
	"USER_NO"
);

ALTER TABLE "BOOK_MENU" ADD CONSTRAINT "FK_BOOK_TO_BOOK_MENU_1" FOREIGN KEY (
	"BOOK_NO"
)
REFERENCES "BOOK" (
	"BOOK_NO"
);

ALTER TABLE "BOOK_MENU" ADD CONSTRAINT "FK_MENU_TO_BOOK_MENU_1" FOREIGN KEY (
	"MENU_NO"
)
REFERENCES "MENU" (
	"MENU_NO"
);

ALTER TABLE "PAYMENT" ADD CONSTRAINT "FK_BOOK_TO_PAYMENT_1" FOREIGN KEY (
	"BOOK_NO"
)
REFERENCES "BOOK" (
	"BOOK_NO"
);

ALTER TABLE "PAYMENT" ADD CONSTRAINT "FK_RESTAURANT_TO_PAYMENT_1" FOREIGN KEY (
	"RES_NO"
)
REFERENCES "RESTAURANT" (
	"RES_NO"
);

ALTER TABLE "PAYMENT" ADD CONSTRAINT "FK_TB_USER_TO_PAYMENT_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_USER" (
	"USER_NO"
);

ALTER TABLE "POINT" ADD CONSTRAINT "FK_PAYMENT_TO_POINT_1" FOREIGN KEY (
	"PAY_NO"
)
REFERENCES "PAYMENT" (
	"PAY_NO"
);

ALTER TABLE "POINT" ADD CONSTRAINT "FK_TB_USER_TO_POINT_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "TB_USER" (
	"USER_NO"
);

ALTER TABLE "POINT" ADD CONSTRAINT "FK_RESTAURANT_TO_POINT_1" FOREIGN KEY (
	"RES_NO"
)
REFERENCES "RESTAURANT" (
	"RES_NO"
);

-- 유저 시퀀스
CREATE SEQUENCE SEQ_UNO START WITH 1 INCREMENT BY 1;
-- 업체 시퀀스
CREATE SEQUENCE SEQ_RESNO START WITH 1200 INCREMENT BY 1;
-- 리뷰 시퀀스
CREATE SEQUENCE SEQ_RVNO START WITH 1 INCREMENT BY 1;
-- 첨부파일 시퀀스
CREATE SEQUENCE SEQ_ATNO START WITH 1 INCREMENT BY 1;
-- 사이트 관리 시퀀스
CREATE SEQUENCE SEQ_SNO START WITH 1 INCREMENT BY 1;
-- 신고 시퀀스
CREATE SEQUENCE SEQ_BLNO START WITH 1 INCREMENT BY 1;
-- 공지사항 시퀀스
CREATE SEQUENCE SEQ_NONO START WITH 1 INCREMENT BY 1;
-- FAQ 시퀀스
CREATE SEQUENCE SEQ_FAQNO START WITH 1 INCREMENT BY 1;
-- 1대1 문의 시퀀스
CREATE SEQUENCE SEQ_QNO START WITH 1 INCREMENT BY 1;
-- 포인트 시퀀스
CREATE SEQUENCE SEQ_PNO START WITH 1 INCREMENT BY 1;
-- 결제 시퀀스
CREATE SEQUENCE SEQ_PMNO START WITH 1 INCREMENT BY 1;
-- 예약 시퀀스
CREATE SEQUENCE SEQ_BKNO START WITH 1 INCREMENT BY 1;
-- 예약 메뉴 시퀀스
CREATE SEQUENCE SEQ_BMNO START WITH 1 INCREMENT BY 1;
-- 정산 시퀀스
CREATE SEQUENCE SEQ_MTNO START WITH 1 INCREMENT BY 1;
-- 메뉴 시퀀스
CREATE SEQUENCE SEQ_MNO START WITH 1 INCREMENT BY 1;
-- 예약불가일 시퀀스
CREATE SEQUENCE SEQ_NANO START WITH 1 INCREMENT BY 1;

commit;