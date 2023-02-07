<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList, com.fd.restaurant.model.vo.Restaurant, com.fd.book.model.vo.Book"%>
<%
	ArrayList<Restaurant> list = (ArrayList)request.getAttribute("list");
	Restaurant r = (Restaurant)request.getAttribute("r");
	ArrayList<Book> reserveList = (ArrayList)request.getAttribute("reserveList");

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

    /*표*/
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
    /*업체탈퇴 버튼*/
    #deleteMember{
        float: right;    
        font-size: 15px; 
    }
    
    /*상태 셀렉트*/
    #selectStatus{
        border: 1px solid white;
        font-weight: 600;
        margin-left: -20px;
        margin-right: -20px;
    }
    
    /*마우스 커서*/
    #restNocursor:hover{
        cursor: pointer;
        color: rgb(221,45,45);
    }
    
    /*체크 버튼*/
    input{
        accent-color: rgb(221,45,45);
    } 


    /*업체 조회 모달*/
    #selectModal-body tr{
        height: 40px;
    }
    #selectModal-body th{
        padding-left: 30px;
        text-align: left;
        color: gray;
        font-weight: 500;
        width: 300px;
    }
    #selectModal-body td{
        padding-left: 40px;
        text-align: left;
        width: 500px;
    }
    
    /*업체 수정 모달*/
    #updateModal-body tr{
        height: 40px;
    }
    #updateModal-body th{
        padding-left: 20px;
        text-align: left;
        color: gray;
        font-weight: 500;
        width: 400px;
    }
    #updateModal-body td{
        padding-left: 40px;
        text-align: left;
        width: 350px;
    }
    #updateModal-body input{
        width:220px;
    }
    
    /*예약현황 조회 모달*/
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
                <!-- <select id="select">
                    <option value="">최신 순</option>
                    <option value="">오래된 순</option>
                    <option value="">예약 순</option>
                    <option value="">리뷰 순</option>
                </select>
                <input type="text" id="search" placeholder="아이디 검색" name="keyword">
                <input type="submit" id="sButton" value="검색"> -->
            
            
                <!-- <button type="button" class="btn btn-danger btn-sm" id="deleteMember" data-toggle="modal" data-target="#deleteModal">업체 탈퇴</button> -->
                <div></div>
                <br><br>

                <!--업체조회 표-->
                <table class="table">
                    <thead>
                        <tr>
                            <th><input type="checkbox"></th>
                            <th>업체번호</th>
                            <th>상호명</th>
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
                            <th width="70px">상세</th>
                            <th>예약현황</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(int i=0; i<list.size(); i++) { %>
                        <tr>
                            <td><input type="checkbox" name="listCheck" ></td>
                            <td id="restNocursor" data-toggle="modal" data-target="#selectModal" onclick="viewDetail(<%= list.get(i).getResNo() %>)"><%= list.get(i).getResNo() %></td>
                            <td><%= list.get(i).getResName() %></td>
                            <td><%= Integer.parseInt(list.get(i).getBookCount()) %></td>
                            <td><%= Integer.parseInt(list.get(i).getReviewCountR()) %></td>
                            <td><%= Integer.parseInt(list.get(i).getBlackCount()) %></td>
                            <td><%= (list.get(i).getStatus().equals("Y")) ? "정상" : "이용정지" %></td>
                            <td><button type="button" class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#updateModal" name="modifiyClick" value="<%=list.get(i).getResNo()%>" onclick="viewDetail2(<%=list.get(i).getResNo()%>)" >수정</button></td>
                            <td><button type="button" class="btn btn-outline-danger btn-sm" data-toggle="modal" data-target="#selectUseModal" onclick="reserveDetailList(<%= list.get(i).getResNo() %>)" >조회</button></td>
                        </tr>
                        <% } %>
                    </tbody>	
                </table>

                <!--이용현황-->
                <div style="float: right; color: rgb(141, 141, 141); padding: 10px;">
                    정상 : &nbsp; <span>n</span> 명 &nbsp;&nbsp;&nbsp; 이용정지 : &nbsp; <span>n</span> 명 &nbsp;&nbsp;&nbsp; 탈퇴 : &nbsp; <span>n</span> 명
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

            <!-- 업체 탈퇴 모달 -->
            <div class="modal" id="deleteModal">
                <div class="modal-dialog">
                    <div class="modal-content">
              
                        <!-- Modal Header -->
                        <div class="modal-header" style="margin-top: 20px;">
                            <h4 class="modal-title" style="margin: auto; color: rgb(75, 75, 75);">정말로 업체 탈퇴하시겠습니까?</h4>
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


            <!-- 업체 조회 모달 -->
            <div class="modal" id="selectModal">
                <div class="modal-dialog" >
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header" style="margin-top: 20px;">
                        <h3 class="modal-title" style="margin: auto;">업체 조회</h3>   
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body" align="center">
                        <table id="selectModal-body">
                            <tr>
                                <th width="1000px">업체번호</th>
                                <td id="resNo"></td>
                            </tr>
                            <tr>
                                <th>상호명</th>
                                <td id="resName"></td>
                            </tr>       
                            <tr>
                                <th>대표자명</th>
                                <td id="ceo"></td>
                            </tr>
                            <tr>
                                <th>사업자 번호</th>
                                <td id="permitNo"></td>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <td id="address"></td>
                            </tr>
                            <tr>
                                <th></th>
                                <td id="dAddress"></td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td id="phone"></td>
                            </tr> 
                            <tr>
                                <th>휴대폰번호</th>
                                <td id="cellphone"></td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td id="email"></td>
                            </tr>
                            <tr>
                                <th>업종</th>
                                <td id="foodCt"></td>
                            </tr>
                            <tr>
                                <th>주차</th>
                                <td id="parking"></td>
                            </tr>
                            <tr>
                                <th>영업시간</th>
                                <td><span id="open"></span><span id="blank1"></span><span id="close"></span></td>
                            </tr>
                            <tr>
                                <th>브레이크 타임</th>
                                <td><span id="breakS"></span><span id="blank2"></span><span id="breakE"></span></td>
                            </tr>
                            <tr>
                                <th>등록일</th>
                                <td id="enrollDate"></td>
                            </tr>
                            <tr>
                                <th>상태</th>
                                <td id="status"></td>
                            </tr>
                        </table>
                        <br>
                        <button type="button" class="btn btn-outline-danger" data-dismiss="modal" style="width: 150px;">닫기</button>
                        <br><br>
                    </div>
            
                    
            
                </div>
                </div>
            </div>


            <!-- 업체 수정 모달 -->
            <div class="modal" id="updateModal">
                <div class="modal-dialog" >
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header" style="margin-top: 20px;">
                        <h3 class="modal-title" style="margin: auto;">업체 수정</h3>   
                    </div>
                    
                    <form action="<%=contextPath%>/updateRest.ad">
                    <!-- Modal body -->
                    <div class="modal-body" align="center">
                        <table id="updateModal-body">
                            <tr>
                                <th width="1000px">업체번호</th>
                                <td id="resNoS"></td>
                                <input type="hidden" id="resNoU" name="resNo">
                            </tr>
                            <tr>
                                <th>상호명</th>
                                <td><input id="resNameU" name="resName" type="text" placeholder=""></td>
                            </tr>
                            <tr>
                                <th>대표자명</th>
                                <td><input id="ceoU" name="ceo" type="text" placeholder=""></td>
                            </tr>
                            <tr>
                                <th>사업자 번호</th>
                                <td><input id="permitNoU" name="permitNo" type="text" placeholder=""></td>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <td><input id="addressU" name="address" type="text" placeholder=""></td>
                            </tr>
                            <tr>
                                <th></th>
                                <td><input id="dAddressU" name="dAddress" type="text" placeholder=""></td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td><input id="phoneU" name="phone" type="text" placeholder=""></td>
                            </tr>
                            <tr>
                                <th>휴대폰번호</th>
                                <td><input id="cellphoneU" name="cellphone" type="text" placeholder=""></td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td><input id="emailU" name="email" type="text" placeholder=""></td>
                            </tr>
                            <tr>
                                <th>업종</th>
                                <td>
                                    <select name="foodCt" id="foodCtU" style="height: 30px;">
                                        <option value="western">양식</option>
                                        <option value="japanese">일식</option>
                                        <option value="chinese">중식</option>
                                        <option value="chicken">분식류/치킨</option>
                                        <option value="asia">아시아/퓨전</option>
                                        <option value="buffet">뷔페/레스토랑</option>
                                        <option value="bar">술집</option>
                                        <option value="cafe">카페</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>주차</th>
                                <td id="parkingU">
                                    <input type="radio" id="parkingY" name="parking" value="Y" style="width: 20px;">
                                    <label for="parkingY">가능</label>
                                    <input type="radio" id="parkingN" name="parking" value="N" style="width: 20px;">
                                    <label for="parkingN">불가능</label> <br>
                                </td>
                            </tr> 
                            <tr>
                                <th>영업시간</th>
                                <td>
                                    <span><input style="width:100px" id="openU" name="open" type="text" placeholder=""></span><span id="blank1">~</span>
                                    <span><input style="width:100px" id="closeU" name="close" type="text" placeholder=""></span>
                                </td>
                            </tr>
                            <tr>
                                <th>브레이크 타임</th>
                                <td>
                                    <span><input style="width:100px" id="breakSU" name="breakS" type="text" placeholder=""></span><span id="blank2">~</span>
                                    <span><input style="width:100px" id="breakEU" name="breakE" type="text" placeholder=""></span>
                                </td>
                            </tr>
                            <tr>
                                <th>등록일</th>
                                <td id="enrollDateU"></td>
                            </tr>
                            <tr>
                                <th>상태</th>
                                <td>
                                    <select name="status" id="statusU" style="height: 30px;">
                                        <option value="Y">정상</option>
                                        <option value="S">이용정지</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        <br>
                        <button type="submit" class="btn btn-danger" style="width: 150px;" data-toggle="modal" >수정완료</button>
                        <button type="button" class="btn btn-outline-danger" data-dismiss="modal" style="width: 150px;">닫기</button>
                        <br><br>
                    </div>             
                    </form>
  
                </div>
                </div>
            </div>

            <!-- 업체 수정 완료 모달 -->
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


            <!-- 예약 현황 조회 모달 -->
            <div class="modal" id="selectUseModal">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                
                        <!-- Modal Header -->
                        <div class="modal-header" style="margin-top: 20px;">
                            <h4 class="modal-title" style="margin-left: 500px;">예약 현황</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                
                        <!-- Modal body -->

                        <div class="selectUseModal-body">
                            <div align="center" style="font-size:20px;">
                                <span id="resNoR" style="color: gray;">업체 번호</span>  
                            </div>
                            <br>
                            <p>예약/결제 내역</p>
                            <table class="table" id="reserveTable">
                                <thead>
                                    <tr>
                                        <th>예약번호</th>
                                        <th>접수날짜</th>
                                        <th>성명</th>
                                        <th>예약날짜</th>
                                        <th>예약시간</th>    
                                        <th>상태</th>
                                        <th>상세조회</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    
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


            <!-- 예약 상세 조회 모달 -->
            <div class="modal" id="useDetailModal">
                <div class="modal-dialog modal-lg" >
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4>예약상세조회</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        <br>
                        <h3>예약정보</h3>
                        <table class="table table-sm">
                            <tr class="table-secondary">
                                <th>예약번호</th>
                                <th>예약날짜</th>
                                <th>예약시간</th>
                                <th>예약인원</th>
                            </tr>
                            <tr class="table-light">
                                <td id="bookNo"></td>
                                <td id="bookDate"></td>
                                <td id="bookTime"></td>
                                <td id="people"></td>
                            </tr>
                        </table>
                        <br>
                        <h3>예약자정보</h3>
                        <table class="table table-sm">
                            <tr class="table-secondary">
                                <th>이름</th>
                                <th>연락처</th>
                                <th>이메일</th>
                                <th>요청사항</th>
                            </tr>
                            <tr class="table-light">
                                <td id="bookName"></td>
                                <td id="bookPhone"></td>
                                <td id="email"></td>
                                <td id="request"></td>
                            </tr>
                        </table>
                        <br>
                        <h3>주문내역</h3>
                        <table class="table table-sm">
                            <tr class="table-secondary" id="menu-start">
                                <th>메뉴</th>
                                <th>수량</th>
                                <th>단가</th>
                                <th>금액</th>
                            </tr>
                            <tr class="table-light">
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>
                        <br>
                        <h3>결제정보</h3>
                        <table class="table table-sm">
                            <tr class="table-secondary">
                                <th>결제시간</th>
                                <th>결제수단</th>
                                <th>결제금액</th>
                            </tr>
                            <tr class="table-light">
                                <td id="payDate"></td>
                                <td id="payOp"></td>
                                <td id="payTotal"></td>
                            </tr>
                        </table>
                        <br>
                        <h3>예약상태</h3>
                        <form action="<%=contextPath%>/bookStatus.re">
                            <input type="hidden" name="statusBookNo" val="0" id="statusBookNo">
                            <select name="bookStatus" id="bookStatus" disabled>
                                <option value="B">예약완료</option>
                                <option value="C">취소</option>
                                <option value="D">이용완료</option>
                            </select>
                        
                        </form>
                        
                        
                    </div>
            
                    
            
                </div>
                </div>
            </div>
			
		</div>
		
	
	<script>

        $(function(){
			$('#title').text("업체 조회");
			$("#menu2").addClass("active");
            
            $("td").addClass("align-middle");
		})

        // 업체 상세 조회
        function viewDetail(resNo){
            $.ajax({
                url:"<%=contextPath%>/selectRest.ad",
                data:{resNo:resNo},
                success: function(r){
                    $('#resNo').text(resNo);
                    $('#resName').text(r.resName);
                    $('#ceo').text(r.ceo);
                    $('#permitNo').text(r.permitNo);
                    $('#address').text(r.address);
                    $('#dAddress').text(r.dAddress);
                    $('#phone').text(r.phone);
                    $('#cellphone').text(r.cellphone);
                    $('#email').text(r.email);
                    $('#foodCt').text(r.foodCt);
                    if(r.parking=="Y"){
                        $('#parking').text("주차가능")
                    }else if(r.parking=="N"){
                        $('#parking').text("주차불가")
                    };
                    $('#open').text(r.open);
                    $('#blank1').text(' ~ ');
                    $('#close').text(r.close);
                    $('#breakS').text(r.breakS);
                    $('#blank2').text(' ~ ');
                    $('#breakE').text(r.breakE);
                    $('#enrollDate').text(r.enrollDate);
                    if(r.status=="Y"){
                        $('#status').text("정상")
                    }else if(r.status=="S"){
                        $('#status').text("이용정지")
                    };
                }, error: function(){
                    console.log("업체상세목록 ahax 통신 실패")
                }, complete: function(){
                    console.log("업체상세목록 ahax 통신 성공")
                }
            })
        }

        // 업체 상세 수정
        function viewDetail2(resNo){
            $.ajax({
                url:"<%=contextPath%>/selectRest.ad",
                data:{resNo:resNo},
                success: function(r){
                    $('#resNoU').val(r.resNo)
                    $('#resNoS').text(r.resNo);
                    $('#resNameU').val(r.resName);
                    $('#ceoU').val(r.ceo);
                    $('#permitNoU').val(r.permitNo);
                    $('#addressU').val(r.address);
                    $('#dAddressU').val(r.dAddress);
                    $('#phoneU').val(r.phone);
                    $('#cellphoneU').val(r.cellphone);
                    $('#emailU').val(r.email);
                    $('#foodCtU').val(r.foodCt);

                    if(r.foodCt == "western"){
                        $("#foodCtU").val("western").prop("selected", true);
                    }else if(r.foodCt == "japanese"){
                        $("#foodCtU").val("japanese").prop("selected", true);
                    }else if(r.foodCt == "chinese"){
                        $("#foodCtU").val("chinese").prop("selected", true);
                    }else if(r.foodCt == "chicken"){
                        $("#foodCtU").val("chicken").prop("selected", true);
                    }else if(r.foodCt == "asia"){
                        $("#foodCtU").val("asia").prop("selected", true);
                    }else if(r.foodCt == "buffet"){
                        $("#foodCtU").val("buffet").prop("selected", true);
                    }else if(r.foodCt == "bar"){
                        $("#foodCtU").val("bar").prop("selected", true);
                    }else if(r.foodCt == "cafe"){
                        $("#foodCtU").val("cafe").prop("selected", true);
                    }

                    if(r.parking == "Y"){
                        $("input:radio[name='parking']:radio[value='Y']").attr("checked", true);
                    }else if(r.parking=="N"){
                        $("input:radio[name='parking']:radio[value='N']").attr("checked", true);
                    };
                    $('#openU').val(r.open);
                    $('#blank1').text(' ~ ');
                    $('#closeU').val(r.close);
                    $('#breakSU').val(r.breakS);
                    $('#blank2').text(' ~ ');
                    $('#breakEU').val(r.breakE);
                    $('#enrollDateU').text(r.enrollDate);
                    if(r.status == "Y"){
                        $("#statusU").val("Y").prop("selected", true);
                    }else if(r.status == "S"){
                        $("#statusU").val("S").prop("selected", true);
                    }
                }, error: function(){
                    console.log("업체상세수정목록 ahax 통신 실패")
                }, complete: function(){
                    console.log("업체상세수정목록 ahax 통신 성공")
                }
            })
        }



        // 업체 예약 상세 조회
        function reserveDetailList(resNo){
			$.ajax({
				url:"<%= contextPath %>/reserveRest.ad",
                data:{resNo: resNo},
				success:function(result){	
                    $('#resNoR').text("업체 번호 : " + resNo);
					let value="";
					for(let i=0; i<result.length; i++){
						value += "<tr>"
                                    + "<td>" + result[i].bookNo     + "</td>"
									+ "<td>" + result[i].bookA      + "</td>"
									+ "<td>" + result[i].bookName   + "</td>"
									+ "<td>" + result[i].bookDate   + "</td>"
                                    + "<td>" + result[i].bookTime   + "</td>"
                                    + "<td>" + result[i].status + "</td>"
                                    + "<td>" + '<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#useDetailModal" onclick="reserveDetailView(' +result[i].bookNo + ')" >조회</button>' + "</td>"
							    + "</tr>"							
					}
                    $("#reserveTable tbody").html(value);
					if(result==0){
                        value = "<tr>" 
                                    + "<td colspan=9>" + "이용 내역이 없습니다." + "</td>"
                                + "</tr>";	
                        $("#reserveTable tbody").html(value);
                    }
				}, error: function(){
					console.log("업체이용조회 ajax 통신실패")
				}, complete: function(){
					console.log("업체이용조회 ajax 통신완료")
				}
			})
        
            if($('.bookStatus').text() == 'B'){
                $('.bookStatus').text('예약완료');
            }else if($('.bookStatus').text() == 'C'){
                $('.bookStatus').text('예약취소');
            }
        
        }
       
        function reserveDetailView(bookNo){
			$.ajax({
				url:"<%=contextPath%>/bookDetail.ad",
				data:{bookNo:bookNo},
				success: function(set){
					//기본정보 채우기
					$('#bookNo').text(bookNo);
					$('#statusBookNo').val(set[0].bookNo);
					$('#bookDate').text(set[0].bookDate);
					$('#bookTime').text(set[0].bookTime);
					$('#people').text(set[0].people);
					$('#bookName').text(set[0].bookName);
					$('#bookPhone').text(set[0].bookPhone);
					$('#email').text(set[0].email);
					//request는 null이 가능한데, null일경우 이전에 조회했던 내용이 뜬다
					// >> 한번 비워주고 실행한다.
					$('#request').text("-");
					$('#request').text(set[0].request);
					$('#payDate').text(set[2].payDate);
					$('#payOp').text(set[2].payOp);
					$('#payTotal').text(set[2].payTotal);
					
					//[메뉴조회]를 위해 하단의 for문을 넣었으나, 이것만 있으면 상세조회를 누를때마다 쌓인다.
					// >> 이전에 쌓은 요소들을 먼저 지워주고 시작한다.
					$('#menu-start').siblings().remove();
					for(let i=0; i<set[1].length; i++) {
						$('#menu-start').after($('<tr class="table-light">'+
	                            '<td>'+set[1][i].menuNo+'</td>'+
	                            '<td>'+set[1][i].menuCount+'</td>'+
	                            '<td>'+set[1][i].price+'</td>'+
	                            '<td>'+set[1][i].bmPrice+'</td>'+
	                        '</tr>'));
					}
					
					//[예약상태] 설정을 위해 하단의 each함수를 넣었으나, 이것만 있으면 상세조회를 누를때 이전 조회에 영향을 받는다.
					// >> 이전에 변경한 값들을 지워주고 시작한다.
					$('#bookStatus').attr("disabled", true);
					$('#bookStatus').siblings().attr("disabled", true);
					$('#bookStatus').children().each(function(){
						if($(this).val()==set[0].status) {
							$(this).attr("selected",true);
							if(set[0].status=="B") {
								//예약완료 상태는 버튼 활성화
								$('#bookStatus').attr("disabled", false);
								$('#bookStatus').siblings().attr("disabled", false);
							}
						}
					})
				}, error: function() {
					console.log("예약상세조회 ajax통신실패")
				}, complete: function(){
					console.log("예약상세조회 ajax통신완료")
				}
			})
		}
        


	</script>
</body>
</html>