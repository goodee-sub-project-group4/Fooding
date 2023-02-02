<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%
	ArrayList<Menu> list = (ArrayList<Menu>)request.getAttribute("list");
	int oldCount = list.size(); //기존 메뉴의 갯수
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
			margin:auto;
		}			
		#content {
			width:950px;
			box-sizing: border-box;
			float: right;
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
			width:650px;
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
		.photo { /*사진등록영역*/
			float:right;
			position:absolute;
			right:80px;
			top:10px; 
		}
		.photo button {
			margin-top: 10px;
		}
		.delete { /*삭제버튼영역*/
			float:right;
		}
		.delete img { /*삭제버튼*/
			width:30px;
			position:relative;
			bottom:110px;
		}
		.delete img:hover, .delete-for-new img:hover {
			cursor: pointer;
		}

		#menu-list { /*전체메뉴감싸는 div*/
			height:(260*<%=oldCount%> + 50)px;
		}
		.new-box-set {
			border: 2px solid crimson;
			width:660px;
			margin:auto;
			position: relative;
			right:20px;
			margin-top: 30px;
			display:none;
		}
		.new-box-set p { /*문구 : 추가된메뉴*/
			margin-top: 30px;
			font-size: 24px;
			font-weight: 600;
			line-height: 34px;
			color: lightgray;
			text-align: center;
		}
		.delete-for-new img { /*추가된 메뉴 삭제*/
			width:30px;
			float:right;
			position:relative;
			bottom:75px;
			right:25px;
		}
		.new-box {
			position: relative;
			left:20px;
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
			<form action="<%=contextPath %>/menuUpdate.re" method="post" enctype="multipart/form-data">
				<div id="menu-list">
					<input type="hidden" name="oldCount" value="<%=oldCount%>">
					<% for(int i=0; i<list.size(); i++) { %>	
					<div class="menu-box" id="<%=list.get(i).getMenuNo()%>" >
						<input type="hidden" name="number<%=i%>" value="<%=list.get(i).getMenuNo()%>">
						<div class="text-box">
							<span>메뉴명 </span><span style="color:crimson">* </span>
							<input name="name<%=i%>" type="text" value="<%=list.get(i).getMenuName()%>" required><br>
						</div><br>
						<div class="text-box">
							<span>가격 </span><span style="color:crimson">* </span>
							<input name="price<%=i%>" type="text" value="<%=list.get(i).getPrice()%>" required><br>
						</div><br>
						<div class="text-box">
							<span>설명</span>
							<input type="text" name="describe<%=i%>" value="<%=(list.get(i).getMenuDes()==null)? "" : list.get(i).getMenuDes()%>"><br>
						</div>
						<div class="photo" align="center">
							<img id="image<%=i%>" src="<%= list.get(i).getmImg()%>" class="rounded" width="180" height="180"><br>
							<button type="button" class="btn btn-outline-danger">사진등록</button>
							<div style="display:none">
								<input type="hidden" name="oldfile<%=i%>" value="<%= list.get(i).getmImg()%>">
								<input type="file" name="file<%=i%>">
								<input type="hiddden" name="file-changed<%=i%>" value="no">
								<!-- 메뉴갯수를 넘기는 태그 -->
								<input type="hidden" name="count" value="<%=i%>"> 
							</div>
						</div>
						<div class="delete"> <!-- 삭제버튼 -->
							<img src="<%=contextPath%>/resources/images/xIcon.png" onclick="deleteMenu('<%= list.get(i).getMenuNo() %>');">
						</div>
					</div>
					<% } %>
					<div class="new-box-set">
						<p>추가된 메뉴</p><br>
						<div class="delete-for-new">
							<img src="<%=contextPath%>/resources/images/xIcon.png" onclick="removeNew();">
						</div>
						<div id="firstone"></div><!-- 이 뒤로 동적으로 생성된 메뉴가 추가된다. -->
					</div>	
					<div align="center"><br><br>
						<button type="button" class="btn btn-outline-secondary" onclick="resetMenu();">기존정보</button>						
						<button type="button" class="btn btn-outline-danger" onclick="addMenu();">새로운메뉴</button>
						<button type="submit" class="btn btn-danger">저장하기</button>
					</div>			
				</div>
			</form>					
		</div>
	</div>
	<br clear="both"><br><br><br><br><br><br><br><br><br><br><br><br>
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
		$('#menu-list').on('click', 'button', function(){
			$(this).next().children().click();
		})

		//파일첨부 시 미리보기 띄우기
		$('#menu-list').on('change','input[type=file]', function(){
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
				//기존메뉴에서는 사진이 바뀌었음을 의미한다. 해당 변화를 전달한다.
				$(this).next().val("yes");
			}
		})

		//새로운 메뉴 추가하기
		let count = <%=oldCount%>; //1)기존메뉴갯수로부터 시작되는 카운트
		function addMenu() {
			//2)안보였던 새메뉴 영역 보이게 하기
			$('.new-box-set').css("display", "block");

			//3)메뉴요소 추가하기
			$('#firstone').append(
			$('<div class="menu-box new-box">'+
				'<div class="text-box">'+
					'<span>메뉴명</span><span style="color:crimson">* </span>'+
					'<input type="text" name="name'+ count +'" required><br>'+
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
					'<input type="hidden" name="count" value="'+count+'">'+
				'</div>'+
			'</div>')
			);
			//4)메뉴 추가될때마다 높이 늘리기 + count늘리기
			$('#menu-list').css("height", 270*(++count));
		}

		//리셋버튼에 부여한 기능
		function resetMenu(){
			location.href="<%=contextPath%>/menu.re";
		}

		//새로운메뉴 전체삭제기능
		function removeNew(){
			$('.new-box').remove();
			count = <%=oldCount%>; //메뉴 카운트 초기화
			$('.new-box-set').css("display", "none");
			$('#menu-list').css("height", "260*<%=oldCount%>+50");
		}
		
		//기존메뉴 삭제기능
		function deleteMenu(menuNo){
			if($('.new-box-set').css("display")=="block") {
				//추가된 메뉴가 있는데 삭제를 진행될 경우 순번이 꼬여 오류발생함 => 메뉴추가 완료후 진행하라고 안내
				alert('추가된 메뉴를 저장하거나 삭제한 후에 진행해주세요');
			}else {
				if(confirm('해당 메뉴를 삭제하시겠습니까? 삭제 후 복원이 불가합니다.')){
					location.href="<%=contextPath%>/deleteMenu.re?menuNo="+menuNo;
				}
			}
		}
		
	</script>
</body>
</html>