<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.fd.common.model.vo.Attachment
			   , com.fd.restaurant.model.vo.Restaurant" %>
<%
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #content1-padding{width: 20%; height: 500px;}
  	#content2-padding {width: 900px; margin: auto; margin-top: 45px; padding: 20px; box-sizing:border-box; float: left;}
  
    #main-area {
        float:left;
        box-sizing: border-box;
        /* border:2px solid green; */
        width:890px;
        height:1200px;
        padding-top: 5px;
        padding-left: 24px;
        padding-right: 24px;
    }

    /* 메인영역 */
    #area1 { /*배너*/
        width:94%;
        position: relative;
        left:26px;
    }
	/*<!--부트스트랩으로 기능구현 어려우면 다씨 써야되니까 지우지 말기!-->*/
	/*
    #banner {
        width:400%;
        height: 250px;
        margin:auto;
    }
    #prevButton {
        position: absolute;
        left:10px;
        bottom:100px;
    }
    #nextButton {
        position: absolute;
        right:10px;
        bottom:100px;
    }
	*/
	/*메인배너 부트스트랩*/
	.carousel-inner img {
    width: 791.47px;
    height: 250px;
  	}
	
    #area2, #area3, #area4 { /* 리뷰, 별점, 지역*/
        /* border: 2px solid pink; */
        box-sizing: border-box;
        margin:auto;
        width:100%;
        height:250px;
        margin-top: 20px;
        font-size: 12px;
    }
    #area2>h2, #area3>h2, #area4>h2 {
        text-align: center;
        font-size: 24px;
        color: rgb(68, 68, 68);
    }
    .restaurant {
        width:264px;
        /* border: 1px solid red; */
        padding:12px;
        display: inline-block;
        margin:4px;
    }
    .restaurant img { /*대표이미지*/
        width:240px;
        height: 170px;   
    }
    .rest-name {
        font-weight: 600;
        float: left;
    }

</style>
	<script>

	</script>
</head>
<body>

	<%@ include file="views/common/head.jsp" %>
	<%@ include file="views/common/searchSidebar.jsp" %>
	
	<script>
		$(function(){
			$.ajax({
                url:"<%= contextPath %>/banner.ad",
                type:"post",
                success:function(list){
               		for(let i=0; i<list.length; i++) { 
               			$('#banner'+i).attr('src', list[i].filePath + '/' + list[i].changeName);
               		} 
                }
            });

			// 별점 순
			$.ajax({
				url:"<%= contextPath %>/selectRest.ra",
				type:"post",
				success:function(restStar){
					let list = "";
					for(let i=0; i<3; i++) {
						if(restStar[i] != null){
							list += "<form class='restaurant' action='<%= contextPath %>/main.bo' method='POST' onclick='selectRes(this)'>"
								<% if(loginUser != null) { %>
									+ "<input type='hidden' name='resNo' value='" + restStar[i].resNo + "'>"	
									+ "<input type='hidden' name='userNo' value='" + <%= loginUser.getUserNo() %> + "'>"
							  	<% }else{ %>
									+ "<input type='hidden' name='resNo' value='" + restStar[i].resNo + "'>"
									+ "<input type='hidden' name='userNo' value='0'>"	
							  	<% } %>
									+ "<img src=" + restStar[i].rImg + "><br>"
									+ "<span class='rest-name'>" + restStar[i].resName + "</span><span style='float:right;'>★" + Math.round(restStar[i].reviewAvg * 100) / 100 + " (" + restStar[i].count + ")</span><br>"
								 + "</form>"
						}
					}
					$('#starBest').html(list);
				}
			});

			// 조회수 순
			$.ajax({
				url:"<%= contextPath %>/selectRest.rc",
				type:"post",
				success:function(restCount){
					let list = "";
					for(let i=0; i<3; i++) {
						if(restCount[i] != null){
							list += "<form class='restaurant' action='<%= contextPath %>/main.bo' method='POST' onclick='selectRes(this)'>"
								<% if(loginUser != null) { %>
									+ "<input type='hidden' name='resNo' value='" + restCount[i].resNo + "'>"	
									+ "<input type='hidden' name='userNo' value='" + <%= loginUser.getUserNo() %> + "'>"
							  	<% }else{ %>
									+ "<input type='hidden' name='resNo' value='" + restCount[i].resNo + "'>"	
									+ "<input type='hidden' name='userNo' value='0'>"
							  	<% } %>
									+ "<img src=" + restCount[i].rImg + "><br>"
									+ "<span class='rest-name'>" + restCount[i].resName + "</span><span style='float:right;'>★" + Math.round(restCount[i].reviewAvg * 100) / 100 + " (" + restCount[i].count + ")</span><br>"
								 + "</form>"
						}
					}
					$('#reviewCount').html(list);
				}
			});
		});

		// 식당 조회
		function selectRes(value){
			$(value).submit();
			console.log($(value).children('input[name=userNo]').val())
		}
	</script>
   
	<!-- 메인영역 -->
	<div class="wrap">
		<div id="main-area">
		    <div id="area1">
				<!--부트스트랩으로 기능 구현 어려우면 다씨 써야되니까 지우지 말기!-->
		        <!-- <img id="prevButton" src="/Fooding/resources/images/prevButton.png" width="50">
		        <img id="banner" src="/Fooding/resources/images/forTest.png">
		        <img id="nextButton" src="/Fooding/resources/images/nextButton.png" width="50"> -->

				<!--메인배너 부트스트랩-->
				<div id="demo" class="carousel slide" data-ride="carousel">

					<!-- Indicators -->
					<ul class="carousel-indicators">
						<li data-target="#demo" data-slide-to="0" class="active"></li>
						<li data-target="#demo" data-slide-to="1"></li>
						<li data-target="#demo" data-slide-to="2"></li>
					</ul>
					
					<!-- The slideshow -->
					<div class="carousel-inner">
						<div class="carousel-item active" >
							<img id="banner0" src="" alt="" width="791.47" height="250">
						</div>
						<div class="carousel-item">
							<img id="banner1" src="" alt="" width="791.47" height="250">
						</div>
						<div class="carousel-item">
							<img id="banner2" src="" alt="" width="791.47" height="250">
						</div>
						
					</div>
					
					<!-- Left and right controls -->
					<a class="carousel-control-prev" href="#demo" data-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</a>
					<a class="carousel-control-next" href="#demo" data-slide="next">
					 	<span class="carousel-control-next-icon"></span>
					</a>
				</div>



		    </div><br>
		    <div id="area2" align="center">
		        <h2 >조회수 best </h2>
				<div id="reviewCount"></div>
		    </div>
		    <div id="area3" align="center">
		        <h2>별점 best </h2>
				<div id="starBest"></div>
		    </div>
		
		<%@ include file="views/common/footer.jsp" %>
	</div>

</body>
</html>