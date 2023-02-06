<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.fd.admin.model.vo.Question" %>
<%
	ArrayList<Question> listR = (ArrayList<Question>)request.getAttribute("listR");
	ArrayList<Question> listA = (ArrayList<Question>)request.getAttribute("listA");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일대일 문의 리스트</title>
<style>
	#content2-padding {width: 900px; height: 800px; margin: auto; margin-top: 45px; padding: 20px; box-sizing:border-box; float:left;}
    /* #content2-padding div {border:1px solid green;} */
    #notice-area {width: 100%; height: 135px; font-size: 30px; text-align: center; display: inline-block;}
	/* 상단타이틀 */
    #question-list {height: 60px; border-bottom: black; position:relative;}
    #question-list button {width:160px; height:60px; font-size:20px; font-weight:500; background-color:transparent; border:none;
     padding-bottom: 50px; color:red;}
    #question-list button:hover {font-weight:600;}
    #question-list input {width:60px; height:35px; padding:3px; position:absolute; right:24px; bottom:10px;}

    #list-area {height: 650px;}
    .table {text-align:center;}
    #num {text-align: right; padding-right:5px;}

    /*페이징바*/
    .pagination a{color:red;}
    
    .done {color:red;}


</style>
</head>
<body>

	<%@ include file="/views/common/head.jsp" %>
    <%@ include file="/views/common/customerServiceSidebar.jsp" %>
    
        <div id="content2-padding">
            <div id="notice-area">
                <b>내가 쓴 1 : 1 문의</b>
            </div>
            <div id="question-list">
                <button type="button" id="res-btn">매장 문의</button>
                <button type="button" id="admin-btn">관리자 문의</button>
                <input type="button" class="btn btn-outline-danger" value="삭제">
            </div>
            <div id="list-area">
                <table class="table">
                    <thead>
                        <tr>
                            <th colspan="2" width="60px" id="num">번호</th>
                            <th width="450px">제목</th>
                            <th width="110px">작성일</th>
                            <th width="110px">상태</th>
                            <th width="110px">수정버튼</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                        <!-- 문의한 내역이 없을 경우 -->
                        <!-- <tr>
                            <td colspan="5"><b>문의한 내역이 없습니다.</b></td>
                        </tr> -->
                        
                    
                        <!-- 문의한 내역이 있을 경우 -->
                        <% for(Question qR : listR) { %>
                        <tr class="res-list">
                            <td><input type="checkbox" style="accent-color:red; width:20px; height:20px; margin-top:3px; "></td>
                            <td><%=qR.getqNo()%></td>
                            <td><%=qR.getqTitle()%></td>
                            <td><%=qR.getCreateDate()%></td>
                            <td class="status"><%=(qR.getStatus().equals("Y")) ? "처리완료" : "처리중" %></td>
                            <td><input type="button" class="btn btn-outline-danger" value="수정" style="margin-top:-5px;"></td>
                        </tr>
                       <% } %>
                        
                       <% for(Question qA : listA) { %>
                        <tr class="admin-list">
                            <td><input type="checkbox" style="accent-color:red; width:20px; height:20px; margin-top:3px; "></td>
                            <td><%=qA.getqNo()%></td>
                            <td><%=qA.getqTitle()%></td>
                            <td><%=qA.getCreateDate()%></td>
                            <td style="color:red;"><%= (qA.getStatus().equals("Y")) ? "처리완료" : "처리중" %></td>
                            <td><input type="button" class="btn btn-outline-danger" value="수정" style="margin-top:-5px;"></td>
                        </tr>
                        <% } %>
                        
                    </tbody>	
                </table>

            </div>

            <div>
                <ul class="pagination justify-content-center" style="margin:50px 0px;">
                    <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                </ul>
            </div> 
            <br><br><br>

        </div>
        
       <script>
       		$(function() {
       			$(".status").each(function() {
       				if($(this).text() == "처리중") {
       					$(this).addClass("done");
       				}
       			});
       		});
       
	     	// 업체 버튼 클릭시
	        $("#res-btn").click(function() {
	            $(".res-list").show();
	            $(".admin-list").hide();
	        });
	        // 관리자 버튼 클릭시
	        $("#admin-btn").click(function() {
	        	$(".admin-list").show();
	            $(".res-list").hide();
	        });
	       
        </script>
        

</body>
</html>