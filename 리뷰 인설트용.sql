INSERT INTO REVIEW(REVIEW_NO, RES_NO, USER_NO, REVIEW_TITLE, REVIEW_CONTENT, STAR, CREATE_DATE, STATUS, GOOD, COUNT)
            VALUES(SEQ_RVNO.NEXTVAL, 1, 1, '맛집!', '진짜 맛있다!', 5, SYSDATE, 'Y', 'Y', 0);

INSERT INTO REVIEW(REVIEW_NO, RES_NO, USER_NO, REVIEW_TITLE, REVIEW_CONTENT, STAR, CREATE_DATE, STATUS, GOOD, COUNT)
            VALUES(SEQ_RVNO.NEXTVAL, 1, 2, '아 이건 좀...', '진짜 별로!', 1, SYSDATE, 'Y', 'Y', 0);

INSERT INTO REVIEW(REVIEW_NO, RES_NO, USER_NO, REVIEW_TITLE, REVIEW_CONTENT, STAR, CREATE_DATE, STATUS, GOOD, COUNT)
            VALUES(SEQ_RVNO.NEXTVAL, 1, 3, '소소?', '그냥 저냥!', 3, SYSDATE, 'Y', 'Y', 0);

INSERT INTO REVIEW(REVIEW_NO, RES_NO, USER_NO, REVIEW_TITLE, REVIEW_CONTENT, STAR, CREATE_DATE, STATUS, GOOD, COUNT)
            VALUES(SEQ_RVNO.NEXTVAL, 1, 1, '맛있기만 하구만!', '이게 맛 없으면 맛알못', 4, SYSDATE, 'Y', 'Y', 0);

INSERT INTO REVIEW(REVIEW_NO, RES_NO, USER_NO, REVIEW_TITLE, REVIEW_CONTENT, STAR, CREATE_DATE, STATUS, GOOD, COUNT)
            VALUES(SEQ_RVNO.NEXTVAL, 1, 3, '종종 먹기 좋긴 한듯', '엄청 맛있진 않지만 가성비가 괜찮네', 4, SYSDATE, 'Y', 'Y', 0);
            
            
COMMIT;