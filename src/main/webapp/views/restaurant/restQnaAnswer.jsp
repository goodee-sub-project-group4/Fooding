<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.fd.admin.model.vo.Question" %>
<%
	Question q = (Question)request.getAttribute("q");
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
        #post-info { /*상단 작성일, 아이디, 문의유형, 처리결과 */
            /* border:2px solid pink; */
            width:200px;
            position: relative;
            left: 600px;
        }
        #post-info span { /*상단 데이터분류 영역*/
            font-size: 16px;
            color:gray;
            margin:10px;
        }
        #post-info label { /*상단 데이터 영역*/
            font-size:16px;
            float: right;
        }
        #post-qna { /*제목, 질문, 답변 영역*/
            width:700px;
            /* border:2px solid blue; */
            margin: auto;
            padding:20px;
        }
        #post-qna input {
            width:100%;
        }
        #post-qna textarea {
            width:100%;
            resize: none;
        }
        #post-qna h4 {
            /* margin:20px; */
            color:gray;
            font-weight: 600;
        }
        #post-qna button {
            float: right;
            margin-left:10px;
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
            <div id="post-info">
                <span>작성일</span><label><%=q.getCreateDate() %></label><br>
                <span>작성자Id</span><label><%=q.getqPerson() %></label><br>
                <span>문의유형</span><label><%=q.getCategory() %></label><br>
                <span>처리결과</span><label><%=(q.getStatus().equals("Y"))? "답변완료" : "미답변"%></label><br>
            </div>

            <div id="post-qna">
                <h4>제목</h4>
                <input type="text" value="<%=q.getqTitle() %>" readonly><br><br>
                <h4>내용</h4>
                <textarea cols="30" rows="10" readonly><%=q.getqContent() %></textarea><br><br>
                <form action="<%=contextPath%>/updateAnswer.re">
                	<input type="hidden" name="qNo" value="<%=q.getqNo()%>">
                    <h4>답변</h4>
                    <textarea rows="10" name="aContent" <%=(q.getStatus().equals("Y"))? "readonly" : ""%> ><%=(q.getaContent()==null)? "" : q.getaContent() %></textarea>
                    <br><br>
                    <button type="submit" class="btn btn-danger" <%=(q.getStatus().equals("Y"))? "disabled" : ""%>>답변하기</button>
                    <button type="reset" class="btn btn-outline-secondary" onclick="location.href='<%=contextPath%>/qna.re'">목록</button>
                </form>
            </div>

            

            
			







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