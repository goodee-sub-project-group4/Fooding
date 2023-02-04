<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.fd.admin.model.vo.Question" %>
<%
	ArrayList<Question> list = (ArrayList<Question>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		/* ↓↓↓ 기본골격용 스타일들 (수정할필요X) */
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
            padding:10px;
		}
		#menubar {
			border-width:0px;
			width:200px;
			height: 100%;
			z-index: 1000;
			position: absolute;
		}
		#footer {
			width:1200px;
			margin:auto;
		}
		/* ↓↓↓ 컨텐츠용 스타일 */
		.pagination a{ /*페이징바*/
            color:rgb(221,45,45);
        }
		table td, table th {
			margin:auto;
			text-align: center;
			vertical-align: middle;  
            line-height: 33px;   
        }
		table th {
			color:rgb(85, 85, 85);
		}
        .select {
            border: 1px solid gray;
            border-radius: 4px;
            width: 120px;
            height: 33px;
        }
        #keyword {
            float: right;
            border: 1px solid gray;
            border-radius: 4px;
            width: 150px;
            height: 33px;
            margin-left: 6px;
        }        
        #search-option {
            float: right;
        }
		.answer-yet {
			color: dodgerblue;
		}
		tr:hover {
			cursor:pointer;
		}
	</style>
</head>
<body>
	
	<%@ include file="head.jsp" %>
	<div id="outer2">
		<div id="menubar">
			<%@ include file="menubar.jsp" %>
		</div>
		<div id="content">
			<!-- 컨텐츠 작성부 -->
			<br>

            <select id="question-type" class="select">
                <option value="">전체문의</option>
                <option value="">이용문의</option>
				<option value="">예약문의</option>
            </select><br>

            
            <br>
			<table class="table table-hover">
				<thead>
					<tr class="table-secondary">
						<th>순번</th>
						<th>작성일</th>
						<th>작성자ID</th>
						<th>문의유형</th>
						<th>제목</th>
						<th>처리결과</th>
					</tr>
                </thead>
                <tbody>
                	<% for(int i=0; i<list.size(); i++) { %>
                    <tr onclick="location.href='<%=contextPath%>/qnaDetail.re?no='+<%=list.get(i).getqNo() %>">
                        <td><%=list.size()-i %></td>
                        <td><%=list.get(i).getCreateDate() %></td>
                        <td><%=list.get(i).getqPerson() %></td>
						<td><%=list.get(i).getCategory() %></td>
                        <td><%=list.get(i).getqTitle() %></td>
                        <% if(list.get(i).getStatus().equals("N")) { %>
                        	<td class="answer-yet">미답변</td>
                        <% }else { %>
                        	<td>답변완료</td>
                        <% } %>
                    </tr>
					<% } %>
                </tbody>	
			</table><br><br>
			
			<!--페이징바-->
            <ul class="pagination justify-content-center" style="margin:20px 0">
                <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
            </ul> 
		</div>
	</div>
	<br><br><br><br><br><br><br>
	<div id="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>	
	<script>
		$(function(){
			// Head.jsp 내의 요소, #title의 문구를 변경한다.
			$('#title').text("문의답변");
			$("#menu2").addClass("active");
			$("#menu2_4").addClass("active");
		})
		

	</script>
</body>
</html>