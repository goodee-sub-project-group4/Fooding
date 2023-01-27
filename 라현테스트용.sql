INSERT INTO RESTAURANT VALUES
(1,'1234', '미미식당', '김미미',  '899-52-52007', '서울시 금천구 가산동', '대륭3차 11층', ' 서울', '금천구', '02-555-6666', '010-6666-7777', 'FOODY@EMAIL.COM', 'Y', SYSDATE, SYSDATE, SYSDATE, 'Y', '456456', '454563', '이미지경로', '8:00', '18:00', '13:00', '14:00', 'japanese');
INSERT INTO RESTAURANT VALUES
(2,'1234', '첫로그인', '하이루',  '899-52-52007', '서울시 금천구 가산동', '대륭3차 11층', ' 서울', '금천구', '02-555-6666', '010-6666-7777', 'FOODY@EMAIL.COM', 'Y', SYSDATE, SYSDATE, SYSDATE, 'C', '456456', '454563', '이미지경로', '8:00', '18:00', '13:00', '14:00', 'bar');



UPDATE RESTAURANT SET STATUS='C' WHERE RES_NO=2;

COMMIT;