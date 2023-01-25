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
        width: 220px;
        height: 100%;
        z-index: 1000;
        position: absolute;
    }

    
    /* ↓↓↓ 컨텐츠용 스타일 */
    form{
        margin: 30px;
    }

    .right{
        float: right;
    }

    table td, table th {
        margin:auto;
        text-align: center;
        line-height: 25px;     
    }

    tbody>tr:hover{
        cursor: pointer;   
    }


    /*카테고리*/
    #select{
        border: 1px solid gray;
        border-radius: 4px;
        width: 100px;
        height: 33px;
    }

    /*체크 버튼*/
    input{
        accent-color: rgb(221,45,45);
    }   
    
    /*삭제 버튼*/
    #insertNotice{
        float: right;
        font-size: 15px;
        margin-right: 5px;
        width: 70px;
        height: 33px;
    }

    /*페이징바*/
    .pagination a{
        color:rgb(221,45,45);
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

                <!--카테고리-->
                <select id="select">
                    <option value="">상태</option>
                    <option value="">미확인</option>
                    <option value="">승인</option>
                    <option value="">승인대기</option>
                    <option value="">반려</option>
                </select>

                <div class="right">
                    <!--삭제-->
                    <a class="btn btn-danger btn-sm" id="insertNotice">삭제</a>
                    <br> <br>
                </div>

                <!--등록요청 표-->
                <table class="table">
                    <thead>
                        <tr>
                            <th><input type="checkbox"></th>
                            <th>번호</th>
                            <th>작성일</th>
                            <th>업체명</th>
                            <th>처리상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td id="noticeTitle">2023.01.22</td>
                            <td>미오 도쿄 다이닝</td>
                            <td>미확인</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td id="noticeTitle">2023.01.22</td>
                            <td>미오 도쿄 다이닝</td>
                            <td>미확인</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td id="noticeTitle">2023.01.22</td>
                            <td>미오 도쿄 다이닝</td>
                            <td>미확인</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td id="noticeTitle">2023.01.22</td>
                            <td>미오 도쿄 다이닝</td>
                            <td>미확인</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td id="noticeTitle">2023.01.22</td>
                            <td>미오 도쿄 다이닝</td>
                            <td>미확인</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td id="noticeTitle">2023.01.22</td>
                            <td>미오 도쿄 다이닝</td>
                            <td>미확인</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td id="noticeTitle">2023.01.22</td>
                            <td>미오 도쿄 다이닝</td>
                            <td>미확인</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td id="noticeTitle">2023.01.22</td>
                            <td>미오 도쿄 다이닝</td>
                            <td>미확인</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td id="noticeTitle">2023.01.22</td>
                            <td>미오 도쿄 다이닝</td>
                            <td>미확인</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>1</td>
                            <td id="noticeTitle">2023.01.22</td>
                            <td>미오 도쿄 다이닝</td>
                            <td>미확인</td>
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
			$('#title').text("업체 등록 요청");
			$('#menu4-detail-4').click();
            $('#menu4').css("background-color","whitesmoke");
            $('#menu4').css("color","rgb(221,45,45)");
		})

        


	</script>
</body>
</html>