--일반업체 / 아이디 : 1200
INSERT INTO RESTAURANT VALUES
(SEQ_RESNO.NEXTVAL,'1234', '미미식당', '김미미',  '899-52-52007', '서울시 금천구 가산동', '대륭3차 11층', ' 서울', '금천구', '02-555-6666', '010-6666-7777', 'FOODY@EMAIL.COM', 'Y', SYSDATE, SYSDATE, SYSDATE, 'Y', '12345123', '12345123', null, '8:00', '21:00', '15:00', '16:00', 'japanese',0);
--첫로그인 테스트용 업체 / 아이디 1201
INSERT INTO RESTAURANT VALUES
(SEQ_RESNO.NEXTVAL,'1234', '첫로그인', '하이루',  '899-52-52007', '서울시 금천구 가산동', '대륭3차 11층', ' 서울', '금천구', '02-555-6666', '010-6666-7777', 'FOODY@EMAIL.COM', 'Y', SYSDATE, SYSDATE, SYSDATE, 'C', null, null, null, '8:00', '19:00', null , null, 'bar',0);
--첫로그인 상태로 바꾸기
UPDATE RESTAURANT SET STATUS='C' WHERE RES_NO=1201;

--업체문의(빛나회원 추가후)
INSERT INTO QUESTION VALUES
(SEQ_QNO.NEXTVAL, '이용문의', '알러지가 있습니다', '오이알러지가 있어요. 오이가 들어간 메뉴를 알려주세요'
, SYSDATE, NULL, NULL, NULL, NULL, 'N', '1', 'U', 1201, 'R');
INSERT INTO QUESTION VALUES
(SEQ_QNO.NEXTVAL, '이용문의', '애견동반 가능한가요?', '애견동반이라는 얘기가 있어서 문의드려요'
, SYSDATE, NULL, NULL, NULL, NULL, 'N', '2', 'U', 1201, 'R');

DELETE FROM QUESTION WHERE Q_NO=1200;


--반드시 커밋후 테스트할것!!
COMMIT;
		SELECT
		       Q_NO
		     , CATEGORY
		     , Q_TITLE
		     , USER_ID
		     , Q.STATUS
		     , TO_CHAR(CREATE_DATE, 'YYYY/MM/DD') "CREATE_DATE"
		  FROM QUESTION Q
		  LEFT JOIN TB_USER ON (Q_PERSON=USER_NO)
		 ORDER
		    BY CREATE_DATE DESC	; 
ROLLBACK;
