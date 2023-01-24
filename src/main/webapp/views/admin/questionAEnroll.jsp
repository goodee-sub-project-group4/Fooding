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

    #select{
        height: 40px;
        padding-left: 15px;
        border-radius: 6px;
    }

    #qCategory, #qTitle, #qContent, #qImg, #aContent{
        /*그냥 border-radius 하면 적용안됨*/
        border-collapse: collapse;
        border-radius: 5px;
        border-style: hidden;
        box-shadow: 0 0 0 1px gray;
        box-sizing: border-box;
        width: 700px; 
    }

    #qCategory, #qTitle{
        padding: 10px; 
        padding-left: 20px;         
    }

    #qContent{
        height: 400px;
        padding: 20px;
    }

    #qImg{
        height: 250px;
        text-align: center;
    }

    img{
        margin: 8px;
    }

    #aContent{
        padding: 20px;
    }

    #enroll-answer textarea{
        resize: none;
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
                        <td id="qCategory">
                            기존 카테고리 유형
                        </td>
                    </tr>
                    <tr><td height="15px"></td></tr>
                    <tr>
                        <th></th>              
                        <td id="qTitle">
                            기존 문의 제목
                        </td>
                    </tr>
                    <tr><td height="15px"></td></tr>
                    <tr>
                        <th></th>
                        <td id="qContent">
                            기존 문의 내용
                        </td>
                    </tr>
                    <tr><td height="15px"></td></tr>
                    <tr>
                        <th></th>
                        <td id="qImg">
                            <img src="../../resources/images/chicken.jpg" width="320" height="210">
                            <img src="../../resources/images/chicken.jpg" width="320" height="210">
                        </td>
                    </tr>
                    <tr><td><br><br></td></tr>
                    <tr>
                        <th>답변</th>
                        <td colspan="2">
                            <textarea name="" id="aContent" cols="30" rows="10"></textarea>
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