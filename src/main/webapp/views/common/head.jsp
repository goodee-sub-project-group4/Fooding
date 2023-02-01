<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fd.member.model.vo.Member" %>
<%
	String contextPath = request.getContextPath(); // /Fooding
	String alertMsg = (String)session.getAttribute("alertMsg"); // Alert

	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤드</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    /* 가로 규격 */
    .wrap{width: 1200px; margin:auto;}

    /* 헤드바 */
    #header1-padding, #header2-padding, #header3-padding{float:left; box-sizing: border-box; padding: 5px; height: 150px;}
    /* 헤드바 왼쪽, 오른쪽 영역 */
    #header1-padding, #header3-padding{width: 25%;}
    /* 헤드바 가운데 */
    #header2-padding{width:50%; position: relative; }
    /* 헤드바 높이 */
    #header1, #header2, #header3{height: 100%;}

    /* 헤드바 왼쪽 영역 */
    #img-logo { padding:5px; margin:20px;}

    /* 헤드바 가운데 영역 */
    #search {text-align: center;  height:60px; line-height:25px; right:80px; padding:10px; position:absolute; top:40px;}
    #search input {height:40px; border-radius:3px;;}

    /* 헤드바 오른쪽 영역 */
    #header3-1, #header3-3 {width: 100%; height: 25%; box-sizing: border-box; text-align: right; color:black;}
    #header3-1 a {text-decoration:none;}
    #header3-2 {width:100%; height:50%; text-align:center; position:relative; cursor: pointer;}
    #header3-2 > #part1 {width:30%; height:60px; line-height:50px; position:absolute; left:60px;}
    #header3-2 > #part2 {width:30%; height:60px; line-height:50px; position:absolute; left:120px;}
    #header3-2 > #part3 {width:30%; height:60px; line-height:50px; position:absolute; left:180px;}
    /* 헤드바 오른쪽 하이퍼링크 */
    #header3-1 a {color:black; font-size:small;}
    /* 헤드바 오른쪽 메뉴 */
    #header3-1 button {border:none; background:white; font-size:small;}

    /* 밑라인 */
    .line { width:1200px; height:1px; background-color:rgb(231, 229, 229);}

</style>

</head>
<body>
	<!-- alert -->
	<% if(alertMsg != null) { %>
	<script>
		alert("<%=alertMsg%>");
	</script>
	<% session.removeAttribute("alertMsg"); %>
	<% } %>
	
	<div class="wrap">
        
        <div class="header">
            <!-- 헤더바1 로고 -->
            <div id="header1-padding">
                <div id="header1"><img id="img-logo" src="/Fooding/resources/images/logo.png" width="240" height="80" onclick="location.href='<%=contextPath%>'"></div>
            </div>

            <!-- 헤더바2 검색창 -->
            <div id="header2-padding">
                <form action="" id="header2-search">
                    <!-- 돋보기 클릭시 검색가능 -->
                    <div id="search">
                        <input type="text" name="keyword" size="45">&nbsp;&nbsp;<img src="/Fooding/resources/images/search.png" width="25" height="25" >
                    </div>
                </form>
            </div>

            <!-- 헤더바3-1  -->
            <div id="header3-padding">
				<% if(loginUser == null) { %>
                <div id="header3">
                    <!-- case1. 로그인 전 -->
                    <div id="header3-1">
                        <span><a href="<%= contextPath%>/enrollForm.me">회원가입</a></span>
                        <span>&nbsp;|&nbsp;</span>
                        <span><a href="<%= contextPath%>/loginForm.me">로그인</a></span>
                        <span>&nbsp;|&nbsp;</span>
                        <span>
                            <button type="button" data-toggle="dropdown">고객센터▼ &nbsp;</button>
                            <span class="dropdown-menu">
                                <a class="dropdown-item" href="#">공지사항</a>
                                <a class="dropdown-item" href="#">FAQ</a>
                                <a class="dropdown-item" href="#">1:1문의</a>
                                <a class="dropdown-item" href="<%= contextPath %>/enrollForm.re">업체등록</a>
                            </span>
                        </span>
                    </div>
				<% } else { %>
				
                    <!--  case2. 로그인 후 -->
                    <div id="header3-1">
                        <span><%= loginUser.getUserName() %>님</span>
                        <span>&nbsp;|&nbsp;</span>
                        <span>
                            <button type="button" data-toggle="dropdown">마이페이지</button>
                            <span class="dropdown-menu">
                            <a class="dropdown-item" href="#">예약/결제 내역</a>
                            <a class="dropdown-item" href="<%= contextPath%>/reviewList.re">리뷰</a>
                            <a class="dropdown-item" href="#">찜하기</a>
                            <a class="dropdown-item" href="#">적립금</a>
                            <a class="dropdown-item" href="<%= contextPath%>/myPageConfirmPwd.me">개인정보수정</a>
                            <a class="dropdown-item" href="<%= contextPath%>/logout.me">로그아웃</a>
                            </span>
                        </span>
                        <span>&nbsp;|&nbsp;</span>
                        <span class="dropdown">
                            <button type="button" data-toggle="dropdown">고객센터▼ &nbsp;</button>
                            <span class="dropdown-menu">
                                <a class="dropdown-item" href="#">공지사항</a>
                                <a class="dropdown-item" href="#">FAQ</a>
                                <a class="dropdown-item" href="#">1:1문의</a>
                                <a class="dropdown-item" href="<%= contextPath %>/enrollForm.re">업체등록</a>
                            </span>
                        </span>
                    </div>
				<% } %>
				<script>
                    $(function(){
                    	$("button[data-toggle=dropdown]").click(function(){
                    		let $span = $(this).next();
                    		let $parentSpan = $(this).parent();
                    		
                    		if($span.is(".show")){
                    			$span.removeClass("show");
                    			$parentSpan.removeClass("show")
                    		}else{
                    			$span.addClass("show");
                    			$parentSpan.addClass("show")
                    		}
                    	})
                    })   	
                </script>
                    <!-- 헤더바3-2 -->
                    <div id="header3-2">
                        <!-- 각 이미지 클릭시 찜하기, (최근 본 게시물,) 리뷰페이지로 이동가능 -->
                        <div id="part1"><img src="/Fooding/resources/images/heart.png" width="27" height="27"></div>
                        <div id="part2"><img src="/Fooding/resources/images/alert.png" width="35" height="35"></div>
                        <div id="part3"><img src="/Fooding/resources/images/review.png" width="30" height="30"></div>
                    </div>

                    <div id="header3-3"></div>

                </div>

            </div>

        </div>
        
    </div>

    <br><br><br><br><br>

    <hr class="line">


</body>
</html>