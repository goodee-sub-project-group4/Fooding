<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		#outer2 {
			width:1200px;
			margin:auto;
		}		
		#footer {
			width:1200px;
			margin:auto;
		}
		.guide {
			text-align: center;
			color:gray;
			font-size: 20px;
		}
		.menu-box {
			width:580px;
			height:250px;
			position:relative;
			margin:auto;
			margin-bottom: 20px;
			padding:15px;

		}
		.text-box {
			display: inline-block;
			width:320px;
			height:34px;
			margin-top:18px;
		}
		.text-box>span {
			font-size: 20px;
			font-weight: 600;
			line-height: 34px;
			color:rgb(75, 75, 75);
		}
		.text-box>input {
			width: 200px;
			height:28px;
			float: right;
			font-size: 16px;
			margin-top: 3px;
			color: gray;
		}
		.photo {
			float:right;
			position:absolute;
			right:10px;
			top:10px; 
		}
		.photo button {
			margin-top: 10px;
		}
		#menu-outer {
			height:260px;
		}
		
		
	</style>
</head>
<body>
	
	<%@ include file="head.jsp" %>
	<div id="outer2">
		<br><br><br><br>
		<div class="guide">
			입점을 환영합니다!<br>
			(3단계/3단계) 메뉴를 하나씩 등록해주세요.
		</div><br><br>

		<form action="/menuInsert.re" method="get" enctype="multipart/form-data">
			

			<div id="menu-outer">
				
				<div id="firstone" class="menu-box">
					<div class="text-box">
						<span>메뉴명 </span><span style="color:crimson">* </span>
						<input name="name0" type="text" required><br>
					</div><br>
					<div class="text-box">
						<span>가격 </span><span style="color:crimson">* </span>
						<input name="price0" type="text" required><br>
					</div><br>
					<div class="text-box">
						<span>설명</span>
						<input type="text" name="describe0"><br>
					</div>
					<div class="photo" align="center">
						<img id="image0" src="/Fooding/resources/images/forTest.png" class="rounded" width="180" height="180"><br>
						<button type="button" class="btn btn-outline-danger">사진등록</button>
						<div style="display:none"><input type="file" name="file0"></div>
					</div>
					<br clear="both"><br><br><br><br>
				</div><br><br>

			</div>

			<div align="center"><br><br>
				<button type="button" class="btn btn-outline-danger" onclick="addMenu();">메뉴추가</button>
				<button type="submit" class="btn btn-danger">저장</button>
				<button type="button" class="btn btn-secondary">다음에하기</button>
			</div>
			
		</form>
		
	</div>
	<br><br><br><br><br><br><br><br><br><br><br>
	<div id="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>	
	<script>
		$(function(){
			// Head.jsp 내의 요소, #title의 문구를 변경한다.
			$('#title').text("");
		})

		//파일첨부 버튼 숨기고 button에 클릭효과 주기
		$('#menu-outer').on('click', 'button', function(){
			$(this).next().children().click();
		})

		//파일첨부 시 미리보기 띄우기
		$('#menu-outer').on('change','input[type=file]', function(){
			//순번을 저장
			let num = $(this).attr('name').charAt(4);
			//이벤트 객체를 저장
			const inputFile = event.target;
			//파일이 선택된경우에만 미리보기 실행
			if(inputFile.files.length == 1 ) {				
				const reader = new FileReader();
				reader.readAsDataURL(inputFile.files[0]);
				reader.onload = function(e){
					console.log(e.target.result);
					$('#image'+num).attr('src', e.target.result);
				}
			}
		})

		//메뉴추가버튼 클릭시 메뉴div를 추가해주는 메소드
		let count=1;
		function addMenu() {
			$('#firstone').append(
			$('<div class="menu-box new-box" style="right:16px">'+
				'<div class="text-box">'+
					'<span>메뉴명</span><span style="color:crimson">* </span>'+
					'<input type="text" name="name'+count+'" required><br>'+
				'</div><br>'+
				'<div class="text-box">'+
					'<span>가격 </span><span style="color:crimson">* </span>'+
					'<input type="text" name="price'+count+'" required><br>'+
				'</div><br>'+
				'<div class="text-box">'+
					'<span>설명</span>'+
					'<input type="text" name="describe'+count+'"><br>'+
				'</div>'+
				'<div class="photo" align="center">'+
					'<img id="image'+count+'" src="/Fooding/resources/images/forTest.png" class="rounded" width="180" height="180"><br>'+
					'<button type="button" class="btn btn-outline-danger">사진등록</button>'+
					'<div style="display:none"><input type="file" name="file'+count+'"></div>'+
				'</div>'+
			'</div>')
			);
			//메뉴 추가될때마다 높이 늘리기 + count늘리기
			$('#menu-outer').css("height", 260*(1+count++));
		}
		
	</script>
</body>
</html>