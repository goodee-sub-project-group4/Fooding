테스터용 USER
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user01', '1111', '팜하니', '농장주인', 'farmer@naver.com', '01000001111', 'F', '20040101', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user02', '2222', '강해린', '아기고양이', 'kitty@naver.com', '01000002222', 'F', '20040102', SYSDATE, SYSDATE, 'Y');
INSERT INTO TB_USER VALUES (SEQ_UNO.NEXTVAL, 'user03', '3333', '김민지', '핫세', 'minji33@naver.com', '01000003333', 'F', '20040103', SYSDATE, SYSDATE, 'Y');

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






















