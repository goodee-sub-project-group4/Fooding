<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 문의</title>
	<!-- 제이쿼리구문 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <!-- 부트스트랩 링크3개 -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        #content2-padding {width: 900px; height: 800px; margin: auto; margin-top: 45px; padding: 20px; box-sizing:border-box; float:left;}
        /* #content2-padding div {border:1px solid green;} */
        #notice-area {width: 100%; height: 135px; font-size: 30px; text-align: center; display: inline-block;}

        form{margin: 30px;}
        th{vertical-align: top; padding-top: 10px;}
    	#select{
        height: 40px;
        padding-left: 15px;
        border-radius: 6px;}
        
    	#qCategory, #qTitle, #qContent, #qImg, #aContent{
        /*그냥 border-radius 하면 적용안됨*/
        border-collapse: collapse;
        border-radius: 2px;
        border-style: hidden;
        box-shadow: 0 0 0 1px gray;
        box-sizing: border-box;
        width: 700px;}

    	#qCategory, #qTitle{padding: 10px; padding-left: 20px;}

        #qContent{height: 400px;padding: 20px;}

    	#qImg{height: 250px; text-align: center;}

    	img{margin: 8px;}

    	#aContent{padding: 20px;}

    	#enroll-answer textarea{resize: none;}
    </style>
    
</head>
<body>
<%@ include file="/views/common/head.jsp" %>
        <%@ include file="/views/common/customerServiceSidebar.jsp" %>
    
        <div id="content2-padding">
            <div id="notice-area">
                <b>내가 쓴 1 : 1 문의</b>
            </div>
            <div id="question-write-area">
                <form action="" id="enroll-answer" method="post">
                
                    <table>  
                        <tr>
                            <th width="70">문의</th>
                            <td id="qCategory">
                                
                            </td>
                        </tr>
                        <tr><td height="15px"></td></tr>
                        <tr>
                            <th></th>              
                            <td id="qTitle"> 문의 제목</td>
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
                        <tr><td><br></td></tr>
                        <tr>
                            <th>답변</th>
                            <td colspan="2">
                                <textarea name="" id="aContent" cols="30" rows="10"></textarea>
                            </td>
                        </tr>
                    </table>
    
                    <br><br>
                    <div align="center">
                        <button type="submit" class="btn btn-danger" style="width:100px;">확인</button>&nbsp&nbsp
                        <button type="submit" class="btn btn-outline-danger" style="width:100px;">수정</button>
                    </div>
                    <br><br><br><br>
                </form>

            </div>
        </div>


</body>
</html>