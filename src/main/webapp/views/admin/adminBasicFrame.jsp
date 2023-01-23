<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.wrap{
			width: 1200px;
			margin: auto;
		}
		.wrap>div{
			width: 100%;
		}
		#header{
			height: 20%;
		}
		#outer2{
			height: 80%;
		}
		#outer2>div{
			float: left;
		}
		
		/* ↓↓↓ 기본골격용 스타일들 */
		#outer2{
			width: 100%;
			/* width:1200px; */
			/* height: 800px; */
			position: relative;
			margin:auto;
		}			
		/*#outer2>iframe {
			border-width:0px;
			width:100%;
			height: 100%;
			z-index: 1000;
			position: absolute;
		}*/
		#menubar {
			border-width:0px;
			width:100%;
			height: 100%;
			z-index: 1000;
			position: absolute;
		}
		#content {
			/* border: 3px solid blue; */
			width:950px;
			display: inline-block;
			box-sizing: border-box;
			position:absolute;
			right:160px;
			margin: auto;
			
		}
		/* ↓↓↓ 컨텐츠용 스타일 */
	</style>
</head>
<body>
	<div class="wrap">
		<div id="header">
			<%@ include file="adminHead.jsp" %>
		</div>
		<div id="outer2">
			<!-- <iframe src="adminMenubar.jsp"></iframe> -->
			<div id="menubar">
				<%@ include file="adminMenubar.jsp" %>
			</div>
			<div id="content">
				<!-- 컨텐츠 작성부 -->
				
				
			</div>
		</div>
	</div>
	<script>
		$(function(){
			$('#title').text("변경할 제목 입력");
		})
	</script>
</body>
</html>