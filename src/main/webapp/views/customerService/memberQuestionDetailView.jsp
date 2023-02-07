<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fd.customerService.model.vo.Attachment, com.fd.admin.model.vo.Question" %>
<%
	Question q = (Question)request.getAttribute("q");
	Attachment at = (Attachment)request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 상세보기</title>
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
                            	<script>
                                    $(function(){
                                        let category = "<%= q.getCategory()%>"
                                        $("#qCategory option").each(function() {
                                            if($(this).val() == category){
                                                $(this).val(category).prop('selected', true)
                                            }
                                        });
                                    })
                            	</script>
                            	
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
                            <td><input type="text" placeholder="제목을 입력해주세요" name="qTitle" id="qTitle" readonly value="<%=q.getqTitle()%>"></td>
                        </tr>

                        <tr><td height="20px"></td></tr>

                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="qContent" id="qContent" cols="30" rows="10" placeholder="내용을 입력해주세요" style="resize:none" readonly><%=q.getqContent()%></textarea>
                            </td>
                        </tr>

                        <tr><td height="10px"></td></tr>

                        <tr>
                            <th>첨부파일</th>
                            <% if(at == null) { %>
                            <!-- 첨부파일이 없을 때 -->
                            <td>&nbsp&nbsp<b>첨부파일이 없습니다.</b></td>
                            <% } else { %>
                            <!-- 첨부파일이 있을 때 -->
                            <td ><a href=""><%=at.getOriginName()%></a></td>
							<% } %>
                        </tr>

                        <tr><td height="10px"></td></tr>

                        <tr>
                            <th>답변</th>
                            <td colspan="2">
                                <textarea name="aContent" id="aContent" cols="30" rows="10" style="resize:none" placeholder="아직 답변내용이 없습니다."><%=(q.getaContent() == null)? "" : q.getaContent()%></textarea>
                            </td>
                        </tr>

                    </table>
    
                    <br><br>
                    <div align="center">
                        <button type="button" class="btn btn-danger" style="width:90px;" onclick="location.href='<%=contextPath%>/question.me'">확인</button>
                        <button type="button" class="btn btn-outline-danger" style="width:90px;">수정</button>
                        <button type="button" class="btn btn-outline-danger" style="width:90px;">삭제</button>
                    </div>
                    <br><br><br><br>
                </form>
                

            </div>
        </div>

</body>
</html>