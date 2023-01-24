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
        width: 200px;
        height: 100%;
        z-index: 1000;
        position: absolute;
    }

    
    /* ↓↓↓ 컨텐츠용 스타일 */
    form{
        margin: 30px;
    }

    table td, table th {
        margin:auto;
        text-align: center;
        line-height: 25px;     
    }

    .left{
        display: inline-block;
    }

    .right{
        float: right;
    }

    /*카테고리*/
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

    /*라디오 버튼*/
    input {
        accent-color: rgb(221,45,45);
    }
    label{
        color: dimgray
    }

    /*삭제 버튼*/
    #deleteNotice{
        float: right;    
        font-size: 15px;
        width: 70px;
        height: 33px;
    }
    

    /*페이징바*/
    .pagination a{
        color:rgb(221,45,45);
    }

    /*목록 호버*/
    .table>tbody>tr:hover{
    	cursor:pointer;
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
                <div class="left">
                    <!--카테고리-->
                    <select id="select">
                        <option value="">문의유형</option>
                        <option value="">미답변</option>
                        <option value="">답변</option>
                    </select>
                    <input type="text" id="search" placeholder="아이디 검색" name="keyword">
                    <input type="submit" id="sButton" value="검색">
                </div>
                
                
                <div class="right">
                    <!--회원/업체-->
                    <input type="radio" id="member" name="selectNotice" value="M" checked>
                    <label for="member">회원</label>&nbsp&nbsp
                    <input type="radio" id="restaurant" name="selectNotice" value="R">
                    <label for="restaurant">업체</label>
                    &nbsp&nbsp&nbsp&nbsp

                    <!--삭제-->
                    <button type="button" class="btn btn-danger btn-sm" id="deleteNotice">삭제</button>
                    
                    <br> <br>
                </div>


                <!--1:1문의 표-->
                <table class="table">
                    <thead>
                        <tr>
                            <th><input type="checkbox"></th>
                            <th>번호</th>
                            <th>작성일</th>
                            <th>작성자</th>
                            <th>제목</th>
                            <th>처리결과</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="">
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2023.01.22</td>
                            <td>user01</td>
                            <td>결제가 안돼요 ~~~~~~~~~~~~</td>
                            <td>미답변</td>
                        </tr>
                        <tr id="">
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2023.01.22</td>
                            <td>user01</td>
                            <td>결제가 안돼요 ~~~~~~~~~~~~</td>
                            <td>미답변</td>
                        </tr>
                        <tr id="">
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2023.01.22</td>
                            <td>user01</td>
                            <td>결제가 안돼요 ~~~~~~~~~~~~</td>
                            <td>미답변</td>
                        </tr>
                        <tr id="">
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2023.01.22</td>
                            <td>user01</td>
                            <td>결제가 안돼요 ~~~~~~~~~~~~</td>
                            <td>미답변</td>
                        </tr>
                        <tr id="">
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2023.01.22</td>
                            <td>user01</td>
                            <td>결제가 안돼요 ~~~~~~~~~~~~</td>
                            <td>미답변</td>
                        </tr>
                        <tr id="">
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2023.01.22</td>
                            <td>user01</td>
                            <td>결제가 안돼요 ~~~~~~~~~~~~</td>
                            <td>미답변</td>
                        </tr>
                        <tr id="">
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2023.01.22</td>
                            <td>user01</td>
                            <td>결제가 안돼요 ~~~~~~~~~~~~</td>
                            <td>미답변</td>
                        </tr>
                        <tr id="">
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2023.01.22</td>
                            <td>user01</td>
                            <td>결제가 안돼요 ~~~~~~~~~~~~</td>
                            <td>미답변</td>
                        </tr>
                        <tr id="">
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2023.01.22</td>
                            <td>user01</td>
                            <td>결제가 안돼요 ~~~~~~~~~~~~</td>
                            <td>미답변</td>
                        </tr>
                        <tr id="">
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td>2023.01.22</td>
                            <td>user01</td>
                            <td>결제가 안돼요 ~~~~~~~~~~~~</td>
                            <td>미답변</td>
                        </tr>
                        
                    </tbody>	
                </table>
            </form>
            
            
            <!--페이징바-->
            <ul class="pagination justify-content-center" style="margin:20px 0">
                <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
            </ul> 
            <br><br><br>



            


            
			
		</div>
		
	
	<script>
		$(function(){
			$('#title').text("1 : 1 문의");
			$('#menu4-detail-3').click();
            $('#menu4').css("background-color","whitesmoke");
            $('#menu4').css("color","rgb(221,45,45)");
		})

        $('.my-select').selectpicker();
        


	</script>
</body>
</html>