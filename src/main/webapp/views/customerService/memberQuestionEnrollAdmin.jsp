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
    	
    	#qCategory, #qTitle, #qContent, #qImg, #aContent{
        border-collapse: collapse;
        border-radius: 2px;
        border-style: hidden;
        box-shadow: 0 0 0 1px gray;
        box-sizing: border-box;
        width: 700px;}

    	#qCategory, #qTitle, #aContent{padding:10px;}

    	#qContent{height: 250px; padding :10px; }

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
                <form action="<%=contextPath%>/questionAdmin.me" id="enroll-answer" method="post" enctype="multipart/form-data">
                
                    <table>  
                        <tr>
                            <th width="70">유형</th>
                            <td>
                                <select name="category" id="qCategory">
                                    <option value="">유형선택</option>
                                    <option value="MP">적립금</option>
                                    <option value="MU">이용문의</option>
                                    <option value="ME">기타문의</option>
                                </select>
                            </td>
                        </tr>

                        <tr><td height="20px"></td></tr>

                        <tr>
                            <th>제목</th>              
                            <td><input type="text" placeholder="제목을 입력해주세요" name="qTitle" id="qTitle"></td>
                        </tr>

                        <tr><td height="20px"></td></tr>

                        <tr>
                            <th>내용</th>
                            <td colspan="2">
                                <textarea name="qContent" id="qContent" cols="30" rows="10" placeholder="내용을 입력해주세요"></textarea>
                            </td>
                        </tr>

                        <tr><td height="10px"></td></tr>

                        <tr>
                            <th>첨부파일</th>
                            <td><input type="file" name="upfile"></td>

                        </tr>

                        <tr><td height="10px"></td></tr>

                        <tr style="display:none">
                            <th>답변</th>
                            <td colspan="2">
                                <textarea name="" id="aContent" cols="30" rows="10">답변</textarea>
                            </td>
                        </tr>

                    </table>
    
                    <br><br>
                    <div align="center">
                        <button type="submit" class="btn btn-danger" style="width:90px;">확인</button>&nbsp&nbsp
                        <button type="button" class="btn btn-outline-danger" style="width:90px;">취소</button>
                    </div>
                    <br><br><br><br>
                </form>

            </div>
        </div>


</body>
</html>