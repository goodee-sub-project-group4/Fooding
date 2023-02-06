테스터용 
-- TB_USER
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user01', '1111', '팜하니', '농장주인', 'farmer@naver.com', '01000001111', 'F', '20040101', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user02', '2222', '강해린', '아기고양이', 'kitty@naver.com', '01000002222', 'F', '20040102', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user03', '3333', '김민지', '핫세', 'minji33@naver.com', '01000003333', 'F', '20040103', SYSDATE, SYSDATE, 'Y');

COMMIT;

-- REVIEW
INSERT INTO REVIEW VALUES (SEQ_RVNO.NEXTVAL, SEQ_RESNO.CURRVAL, 1, 2, '너무 맛있어요 분위기도 넘 좋아요~!', 4.5, SYSDATE, SYSDATE, 'Y', 'N', DEFAULT);
INSERT INTO REVIEW VALUES (SEQ_RVNO.NEXTVAL, SEQ_RESNO.CURRVAL, 2, 1, '기분이 나쁘네요...', 2.5, SYSDATE, SYSDATE, 'Y', 'N', DEFAULT);
INSERT INTO REVIEW VALUES (SEQ_RVNO.NEXTVAL, SEQ_RESNO.CURRVAL, 3, 2, '넘 맛잇어요ㅋㅋ 담에 또 올게요', 5.0, SYSDATE, SYSDATE, 'Y', 'N', DEFAULT);
INSERT INTO REVIEW VALUES (SEQ_RVNO.NEXTVAL, SEQ_RESNO.CURRVAL, 2, 1, '메롱~!', 4.5, SYSDATE, SYSDATE, 'Y', 'N', DEFAULT);
INSERT INTO REVIEW VALUES (SEQ_RVNO.NEXTVAL, SEQ_RESNO.CURRVAL, 3, 2, '여기 다시 올거같아요', 4.0, SYSDATE, SYSDATE, 'Y', 'N', DEFAULT);

-- 다솜
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'admin01', '1111', '푸딩01', '', '', '', '', '', '', '', 'A');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'admin02', '2222', '푸딩02', '', '', '', '', '', '', '', 'A');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user01', '1111', '팜하니', '농장주인', 'farmer@naver.com', '01000001111', 'F', '20040101', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user02', '2222', '강해린', '아기고양이', 'kitty@naver.com', '01000002222', 'F', '20040102', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user03', '3333', '김민지', '핫세', 'minji33@naver.com', '01000003333', 'F', '20040103', SYSDATE, SYSDATE, 'Y');


COMMIT;
-- RESTAURANT
--일반업체 / 아이디 : 1200
INSERT INTO RESTAURANT VALUES
(SEQ_RESNO.NEXTVAL,'1234', '미미식당', '김미미',  '899-52-52007', '서울시 금천구 가산동', '대륭3차 11층', ' 서울', '금천구', '02-555-6666', '010-6666-7777', 'FOODY@EMAIL.COM', 'Y', SYSDATE, SYSDATE, SYSDATE, 'Y', '12345123', '12345123', null, '8:00', '21:00', '15:00', '16:00', 'japanese', 0);

commit;



-- 로그인
       SELECT 
			   USER_NO
			 , USER_ID
			 , USER_PWD
			 , USER_NAME
			 , NICKNAME
			 , USER_EMAIL
			 , USER_PHONE
			 , GENDER
			 , BIRTH
			 , ENROLL_DATE
			 , MODIFY_DATE
			 , STATUS
		  FROM TB_USER
		 WHERE USER_ID = 'user01'
		   AND USER_PWD = '1111'
		   AND STATUS = 'Y'|| 'A';

-- 회원가입
        INSERT 
		  INTO TB_USER
		     (
		       USER_NO
		     , USER_ID
		     , USER_PWD
			 , USER_NAME
			 , NICKNAME
			 , USER_EMAIL
			 , USER_PHONE
			 , GENDER
			 , BIRTH
		     )
		VALUES
		     (
		       SEQ_UNO.NEXTVAL
		     , ?
		     , ?
			 , ?
			 , ?
			 , ?
			 , ?
			 , ?
			 , ?
		     );
             
-- 아이디 중복체크
        SELECT
			   COUNT(*) "COUNT"
		  FROM TB_USER
		 WHERE USER_ID = ? 

-- 닉네임 중복체크
        SELECT
		       COUNT(*) "COUNT2"
		  FROM TB_USER
		 WHERE NICKNAME = ?

