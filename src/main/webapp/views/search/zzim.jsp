<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        #content2-padding {width:900px; height: 800px; margin: auto; margin-top: 45px; padding: 20px; box-sizing:border-box; float:left;}
        /* #content2-padding div {border:1px solid green;} */
        #change-area {width: 100%; height: 135px; font-size: 30px; text-align: center; padding-top:20px;
            display: inline-block; border-bottom:1px solid black;}
        #change-infomation {width:800px; margin: auto;}
        /* 첫번째 칸 */
        th {width:25%; height:80px; text-align: right; padding-right:10px;}
        /* 두번째 칸 input */
        .input-area2 {width:50%;}
        .input-area2 div {width:450px; height:140px; margin:20px; font-size:small; padding-left:10px; border:1px solid red;}
        .gender-area input {margin:20px;}
        .gender-area {font-weight:600;}
        .birth-area input {margin:20px; width:80px; padding-left:20px; font-weight:600;}
        .check-terms input {margin:20px 10px 0px 20px;}
        /* 세번째 칸 */
        .input-area3 {width:20%;}
        .input-area3-phone button {margin-left:5px;}
        .input-area3-nickname button { margin-left:5px; width:125px;}
        .terms {height: 120px;}
        .terms div {padding-left:20px; margin-top:-10px;}
        .terms a {color:black; text-decoration:none; font-weight:600; font-size:14px;}
        /*  가입버튼 */
        #change-btn input {width:130px; height:50px; font-weight:500;}
        #change-btn button {width:130px; height:50px; font-weight:500;}

    </style>
</head>
<body>
	
	<%@ include file="/views/common/head.jsp" %>
	<%@ include file="/views/common/myPageSidebar.jsp" %>

	<div id="content2-padding">
        <div id="change-area">
            <b>찜한 음식점 (2)</b>
        </div>
        
        <div id="change-infomation">
            
                    
                <table class="table1">
                    <tr>
                        <th>미오도쿄다이닝</th>
                        <td class="input-area2"><div></div></td> 
                        <td class="input-area3-id"></td>
                    </tr>
                    <tr>
                        <th>미오도쿄다이닝</th>
                        <td class="input-area2"><div></div></td>
                        <td class="input-area3"></td>
                    </tr>
                    <tr>
                        <th>미오도쿄다이닝</th>
                        <td class="input-area2"><div></div></td>
                        <td class="input-area3"></td>
                    </tr>
                    <tr>
                        <th>미오도쿄다이닝</th>
                        <td class="input-area2"><div></div></td>
                        <td class="input-area3"></td>
                    </tr>
                    <tr>
                        <th>미오도쿄다이닝</th>
                        <td class="input-area2"><div></div></td>
                        <td class="input-area3"></td>
                    </tr>
                    <tr>
                        <th>미오도쿄다이닝</th>
                        <td class="input-area2"><div></div></td>
                        <td class="input-area3"></td>
                    </tr>
                    
                </table>
                
                
                
                

        </div>

    </div>

    

</body>
</html>