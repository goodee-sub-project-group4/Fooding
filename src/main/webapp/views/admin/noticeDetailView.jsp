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

    th {height:40px; width: 100px;}

    #detail-area p{
        width: 800px;
        box-sizing: border-box;
        padding: 20px;
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
            
            <form action="" id="detail-area">
                
                <table class="table">
                    <tr>
                        <th>제목</th>
                        <td>푸딩 공지사항</td>
                    </tr>
                    <tr>
                        <th width="70">작성자</th>
                        <td>푸딩 공지사항</td>
                    </tr>
                    <tr>
                        <th width="70">작성일</th>
                        <td>2023.01.22</td>
                    </tr>     
                    <tr>
                        <td colspan="2">
                            <br>
                            <p>
                                푸딩공지사항 
                            </p>
                        </td>
                    </tr>
                    
                </table>


            </form>
            
            
            <div align="center">
                <a href="" class="btn btn-outline-danger">목록가기</a>&nbsp&nbsp
                <a href="" class="btn btn-danger">수정하기</a>&nbsp&nbsp
                <a href="" class="btn btn-danger">삭제하기</a>
            </div>
            <br><br><br>
		</div>


	
	<script>
		$(function(){
			$('#title').text("공지사항");
			$('#menu4-detail-1').click();
            $('#menu4').css("background-color","whitesmoke");
            $('#menu4').css("color","rgb(221,45,45)");
		})
	</script>
</body>
</html>