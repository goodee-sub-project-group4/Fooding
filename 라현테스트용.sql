--일반업체
INSERT INTO RESTAURANT VALUES
(SEQ_RESNO.nextval,'1234', '미미식당', '김미미',  '899-52-52007', '서울시 금천구 가산동', '대륭3차 11층', ' 서울', '금천구', '02-555-6666', '010-6666-7777', 'FOODY@EMAIL.COM', 'Y', SYSDATE, SYSDATE, SYSDATE, 'Y', null, null, null, '8:00', '21:00', '15:00', '16:00', 'japanese');
--첫로그인 테스트용 업체
INSERT INTO RESTAURANT VALUES
(SEQ_RESNO.nextval,'1234', '첫로그인', '하이루',  '899-52-52007', '서울시 금천구 가산동', '대륭3차 11층', ' 서울', '금천구', '02-555-6666', '010-6666-7777', 'FOODY@EMAIL.COM', 'Y', SYSDATE, SYSDATE, SYSDATE, 'C', null, null, null, '8:00', '19:00', null , null, 'bar');


--첫로그인 상태로 바꾸기
UPDATE RESTAURANT SET STATUS='C' WHERE RES_NO=2;

--반드시 커밋후 테스트할것!!
COMMIT;


ROLLBACK;