-- 회원 정보 수정
        UPDATE TB_USER
		   SET USER_PWD = '0101'
		     , USER_NAME = '팜하니'
		     , NICKNAME = '춤짱'
		     , USER_EMAIL = 'hanni01@naver.com'
		     , USER_PHONE = '01077770000'
		     , GENDER = 'N'
		     , BIRTH = '20041231'
		     , MODIFY_DATE = SYSDATE
		 WHERE USER_ID = 'user01'
		   AND USER_PWD = '1111';

-- 갱신된 회원 조회
        SELECT 
			   USER_NO
			 , USER_ID
			 , USER_PWD
			 , USER_NAME
			 , NICKNAME
			 , USER_EMAIL
			 , USER_PHONE
			 , GENDER
			 , BIRTH
			 , ENROLL_DATE
			 , MODIFY_DATE
			 , STATUS
		  FROM TB_USER
		 WHERE USER_ID = 'user01'
		   AND USER_PWD = '0101'
		   AND STATUS IN ('Y', 'A');

-- 리뷰리스트
        SELECT
		       REVIEW_NO
		     , RES_NAME -- RES_NO으로 JOIN
		     , REVIEW_CONTENT
		     , STAR
		     , CREATE_DATE
		  FROM REVIEW R
		  JOIN RESTAURANT USING (RES_NO)
		 WHERE R.STATUS = 'Y'
		 ORDER
            BY REVIEW_NO DESC;	
            
-- 리뷰리스트첨부파일까지
        SELECT
		       REVIEW_NO
		     , RES_NAME
		     , REVIEW_CONTENT
		     , STAR
		     , CREATE_DATE
		  FROM REVIEW V
		  JOIN BOOK B ON (V.BOOK_NO = B.BOOK_NO )
		  JOIN RESTAURANT R ON (B.RES_NO = R.RES_NO)
		  JOIN ATTACHMENT A ON (REVIEW_NO = REF_BNO)
		 WHERE V.STATUS = 'Y'
		   AND A.BOARD_TYPE = 'R'
		 ORDER
            BY REVIEW_NO DESC;
	
	<!-- 리뷰쓰기 -->
	
		INSERT
		  INTO REVIEW
		     (
		       REVIEW_NO
		     , RES_NO
		     , USER_NO
		     , REVIEW_CONTENT
		     , STAR
		     ) 
		VALUES 
		     (
		       SEQ_RVNO.NEXTVAL
		     , 1201
		     , 1
		     , '맛있다!'
		     , 4.5
		     );
	
	
	<!-- 사진첨부 -->
	<entry>
		INSERT
		  INTO ATTACHMENT
		     (
		       FILE_NO
		     , REF_BNO
		     , ORIGIN_NAME
		     , CHANGE_NAME
		     , FILE_PATH
		     , FILE_LEVEL
		     )
	    VALUES
	         (
	           SEQ_ATNO.NEXTVAL
	         , SEQ_RVNO.CURRVAL
	         , <!-- 첨부파일의원본명 -->
	         , <!-- 첨부파일의실제업로드명 -->
	         , <!-- 저장경로 -->
	         , <!-- 사진순번 -->
	         )
	</entry>





        SELECT
		       REVIEW_NO
		     , RES_NAME
		     , REVIEW_CONTENT
		     , STAR
		     , CREATE_DATE
		  FROM REVIEW V
		  JOIN BOOK B ON (V.BOOK_NO = B.BOOK_NO )
		  JOIN RESTAURANT R ON (B.RES_NO = R.RES_NO)
		  JOIN ATTACHMENT A ON (REVIEW_NO = REF_BNO)
		 WHERE V.STATUS = 'Y'
		   AND A.BOARD_TYPE = 'R'
		 ORDER
            BY REVIEW_NO DESC;

-- 왜한줄씩 안나오지 리스트
        SELECT
		       REVIEW_NO
		     , RES_NAME
		     , REVIEW_CONTENT
		     , STAR
		     , TO_CHAR(CREATE_DATE, 'YYYY/MM/DD') "CREATE_DATE"
		  FROM REVIEW V
		  JOIN BOOK B ON (V.BOOK_NO = B.BOOK_NO )
		  JOIN RESTAURANT R ON (B.RES_NO = R.RES_NO)
		 WHERE V.STATUS = 'Y'
		 ORDER
            BY REVIEW_NO DESC;
            
        
-- 적립금
		INSERT 
	      INTO POINT 
	    VALUES 
	  		 (
	           SEQ_PNO.NEXTVAL
	         , NULL
	         , 2
	         , NULL
			 , '회원가입축하' 
			 , 'B' 
			 , 1000 
			 ,(SELECT SUM(POINT_TRADE)
	     		 FROM POINT 
	     		WHERE USER_NO= 2) + 1000 
	     	, SYSDATE
	     	);





SELECT SUM(POINT_TRADE)
	     		 FROM POINT 
	     		WHERE USER_NO= 3;







