<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.fd.member.model.vo.Member"%>
<%
	ArrayList<Member> list = (ArrayList)request.getAttribute("list");
	Member m = (Member)request.getAttribute("m");
	ArrayList<Member> useList = (ArrayList)request.getAttribute("useList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 4버전 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
       
    #outer2 {
        width:1200px;
        height: 800px;
        position: relative;
        margin:auto;
    }			
    
    #content {
        width:950px;
        display: inline-block;
        box-sizing: border-box;
        position:absolute;
        right:10px;
        /* margin-top: -60px; 내려가있어서 위로 올려줌 */
    }
    #menubar {
        width: 220px;
        height: 100%;
        z-index: 1000;
        position: absolute;
    }

    /* ↓↓↓ 컨텐츠용 스타일 */
    form{
        margin: 30px;;
    }

    table td, table th {
        margin:auto;
        text-align: center;
        line-height: 25px;     
    }
    
    /*최신 순 옵션*/
    #select{
        border: 1px solid gray;
        border-radius: 4px;
        width: 100px;
        height: 33px;
    }
    /*아이디 검색 입력창*/
    #search{
        border: 1px solid gray;
        border-radius: 4px;
        width: 150px;
        height: 33px;
        margin-left: 5px;
    }
    /*검색 버튼*/
    #sButton{
        border: 1px solid gray;
        /* background-color: ; */
        border-radius: 4px;
        width: 50px;
        height: 33px;
        margin-left: -6px;
    }
    /*회원탈퇴 버튼*/
    #deleteMember{
        float: right;    
        font-size: 15px;
    }
    /*적립금 지급 버튼*/
    #giveMoney{
        float: right;
        font-size: 15px;
        margin-right: 5px;
    }

    /*상태 셀렉트*/
    #selectStatus{
        border: 1px solid white;
        font-weight: 600;
        margin-left: -20px;
        margin-right: -20px;
    }

    /*아이디 커서*/
    #userIdcursor:hover{
        cursor: pointer;
        color: rgb(221,45,45);
    }

    /*체크 버튼*/
    input{
        accent-color: rgb(221,45,45);
    } 

    /*적립급 지급 모달*/
    #moneyModal-body{
        margin: auto;
    }

    /*회원 조회 모달*/
    #selectModal-body tr{
        height: 40px;
    }
    #selectModal-body th{
        padding-left: 30px;
        text-align: left;
        color: gray;
        font-weight: 500;
        width: 100px;
    }
    #selectModal-body td{
        padding-left: 40px;
        text-align: left;
        width: 250px;
    }

    /*회원 수정 모달*/
    #updateModal-body tr{
        height: 40px;
    }
    #updateModal-body th{
        padding-left: 30px;
        text-align: left;
        color: gray;
        font-weight: 500;
        width: 100px;
    }
    #updateModal-body td{
        padding-left: 40px;
        text-align: left;
        width: 250px;
    }

    /*이용내역 조회 모달*/
    .selectUseModal-body{
        padding: 50px;
    }

    /*페이징바*/
    .pagination a{
        color:rgb(221,45,45)
    }

