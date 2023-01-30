<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

    input{
        accent-color: rgb(221,45,45);
    }

    #noticeTitle>input {
        width: 700px;
        height: 40px;
        padding: 20px;
    }

    #enroll-notice textarea{
        width: 700px;
        height: 400px;
        box-sizing: border-box;
        padding: 20px;
    }

    #noticeImg{  
        padding: 5px;
    }

    .right {
        position: relative;
        left: 640px;
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

            <form action="<%= contextPath %>/noInsert.ad" id="enroll-notice" method="post" enctype="multipart/form-data">
                <div class="right">
                    <!--회원/업체-->
                    <input type="radio" id="member" name="toWhom" value="U" checked>
                    <label for="member">회원</label>&nbsp&nbsp
                    <input type="radio" id="restaurant" name="toWhom" value="R">
                    <label for="restaurant">업체</label>
                    <br> <br>
                </div>

                <!-- <input type="hidden" value="U" name="toWhom"> -->
                <!-- <input type="hidden" value="R" name="toWhom"> -->

                <input type="hidden" value="N" name="boardType">
                <table>
                    <tr>
                        <th width="70">제목 <span id="required">*</span></th>
                        <td id="noticeTitle">
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
                    <tr><td><br></td></tr>
                    <tr>
                        <th>첨부파일</th>
                        <td id="noticeImg">
                            <input type="file" name="upfile">
                        </td>
                    </tr>
                </table>

                <br><br>
                <div align="center">
                    <button type="submit" class="btn btn-danger">등록하기</button>&nbsp&nbsp
                    <button type="reset" class="btn btn-outline-danger">취소하기</button>
                </div>

            </form>
		</div>
        <br><br><br>
		
	
	<script>
		$(function(){
            
            // Head.jsp 내의 요소, #title의 문구를 변경
			$('#title').text("공지사항");
			$("#menu4").addClass("active");
			$("#menu4-detail-1").addClass("active");

		})
	</script>
</body>
</html>