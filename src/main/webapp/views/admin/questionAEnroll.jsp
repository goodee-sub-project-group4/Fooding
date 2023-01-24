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

    th{
        vertical-align: top;
        padding-top: 10px;
    }

    #questionTitle {
        width: 700px;
        height: 40px;
        padding: 20px; 
        border-radius: 50px;
        /*그냥 border-radius 하면 적용안됨*/
        border-collapse: collapse;
        border-radius: 5px;
        border-style: hidden;
        box-shadow: 0 0 0 1px gray;
    }

    #questionContent{
        width: 700px;
        height: 400px;
        box-sizing: border-box;
        padding: 20px;
        border-radius: 50px;
        border-collapse: collapse;
        border-radius: 5px;
        border-style: hidden;
        box-shadow: 0 0 0 1px gray;
    }

    #answerContent{
        width: 700px;
        height: 400px;
        box-sizing: border-box;
        padding: 20px;
        border-radius: 50px;
        border-collapse: collapse;
        border-radius: 5px;
        border-style: hidden;
        box-shadow: 0 0 0 1px gray;
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

            <form action="" id="enroll-answer" method="post">
                
                <table>  
                    <tr>
                        <th width="70">문의</th>
                        <td id="questionTitle">
                            기존 문의 제목
                        </td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <th></th>
                        <td id="questionContent">
                            기존 문의 내용
                        </td>
                    </tr>
                    <tr><td><br><br></td></tr>
                    <tr>
                        <th>답변</th>
                        <td>
                            <textarea name="" id="answerContent" cols="30" rows="10"></textarea>
                        </td>
                    </tr>
                </table>

                <br><br>
                <div align="center">
                    <button type="submit" class="btn btn-danger">답변하기</button>&nbsp&nbsp
                    <button type="submit" class="btn btn-outline-danger" onclick="history.back();">취소하기</button>
                </div>

            </form>
		</div>
        <br><br><br>
		
	
	<script>
		$(function(){
			$('#title').text("1 : 1 문의");
			$('#menu4-detail-3').click();
            $('#menu4').css("background-color","whitesmoke");
            $('#menu4').css("color","rgb(221,45,45)");
		})
	</script>
</body>
</html>