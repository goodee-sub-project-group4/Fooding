SELECT B.BOOK_NO
		     , B.USER_NO
		     , B.RES_NO
		     , RES_NAME
		     , BOOK_NAME
		     , BOOK_PHONE
		     , BOOK_DATE
		     , BOOK_TIME
		     , PEOPLE
		     , B.EMAIL
		     , REQUEST
		     , B.STATUS
		     , B.MODIFY_DATE
		     , BOOK_A
             , PAY_TOTAL
             , PAY_POINT
             , PAY_OP
             , R_IMG
		  FROM BOOK B
		  JOIN RESTAURANT R ON (B.RES_NO = R.RES_NO)
          JOIN PAYMENT P ON (B.BOOK_NO = P.BOOK_NO)
		 WHERE B.USER_NO = 1
		   AND B.STATUS IN ('B', 'D')