</style>
</head>
<body>
	<%@ include file="adminHead.jsp" %>
	<div id="outer2">
		<div id="menubar">
			<%@ include file="adminMenubar.jsp" %>
		</div>
		<div id="content" class="container">

			<!-- 컨텐츠 작성부 -->
			
            <br><br>
            <form action="">
                <!--표 위에 버튼-->
                <select id="select">
                    <option value="">최신 순</option>
                    <option value="">오래된 순</option>
                    <option value="">예약 순</option>
                    <option value="">리뷰 순</option>
                </select>
                <input type="text" id="search" placeholder="아이디 검색" name="keyword"> <!--data-toggle="modal" data-target="#moneyModal"-->
                <input type="submit" id="sButton" value="검색">
            
            
                <button type="button" class="btn btn-danger btn-sm" id="deleteMember" data-toggle="modal" data-target="#deleteModal">회원 탈퇴</button>
                <button type="button" class="btn btn-danger btn-sm" id="giveMoney" onclick="clickPoint()">적립금 지급</button>
                <div></div>
                <br> 

                <!--회원조회 표-->
                <table class="table">
                    <thead>
                        <tr>
                            <th><input type="checkbox"></th>
                            <th>번호</th>
                            <th>아이디</th>
                            <th>이름</th>
                            <th>성별</th>
                            <th>예약</th>
                            <th>리뷰</th>
                            <th>신고</th>
                            <th>
                                <select id="selectStatus">
                                    <option value="">상태</option>
                                    <option value="Y">정상</option>
                                    <option value="S">이용정지</option>
                                    <option value="N">탈퇴</option>
                                </select>
                            </th>
                            <th>수정</th>
                            <th>이용</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<% for(int i=0; i<list.size(); i++) { %>
                        <tr>                     
                            <td><input type="checkbox" name="listCheck" value="<%= list.get(i).getUserNo() %>"></td>
                            <td><%= list.get(i).getUserNo() %> </td>
                            <td id="userIdcursor" data-toggle="modal" data-target="#selectModal" onclick="viewDetail(<%=list.get(i).getUserNo()%>)"><%= list.get(i).getUserId() %></td>
                            <td><%= list.get(i).getUserName() %></td>
                            <td><%= (list.get(i).getGender().equals("M")) ? "남" : (list.get(i).getGender().equals("F")) ? "여" : "-" %></td>
                            <td><%= Integer.parseInt(list.get(i).getBookCount()) %></td>
                            <td><%= Integer.parseInt(list.get(i).getReviewCount()) %></td>
                            <td><%= Integer.parseInt(list.get(i).getBlackCount()) %></td>
                            <td><%= (list.get(i).getStatus().equals("Y")) ? "정상" : (list.get(i).getStatus().equals("S")) ? "이용정지" : "탈퇴" %></td>
                            <td><button type="button" class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#updateModal" name="modifiyClick" value="<%=list.get(i).getUserNo()%>" onclick="updateDetail(<%=list.get(i).getUserNo()%>)" >수정</button></td>
                            <!-- <td><input type="button" class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#updateModal" name="modifiyClick" value="<%=list.get(i).getUserNo()%>" onclick="updateDetail(<%=list.get(i).getUserNo()%>)"></td> -->
                            <td><button type="button" class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#selectUseModal" onclick="useDetail(<%=list.get(i).getUserNo()%>)" >조회</button></td>             
                        </tr>
                        <% } %>
              
                    </tbody>	
                </table>
                
                <!--이용현황-->
                <div style="float: right; color: rgb(141, 141, 141); padding: 10px;">
                    정상 : &nbsp <span>n</span> 명 &nbsp&nbsp&nbsp 이용정지 : &nbsp <span>n</span> 명 &nbsp&nbsp&nbsp 탈퇴 : &nbsp <span>n</span> 명
                </div>
                
                <br><br>
                <!--페이징바-->
                <ul class="pagination justify-content-center" style="margin:20px 0">
                    <li class="page-item disabled"><a class="page-link" href="#"><</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">></a></li>
                </ul> 
                <br><br><br>
            </form>



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
                        <button type="submit" class="btn btn-danger" style="width: 150px;" onclick=givePoint()>확인</button>
                        <button type="button" class="btn btn-outline-danger" data-dismiss="modal" style="width: 150px;">취소</button>
                        <br><br>
                    </div>
                     
                </div>
                </div>
            </div>

            <!-- 회원 탈퇴 모달 -->
            <div class="modal" id="deleteModal">
                <div class="modal-dialog">
                    <div class="modal-content">
              
                        <!-- Modal Header -->
                        <div class="modal-header" style="margin-top: 20px;">
                            <h4 class="modal-title" style="margin: auto; color: rgb(75, 75, 75);">정말로 회원 탈퇴하시겠습니까?</h4>
                        </div>
                
                        <!-- Modal body -->
                        <div class="modal-body" align="center">
                        
                            <form action="" method="post">
                                <input type="hidden" name="" value=>
                                
                                <input type="password" name="" placeholder="비밀번호를 입력해주세요" style="width: 300px; height: 50px;" required> 
                                <br><br>

                                <button type="submit" class="btn btn-danger" style="width: 100px;">탈퇴하기</button>&nbsp;&nbsp;
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
                            <tr>
                                <th>회원번호</th>
                                <td id="userNo"></td>
                            </tr>
                            <tr>
                                <th>아이디</th>
                                <td id="userId"></td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td id="userName"></td>
                            </tr>       
                            <tr>
                                <th>닉네임</th>
                                <td id="nickname"></td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td id="userPhone"></td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td id="userEmail"></td>
                            </tr>
                            <tr>
                                <th>생년월일</th>
                                <td id="birth"></td>
                            </tr>
                            <tr>
                                <th>성별</th>
                                <td id="gender"></td>
                            </tr> 
                            <tr>
                                <th>가입일</th>
                                <td id="enrollDate"></td>
                            </tr>
                            <tr>
                                <th>적립금</th>
                                <td id="pointNow"></td>
                            </tr>
                            <tr>
                                <th>상태</th>
                                <td id="status"></td>
                            </tr>
                        </table>
                        <br>
                        <button type="button" class="btn btn-danger" data-dismiss="modal" style="width: 150px;">닫기</button>
                        <br><br>
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
                        <h3 class="modal-title" style="margin: auto;">회원 수정</h3>   
                    </div>
                    
                    <form action="<%=contextPath%>/updateMember.ad">
                    <!-- Modal body -->
                    <div class="modal-body" align="center">
                        <table id="updateModal-body">
                            <tr>
                                <th>회원번호</th>
                                <td id="userNoU" name="userNo"></td>
                            </tr>
                            <tr>
                                <th>아이디</th>
                                <td id="userIdU"></td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td><input id="userNameU" name="userName" type="text" value="" placeholder=""></td>
                            </tr>
                            <tr>
                                <th>닉네임</th>
                                <td><input id="nicknameU" name="nickname" type="text" value="" placeholder=""></td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td><input id="userPhoneU" name="userPhone" type="text" value="" placeholder=""></td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td><input id="userEmailU" name="userEmail" type="text" value="" placeholder=""></td>
                            </tr>
                            <tr>
                                <th>생년월일</th>
                                <td id="birthU"></td>
                            </tr>
                            <tr>
                                <th>성별</th>
                                <td id="genderU">
                                    <input type="radio" id="noSelect" name="gender" value="N">
                                    <label for="noSelect">선택안함</label>
                                    <input type="radio" id="genderM" name="gender" value="M" style="width: 20px;">
                                    <label for="genderM">남</label>
                                    <input type="radio" id="genderF" name="gender" value="F" style="width: 20px;">
                                    <label for="genderF">여</label> <br>
                                </td>
                            </tr> 
                            <tr>
                                <th>가입일</th>
                                <td id="enrollDateU">2023.01.01</td>
                            </tr>
                            <tr>
                                <th>적립금</th>
                                <td id="pointNowU"></td>
                            </tr>
                            <tr>
                                <th>상태</th>
                                <td>
                                    <select id="statusU" name="status" style="height: 30px;">
                                        <option value="Y">정상</option>
                                        <option value="N">탈퇴</option>
                                        <option value="S">이용정지</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <br>
                        <button type="submit" class="btn btn-danger" style="width: 150px;" data-toggle="modal" >수정완료</button> <!--id="updateMember" data-target="#updateConfirmModal1"-->
                        <button type="button" class="btn btn-outline-danger" data-dismiss="modal" style="width: 150px;">닫기</button>
                        <br><br>
                    </div>
                    </form>
            
                </div>
                </div>
            </div>
            

            <!-- 회원 수정 완료 모달 -->
            <div class="modal" id="updateConfirmModal1">
                <div class="modal-dialog">
                    <div class="modal-content">
              
                        <!-- Modal Header -->
                        <div class="modal-header" style="margin-top: 20px;">
                            <h4 class="modal-title" style="margin: auto; color: rgb(75, 75, 75);">정말로 회원 수정하시겠습니까?</h4>
                        </div>
                
                        <!-- Modal body -->
                        <div class="modal-body" align="center">
                        
                            <form action="" method="post">
                                <input type="hidden" name="" value=>
                                
                                <input type="password" name="" placeholder="비밀번호를 입력해주세요" style="width: 300px; height: 50px;" required> 
                                <br><br>

                                <button type="submit" class="btn btn-danger" style="width: 100px;">수정완료</button>&nbsp;&nbsp;
                                <button type="button" class="btn btn-outline-danger" data-dismiss="modal" style="width: 100px;">취소</button>
                                
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
                            <h4 class="modal-title" style="margin-left: 500px;">이용내역</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                
                        <!-- Modal body -->

                        <div class="selectUseModal-body">
                            <div align="center" style="font-size:20px;">
                                <span style="color: gray;" id="userNoB">회원 번호&nbsp;&nbsp;</span> &nbsp;&nbsp;&nbsp;&nbsp;
                                <span style="color: gray;" id="userIdB">아이디&nbsp;&nbsp;</span> 
                            </div>
                            <br>
                            <p>예약/결제 내역</p>
                            <table class="table" id="useTable">
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

	                                    </tr>
	                                    
                                </tbody>
                                

                            </table>
                            <br>
                            <!--페이징-->
                            <ul class="pagination justify-content-center" style="margin:20px 0">
                                <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">4</a></li>
                                <li class="page-item"><a class="page-link" href="#">5</a></li>
                                <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                            </ul> 
                            <div align="center">
                                <button type="button" class="btn btn-danger" data-dismiss="modal" style="width: 100px;">닫기</button>
                            </div>

                        </div>
                
                        
                
                    </div>
                </div>
            </div>


		</div>
		
	
	<script>

        $(function(){
			$('#title').text("회원 조회");
			$("#menu1").addClass("active");

            $("td").addClass("align-middle");

		})

        // 회원 상세 조회
        // function viewDetail(userNo) {
		// 	$.ajax({
		// 		url:"<%=contextPath%>/selectMember.ad",
		// 		data:{userNo:userNo},
		// 		success: function(m){
		// 			$('#userNo').text(m.userNo);
        //             $('#userNo').val(m.userNo);
		// 			$('#userId').text(m.userId);
        //             $('#userName').text(m.userName);
        //             $('#nickname').text(m.nickname);
        //             $('#userPhone').text(m.userPhone);
        //             $('#userEmail').text(m.userEmail);
        //             $('#birth').text(m.birth);
        //             if(m.gender=="M"){
        //                 $('#gender').text("남")
        //             }else if(m.gender=="F"){
        //                 $('#gender').text("여")
        //             }else{
        //                 $('#gender').text("-")
        //             };
        //             $('#enrollDate').text(m.enrollDate);
        //             $('#pointNow').text(m.pointNow);
        //             if(m.status=="Y"){
        //                 $('#status').text("정상")
        //             }else if(m.status=="S"){
        //                 $('#status').text("이용정지")
        //             }else if(m.status=="N"){
        //                 $('#status').text("탈퇴")
        //             };
					
		// 		}, error: function(){
		// 			console.log("회원상세조회 ajax 통신실패")
		// 		}, complete: function(){
		// 			console.log("회원상세조회 ajax 통신완료")
        //             console.log($('#userNo').val())
		// 		}
		// 	})
		// }

        // 회원 상제 수정 (아직 안함)
        function updateDetail(userNo){
            $.ajax({
                url:"<%=contextPath%>/selectMember.ad",
				data:{userNo:userNo},
				success: function(m){
					$('#userNoU').val(m.userNo);
                    $('#userNoU').text(m.userNo);
					$('#userIdU').text(m.userId);
                    $('#userNameU').attr("placeholder", m.userName);
                    $('#nicknameU').attr("placeholder", m.nickname);
                    $('#userPhoneU').attr("placeholder", m.userPhone);
                    $('#userEmailU').attr("placeholder", m.userEmail);
                    $('#birthU').text(m.birth);
                    if(m.gender == "M"){
                        $("input:radio[name='gender']:radio[value='M']").attr("checked", true);
                    }else if(m.gender=="F"){
                        $("input:radio[name='gender']:radio[value='F']").attr("checked", true);
                    }else{
                        $("input:radio[name='gender']:radio[value='N']").attr("checked", true);
                    }
                    $("input:radio[name='gender']").attr('disabled', true);
                    $('#enrollDateU').text(m.enrollDate);
                    $('#pointNowU').text(m.pointNow);
                    if(m.status == "Y"){
                        $("#statusU").val("Y").prop("selected", true);
                    }else if(m.status == "S"){
                        $("#statusU").val("S").prop("selected", true);
                    }else if(m.status == "N"){
                        $("#statusU").val("N").prop("selected", true);
                    }
                }, error: function(){
					console.log("회원상세수정목록 ajax 통신실패")
				}, complete: function(){
					console.log("회원상세수정목록 ajax 통신완료")
				}
            });          

        }
        

        // 수정완료 클릭시...... 안됨...
        // $("#updateMember").on("click", function(){
        //     let userNo = $("button[name='modifiyClick']").val();
        //     $.ajax({
        //         url:"<%=contextPath%>/updateMember.ad",
        //         data:{userNo:userNo, userName:userName, nickname:nickname, userPhone:userPhone, userEmail:userEmail, status:status},
        //         contentType: false,
        //         processData: false,
        //         type:'post',
        //         success:function(result){
        //             if(result>0){
        //                 alert("수정 완료");
        //             }else{
        //                 alert("수정 실패");
        //             }
        //         }, error: function(){
        //             console.log("회원상세수정 ajax 통신실패")
        //         }, complete: function(){
        //             console.log("회원상세수정 ajax 통신완료")
        //         }
        //     })
        // });


        // 회원 이용 내역 조회
        function useDetail(userNo){
            $.ajax({
                url:"<%=contextPath%>/selectMember.ad",
				data:{userNo:userNo},
				success: function(m){
                    $('#userNoB').text("회원 번호 : " + m.userNo);
                    $('#userIdB').text("아이디 : " + m.userId);
                }
            })
            $.ajax({
				url:"<%=contextPath%>/useMember.ad",
				data:{userNo:userNo},
				success: function(result){
                    
                    let value="";
                    
					for(let i=0; i<result.length; i++){
                        // userid = result[i].userId
						value += "<tr>"
									+ "<td>" + result[i].bookDate + "</td>"
									+ "<td>" + result[i].resName + "</td>"
									+ "<td>" + result[i].bookTime + "</td>"
									+ "<td>" + result[i].people + "</td>"
                                    + "<td>" + result[i].payTotal + "</td>"
                                    + "<td>" + result[i].payPoint + "</td>"
                                    + "<td>" + result[i].payFinal + "</td>"
                                    + "<td>" + result[i].plusPoint + "</td>"
                                    + "<td>" + result[i].payOp + "</td>"
							   + "</tr>";							
					}
                    $("#useTable tbody").html(value);
					if(result==0){
                        value = "<tr>" + "<td colspan=9>" + "이용 내역이 없습니다." + "</td>"+ "</tr>";	
                        $("#useTable tbody").html(value);
                    }
				}, error: function(){
					console.log("회원이용조회 ajax 통신실패")
				}, complete: function(){
					console.log("회원이용조회 ajax 통신완료")
                    console.log($('#userNo').val())
				}
			})
        }

        // 적립금 지급
        function clickPoint(){
            

            if(confirm('적립금을 지급하시겠습니까?')){
                let pointName = prompt('적립금명 : ');
                while(pointName=="") {
        			alert("적립금액을 입력해주세요");
        			pointName = prompt('적립금명 : ');
        		}
                let pointTrade = prompt('적립금액 : ');
                while(pointTrade==""){
                    alert("적립금액을 입력해주세요.");
                    pointTrade = prompt('적립금명 : ');
                }
                var userNo = $("input:checkbox[name='listCheck']:checked").val();
                $.ajax({
                    url:"<%=contextPath%>/point.ad",
                    data:{pointName:pointName, pointTrade:pointTrade, userNo:userNo},
                    success:function(result){
                        if(result>0){
                            alert("적립금이 지급되었습니다.")
                        }else{
                            alert("요청처리에 실패했습니다.")
                        }
                    }, error: function(){
                        console.log("적립금지급 ajax 통신실패")
                    }
                })
            }

            // $("input:checkbox[name='listCheck']:checked").each(function() {
            //     checkBoxArr.push($(this).val());     // 체크된 것만 값을 뽑아서 배열에 push
            //     console.log(checkBoxArr);
            
        }

        


	</script>
</body>
</html>