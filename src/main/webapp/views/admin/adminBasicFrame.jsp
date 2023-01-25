<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			width: 220px;
			height: 100%;
			z-index: 1000;
			position: absolute;
		}
		/* ↓↓↓ 컨텐츠용 스타일 */
	</style>
</head>
<body>
	
	<%@ include file="adminHead.jsp" %>
	<div id="outer2">
		<div id="menubar">
			<%@ include file="adminMenubar.jsp" %>
		</div>
		<div id="content">
			<!-- 컨텐츠 작성부 -->
			
			
		</div>
	</div>
	<script>
		$(function(){
			// Head.jsp 내의 요소, #title의 문구를 변경한다.
			$('#title').text("변경할 제목 입력");
			// Menubar.jsp 내의 요소, 메뉴를 클릭한 효과를 준다(배경색 진하게)
			$('#메뉴아이디').click();

			// Menubar.jsp 내의 요소, 스타일이 include시 바뀌는 버그를 수정하기 위한 코드(건들필요X)
			$('#page-name').css({"font-size":"28px", "font-weight":600, "margin-left":"10px", "margin-top":"5px"});

		})
	</script>
</body>
</html>