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

    th{
        vertical-align: top;
        padding-top: 5px;
    }
    th>span{
        color: red;
    }

    #select{
        width: 700px;
        height: 40px;
        padding-left: 15px;
    }

    #faqTitle>input {
        width: 700px;
        height: 40px;
        padding: 20px;
    }

    #enroll-faq textarea{
        width: 700px;
        height: 400px;
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

            <form action="" id="enroll-faq" method="post">
                
                <table>
                    <tr>
                        <th width="70">구분 <span id="required">*</span></th>
                        <td id="category">
                            <select id="select">
                                <option value="">회원</option>
                                <option value="">예약/결제</option>
                                <option value="">적립금</option>
                            </select>
                        </td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <th>제목 <span id="required">*</span></th>
                        <td id="faqTitle">
                            <input type="text" name="title" placeholder="제목을 입력해주세요" required >
                        </td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <th>내용 <span id="required">*</span></th>
                        <td>
                            <textarea name="content" id="" rows="10" style="resize:none" placeholder="내용을 입력해주세요" required></textarea>
                        </td>
                    </tr>
                </table>

                <br><br>
                <div align="center">
                    <button type="submit" class="btn btn-danger">등록하기</button>&nbsp&nbsp
                    <button type="submit" class="btn btn-outline-danger">취소하기</button>
                </div>

            </form>
		</div>
        <br><br><br>
		
	
	<script>
		$(function(){
			$('#title').text("FAQ");
			$('#menu4-detail-2').click();
            $('#menu4').css("background-color","whitesmoke");
            $('#menu4').css("color","rgb(221,45,45)");
		})
	</script>
</body>
</html>