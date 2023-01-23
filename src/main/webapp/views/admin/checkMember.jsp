<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
       
    
    /* ↓↓↓ 컨텐츠용 스타일 */
    table td, table th {
        margin:auto;
        text-align: center;
        line-height: 25px;     
    }
    #ss {
        float: left;
    }
    #select{
        border: 1px solid gray;
        border-radius: 4px;
        width: 100px;
        height: 33px;
    }
    #search{
        border: 1px solid gray;
        border-radius: 4px;
        width: 150px;
        height: 33px;
        margin-left: 5px;
    }
    #sButton{
        border: 1px solid gray;
        /* background-color: ; */
        border-radius: 4px;
        width: 50px;
        height: 33px;
        margin-left: -6px;
    }
    
    #deleteMember{
        float: right;    
        font-size: 15px;
    }
    #giveMoney{
        float: right;
        font-size: 15px;
        margin-right: 5px;
    }

    #moneyModal-body{
        margin: auto;
    }

    #selectModal-body th{
        text-align: left;
        color: gray;
        font-weight: 500;
    }
    #selectModal-body td{
        padding-left: 60px;
        text-align: left;
    }

    #updateModal-body th{
        text-align: left;
        color: gray;
        font-weight: 500;
    }
    #updateModal-body td{
        padding-left: 60px;
        text-align: left;
    }

    
    
    
    
