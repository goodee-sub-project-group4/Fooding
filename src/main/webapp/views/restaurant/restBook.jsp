<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		/* ↓↓↓ 기본골격용 스타일들 */
		#outer2 {
			width:1200px;
			height: 800px;
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
			right:10px;
		}
		/* ↓↓↓ 컨텐츠용 스타일 */
		table td, table th {
			margin:auto;
			text-align: center;
			line-height: 20px;
		}
		table th {
			background-color: lightgray;
		}
		button:hover {
			cursor: pointer;
		}
	</style>
</head>
<body>
	<%@ include file="restHead.jsp" %>
	<div id="outer2">
		<!-- <iframe src="restMenubar.jsp"></iframe> -->
		<div id="menubar">
			<%@ include file="restMenubar.jsp" %>
		</div>
		<div id="content" class="container">
			<!-- 컨텐츠 작성부 -->
			<br><br><br><br><br>
			<table class="table">
				<thead>
					<tr>
						<th><input type="checkbox"></th>
						<th>번호</th>
						<th>예약번호</th>
						<th>접수날짜</th>
						<th>성명</th>
						<th>예약날짜</th>
						<th>예약시간</th>
						<th>상태</th>
						<th><button class="btn btn-danger bt-sm">상세정보</button></th>
					</tr>
			</thead>
			<tbody>
					<tr>
						<td><input type="checkbox"></td>
						<td>10</td>
						<td>2</td>
						<td>2023/01/11</td>
						<td>강백호</td>
						<td>2023/02/15</td>
						<td>15:00</td>
						<td>예약완료</td>
						<td><button class="btn btn-danger bt-sm">상세정보</button></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>10</td>
						<td>2</td>
						<td>2023/01/11</td>
						<td>강백호</td>
						<td>2023/02/15</td>
						<td>15:00</td>
						<td>예약완료</td>
						<td><button class="btn btn-danger bt-sm">상세정보</button></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>10</td>
						<td>2</td>
						<td>2023/01/11</td>
						<td>강백호</td>
						<td>2023/02/15</td>
						<td>15:00</td>
						<td>예약완료</td>
						<td><button class="btn btn-danger bt-sm">상세정보</button></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>10</td>
						<td>2</td>
						<td>2023/01/11</td>
						<td>강백호</td>
						<td>2023/02/15</td>
						<td>15:00</td>
						<td>예약완료</td>
						<td><button class="btn btn-danger bt-sm">상세정보</button></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>10</td>
						<td>2</td>
						<td>2023/01/11</td>
						<td>강백호</td>
						<td>2023/02/15</td>
						<td>15:00</td>
						<td>예약완료</td>
						<td><button class="btn btn-danger bt-sm">상세정보</button></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>10</td>
						<td>2</td>
						<td>2023/01/11</td>
						<td>강백호</td>
						<td>2023/02/15</td>
						<td>15:00</td>
						<td>예약완료</td>
						<td><button class="btn btn-danger bt-sm">상세정보</button></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>10</td>
						<td>2</td>
						<td>2023/01/11</td>
						<td>강백호</td>
						<td>2023/02/15</td>
						<td>15:00</td>
						<td>예약완료</td>
						<td><button class="btn btn-danger bt-sm">상세정보</button></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>10</td>
						<td>2</td>
						<td>2023/01/11</td>
						<td>강백호</td>
						<td>2023/02/15</td>
						<td>15:00</td>
						<td>예약완료</td>
						<td><button class="btn btn-danger bt-sm">상세정보</button></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>10</td>
						<td>2</td>
						<td>2023/01/11</td>
						<td>강백호</td>
						<td>2023/02/15</td>
						<td>15:00</td>
						<td>예약완료</td>
						<td><button class="btn btn-danger bt-sm">상세정보</button></td>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>10</td>
						<td>2</td>
						<td>2023/01/11</td>
						<td>강백호</td>
						<td>2023/02/15</td>
						<td>15:00</td>
						<td>예약완료</td>
						<td><button class="btn btn-danger bt-sm">상세정보</button></td>
					</tr>
				</tbody>	
			</table>
			
		</div>
		
	</div>
	<script>
		$(function(){
			$('#title').text("예약관리");
			$('#menu1').click();
		})
	</script>
</body>
</html>