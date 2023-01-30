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
			/* position: relative; */
			margin:auto;
		}			
		#content {
			width:950px;
			/* display: inline-block; */
			box-sizing: border-box;
			/* position:absolute; */
			/* right:10px; */
			float: right;
			border:2px solid pink;
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
		#menu-list {
			height:260px;
			border:2px solid green;
		}
		
	</style>
</head>
<body>
	
	<%@ include file="head.jsp" %>
	<div id="outer2">
		<div id="menubar">
			<%@ include file="menubar.jsp" %>
		</div>
		<div id="content"><br><br><br>
			<!-- 컨텐츠 작성부 -->
			<div id="menu-outer">
				<div id="menu-list">
						
					<div class="menu-box">
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
							<!-- 메뉴갯수를 넘기는 태그 -->
							<input type="hidden" name="count" value="0"> 
						</div>
						<br clear="both"><br><br><br><br>
					</div><br><br>

				</div>

				<form action="<%=contextPath %>/menuInsert.re" method="post" enctype="multipart/form-data">
				

					<div id="menu-new">
						<div id="firstone"></div>
		
					</div>
		
					<div align="center"><br><br>
						<button type="button" class="btn btn-outline-danger" onclick="addMenu();">메뉴추가</button>
						<button type="submit" class="btn btn-danger">저장</button>
						<button type="button" class="btn btn-secondary">다음에하기</button>
					</div>
					
				</form>
			</div>
			
			
		</div>
	</div>
	<br clear="both"><br><br><br><br><br><br>
	<div id="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>	
	<script>
		$(function(){
			// Head.jsp 내의 요소, #title의 문구를 변경한다.
			$('#title').text("메뉴정보");
			$("#menu2").addClass("active");
			$("#menu2_3").addClass("active");
		})

		//파일첨부 버튼 숨기고 button에 클릭효과 주기
		$('#menu-outer').on('click', 'button', function(){
			$(this).next().children().click();
		})

		//파일첨부 시 미리보기 띄우기
		$('#menu-outer').on('change','input[type=file]', function(){
			//순번 저장, 순번이 1자리수를 초과하는 경우도 커버할 수 있도록 코드설정
			// let num = $(this).attr('name').charAt(4);
			let name = $(this).attr('name');
			let num = name.substr(4, name.length);
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
		let count=0;
		function addMenu() {
			
			//메뉴요소 추가하기
			$('#firstone').append(
			$('<div class="menu-box new-box" >'+
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
					'<input type="hidden" name="count" value="'+ count++ +'"> '+
				'</div>'+
			'</div>')
			);
			//메뉴 추가될때마다 높이 늘리기 + count늘리기
			$('#menu-outer').css("height", 270*(count));
			}
	</script>
</body>
</html>