</style>
</head>
<body>
	<%@ include file="adminBasicFrame.jsp" %>
	
		
		<div id=content class="container">
            

			<!-- 컨텐츠 작성부 -->
			<br><br><br><br><br>
           
                <select id="select">
                    <option value="">최신 순</option>
                    <option value="">오래된 순</option>
                    <option value="">예약 순</option>
                    <option value="">리뷰 순</option>
                </select>
                <input type="text" id="search" placeholder="아이디 검색" name="keyword">
                <input type="submit" id="sButton" value="검색">
            
            
                <button type="button" class="btn btn-danger btn-sm" id="deleteMember" data-toggle="modal" data-target="#deleteModal">회원 탈퇴</button>
                <button type="button" class="btn btn-danger btn-sm" id="giveMoney" data-toggle="modal" data-target="#moneyModal">적립금 지급</button>
            <div></div>
            <br> 
			<table class="table table-hover">
				<thead>
					<tr>
						<th><input type="checkbox"></th>
						<th>번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>성별</th>
						<th>예약 횟수</th>
						<th>리뷰 횟수</th>
                        <th>상태</th>
						<th>이용내역</th>
					</tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td data-toggle="modal" data-target="#selectModal" style="cursor: pointer; color: rgb(221,45,45);">user01</td>
                        <td>박연진</td>
                        <td>010-1111-2222</td>
                        <td>여</td>
                        <td>5</td>
                        <td>3</td>
                        <td>정상</td>
                        <td><button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#selectUseModal">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>user01</td>
                        <td>박연진</td>
                        <td>010-1111-2222</td>
                        <td>여</td>
                        <td>5</td>
                        <td>3</td>
                        <td>정상</td>
                        <td><button type="button" class="btn btn-outline-danger">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>user01</td>
                        <td>박연진</td>
                        <td>010-1111-2222</td>
                        <td>여</td>
                        <td>5</td>
                        <td>3</td>
                        <td>정상</td>
                        <td><button type="button" class="btn btn-outline-danger">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>user01</td>
                        <td>박연진</td>
                        <td>010-1111-2222</td>
                        <td>여</td>
                        <td>5</td>
                        <td>3</td>
                        <td>정상</td>
                        <td><button type="button" class="btn btn-outline-danger">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>user01</td>
                        <td>박연진</td>
                        <td>010-1111-2222</td>
                        <td>여</td>
                        <td>5</td>
                        <td>3</td>
                        <td>정상</td>
                        <td><button type="button" class="btn btn-outline-danger">조회</button></td>                    
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>user01</td>
                        <td>박연진</td>
                        <td>010-1111-2222</td>
                        <td>여</td>
                        <td>5</td>
                        <td>3</td>
                        <td>정상</td>
                        <td><button type="button" class="btn btn-outline-danger">조회</button></td>                    
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>user01</td>
                        <td>박연진</td>
                        <td>010-1111-2222</td>
                        <td>여</td>
                        <td>5</td>
                        <td>3</td>
                        <td>정상</td>
                        <td><button type="button" class="btn btn-outline-danger">조회</button></td>                    
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>user01</td>
                        <td>박연진</td>
                        <td>010-1111-2222</td>
                        <td>여</td>
                        <td>5</td>
                        <td>3</td>
                        <td>정상</td>
                        <td><button type="button" class="btn btn-outline-danger">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>user01</td>
                        <td>박연진</td>
                        <td>010-1111-2222</td>
                        <td>여</td>
                        <td>5</td>
                        <td>3</td>
                        <td>정상</td>
                        <td><button type="button" class="btn btn-outline-danger">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>user01</td>
                        <td>박연진</td>
                        <td>010-1111-2222</td>
                        <td>여</td>
                        <td>5</td>
                        <td>3</td>
                        <td>정상</td>
                        <td><button type="button" class="btn btn-outline-danger">조회</button></td>
                    </tr>
                </tbody>	
			</table>


            <!-- 적립금 지급 모달 -->
            <div class="modal" id="moneyModal">
                <div class="modal-dialog" >
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header" style="margin-top: 20px;">
                        <h3 class="moneyModal-title" style="margin: auto;">적립금 지급</h3>   
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body"  align="center">
                        <table id="moneyModal-body">
                            <tr style="height: 40px;">
                                <th>적립금명</th>
                                <td><input type="text" name="" style="width: 300px; margin-left: 30px;" required></td>
                            </tr>
                            <tr style="height: 40px;">
                                <th>발송회원</th>
                                <td>
                                    <input type="radio" id="allMember" name="member" value="" style="width: 30px; margin-left: 30px;" checked>
                                    <label for="allMember">전체 회원</label>
                                    <input type="radio" id="selectMember" name="member" value="" style="width: 30px; margin-left: 30px;">
                                    <label for="selectMember">선택 회원</label> <br>
                                </td>
                            </tr> 
                            <tr style="height: 40px;">
                                <th>적립금액</th>
                                <td><input type="number" required style="width: 300px; margin-left: 30px;"></td>
                            </tr>
                        </table>
                        <br>
                        <button type="submit" class="btn btn-danger" style="width: 150px;">확인</button>
                        <button type="button" class="btn btn-outline-danger" data-dismiss="modal" style="width: 150px;">취소</button>
                        
                    </div>
                     
                </div>
                </div>
            </div>

            <!-- 회원 탈퇴 모달 -->
            <div class="modal" id="deleteModal">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
              
                        <!-- Modal Header -->
                        <div class="modal-header" style="margin-top: 20px;">
                            <b class="modal-title" style="margin: auto;">정말로 회원 탈퇴하시겠습니까?</b>
                        </div>
                
                        <!-- Modal body -->
                        <div class="modal-body" align="center">
                        
                            <form action="" method="post">
                                <input type="hidden" name="" value=>
                                
                                <input type="password" name="" placeholder="비밀번호를 입력해주세요" style="width: 250px; height: 40px;" required> 
                                <br><br>

                                <button type="submit" class="btn btn-danger" style="width: 100px;">탈퇴하기</button>
                                <button type="button" class="btn btn-outline-danger" data-dismiss="modal" style="width: 100px;">취소</button>
                            </form>

                        </div>          
                    </div>
                </div>
            </div>


            <!-- 회원 조회 모달 -->
            <div class="modal" id="selectModal">
                <div class="modal-dialog" >
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header" style="margin-top: 20px;">
                        <h3 class="modal-title" style="margin: auto;">회원 조회</h3>   
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body" align="center">
                        <table id="selectModal-body">
                            <tr style="height: 40px;">
                                <th>회원번호</th>
                                <td>01</td>
                            </tr>
                            <tr style="height: 40px;">
                                <th>아이디</th>
                                <td>user01</td>
                            </tr>
                            <tr style="height: 40px;">
                                <th>이름</th>
                                <td>박연진</td>
                            </tr>       
                            <tr style="height: 40px;">
                                <th>닉네임</th>
                                <td>연진아</td>
                            </tr>
                            <tr style="height: 40px;">
                                <th>전화번호</th>
                                <td>010-1111-2222</td>
                            </tr>
                            <tr style="height: 40px;">
                                <th>이메일</th>
                                <td>user01@naver.com</td>
                            </tr>
                            <tr style="height: 40px;">
                                <th>생년월일</th>
                                <td>1999.01.01</td>
                            </tr>
                            <tr style="height: 40px;">
                                <th>성별</th>
                                <td>
                                    <input type="radio" id="noSelect" name="gender" value="" checked>
                                    <label for="noSelect">선택안함</label>
                                    <input type="radio" id="M" name="gender" value="" style="width: 20px;">
                                    <label for="M">남</label>
                                    <input type="radio" id="F" name="gender" value="" style="width: 20px;">
                                    <label for="F">여</label> <br>
                                </td>
                            </tr> 
                            <tr style="height: 40px;">
                                <th>가입일</th>
                                <td>2023.01.01</td>
                            </tr>
                            <tr style="height: 40px;">
                                <th>적립금</th>
                                <td>2000</td>
                            </tr>
                            <tr style="height: 40px;">
                                <th>상태</th>
                                <td>정상</td>
                            </tr>
                        </table>
                        <br>
                        <button type="submit" class="btn btn-danger" style="width: 150px;" data-toggle="modal" data-target="#updateModal">수정</button>
                        <button type="button" class="btn btn-outline-danger" data-dismiss="modal" style="width: 150px;">닫기</button>
                        
                    </div>
            
                    
            
                </div>
                </div>
            </div>


            <!-- 회원 수정 모달 -->
            <div class="modal" id="updateModal">
                <div class="modal-dialog" >
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header" style="margin-top: 20px;">
                        <h3 class="updateModal-title" style="margin: auto;">회원 조회</h3>   
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body" align="center">
                        <table id="updateModal-body">
                            <tr style="height: 40px;">
                                <th>회원번호</th>
                                <td>01</td>
                            </tr>
                            <tr style="height: 40px;">
                                <th>아이디</th>
                                <td>user01</td>
                            </tr>
                            <tr style="height: 40px;">
                                <th>이름</th>
                                <td><input type="text" placeholder="박연진"></td>
                            </tr>
                            <tr style="height: 40px;">
                                <th>닉네임</th>
                                <td><input type="text" placeholder="연진아"></td>
                            </tr>
                            <tr style="height: 40px;">
                                <th>전화번호</th>
                                <td><input type="text" placeholder="010-1111-2222"></td>
                            </tr>
                            <tr style="height: 40px;">
                                <th>이메일</th>
                                <td><input type="text" placeholder="user01@naver.com"></td>
                            </tr>
                            <tr style="height: 40px;">
                                <th>생년월일</th>
                                <td>1999.01.01</td>
                            </tr>
                            <tr style="height: 40px;">
                                <th>성별</th>
                                <td>
                                    <input type="radio" id="noSelect" name="gender" value="" checked>
                                    <label for="noSelect">선택안함</label>
                                    <input type="radio" id="M" name="gender" value="" style="width: 20px;">
                                    <label for="M">남</label>
                                    <input type="radio" id="F" name="gender" value="" style="width: 20px;">
                                    <label for="F">여</label> <br>
                                </td>
                            </tr> 
                            <tr style="height: 40px;">
                                <th>가입일</th>
                                <td>2023.01.01</td>
                            </tr>
                            <tr style="height: 40px;">
                                <th>적립금</th>
                                <td><input type="text" placeholder="2000"></td>
                            </tr>
                            <tr style="height: 40px;">
                                <th>상태</th>
                                <td>
                                    <select name="" id="" style="height: 30px;">
                                        <option value="">정상</option>
                                        <option value="">탈퇴</option>
                                        <option value="">이용정지</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <br>
                        <button type="submit" class="btn btn-danger" style="width: 150px;" data-toggle="modal" data-target="#updateConfirmModal1">수정완료</button>
                        <button type="button" class="btn btn-outline-danger" data-dismiss="modal" style="width: 150px;">닫기</button>
                        
                    </div>
            
                    
            
                </div>
                </div>
            </div>

            <!-- 회원 수정 완료 모달 -->
            <div class="modal" id="updateConfirmModal1">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
              
                        <!-- Modal Header -->
                        <div class="modal-header" style="margin-top: 20px;">
                            <b class="modal-title" style="margin: auto;">정말로 회원 수정하시겠습니까?</b>
                        </div>
                
                        <!-- Modal body -->
                        <div class="modal-body" align="center">
                        
                            <form action="" method="post">
                                <input type="hidden" name="" value=>
                                
                                <input type="password" name="" placeholder="비밀번호를 입력해주세요" style="width: 250px; height: 40px;" required> 
                                <br><br>

                                <button type="submit" class="btn btn-danger" style="width: 100px;" data-toggle="modal" data-target="#updateConfirmModal2">수정하기</button>
                                <button type="button" class="btn btn-outline-danger" data-dismiss="modal" style="width: 100px;">취소</button>
                            </form>

                        </div>          
                    </div>
                </div>
            </div>

            <!-- 회원 수정 찐완료 모달 -->
            <!-- 회원 수정 완료 모달 -->
            <div class="modal" id="updateConfirmModal2">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content">
              
                        <!-- Modal Header -->
                        <div class="modal-header" style="margin-top: 20px;">
                            <b class="modal-title" style="margin: auto;">회원 수정 완료</b>
                        </div>
                
                        <!-- Modal body -->
                        <div class="modal-body" align="center">
                        
                            <form action="" method="post">
                                
                                <button type="button" class="btn btn-outline-danger" data-dismiss="modal" style="width: 100px;">확인</button>
                            </form>

                        </div>          
                    </div>
                </div>
            </div>

            <!-- 이용 내역 조회 모달 -->
            <div class="modal" id="selectUseModal">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                
                        <!-- Modal Header -->
                        <div class="modal-header" style="margin-top: 20px;">
                            <h4 class="modal-title">이용내역</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                
                        <!-- Modal body -->
                        <div class="selectUseModal-body">
                        <div>
                            회원 번호
                            아이디
                        </div>
                        
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>예약날짜</th>
                                    <th>업체명</th>
                                    <th>시간</th>
                                    <th>인원</th>
                                    <th>결제금액</th>
                                    <th>적립금사용</th>
                                    <th>최종결제금액</th>
                                    <th>적립</th>
                                    <th>결제수단</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>2023.01.03</td>
                                    <td>재준이가게</td>
                                    <td>오후 12:30</td>
                                    <td>2</td>
                                    <td>40,000</td>
                                    <td>-2,000</td>
                                    <td>38,000</td>
                                    <td>+400</td>
                                    <td>카드</td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td>2023.01.03</td>
                                    <td>재준이가게</td>
                                    <td>오후 12:30</td>
                                    <td>2</td>
                                    <td>40,000</td>
                                    <td>-2,000</td>
                                    <td>38,000</td>
                                    <td>+400</td>
                                    <td>카드</td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td>2023.01.03</td>
                                    <td>재준이가게</td>
                                    <td>오후 12:30</td>
                                    <td>2</td>
                                    <td>40,000</td>
                                    <td>-2,000</td>
                                    <td>38,000</td>
                                    <td>+400</td>
                                    <td>카드</td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td>2023.01.03</td>
                                    <td>재준이가게</td>
                                    <td>오후 12:30</td>
                                    <td>2</td>
                                    <td>40,000</td>
                                    <td>-2,000</td>
                                    <td>38,000</td>
                                    <td>+400</td>
                                    <td>카드</td>
                                </tr>
                            </tbody>
                            <tbody>
                                <tr>
                                    <td>2023.01.03</td>
                                    <td>재준이가게</td>
                                    <td>오후 12:30</td>
                                    <td>2</td>
                                    <td>40,000</td>
                                    <td>-2,000</td>
                                    <td>38,000</td>
                                    <td>+400</td>
                                    <td>카드</td>
                                </tr>
                            </tbody>


                        </table>
                            


                        </div>
                
                        <!-- Modal footer -->
                        <div class="selectUseModal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>
                
                    </div>
                </div>
            </div>



            <hr>
            <hr>
            <hr>
            <hr>
            <hr>
            <hr>
            <hr>
            <hr>
			
		</div>
		
	
	<script>
		$(function(){
			$('#title').text("회원조회");
			$('#menu1').click();
		})

        /*
        $(function(){
            $("#giveMoney").click(function(){
                
            })
        })

        $(function(){
            $("#unregister").click(function(){
                
            })
        })
        */

	</script>
</body>
</html>