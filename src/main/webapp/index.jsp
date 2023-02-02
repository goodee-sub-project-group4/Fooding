<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.fd.common.model.vo.Attachment" %>
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
        height: 100px;   
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
						<div class="carousel-item active">
							<img src="" alt="" width="791.47" height="250">
						</div>
						<div class="carousel-item">
							<img src="" alt="" width="791.47" height="250">
						</div>
						<div class="carousel-item">
							<img src="" alt="" width="791.47" height="250">
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
		        <h2>리뷰 best ></h2>
		        <div class="restaurant">
		        	<a href="<%= contextPath %>/main.bo?resNo=1">
		            <img src="/Fooding/resources/images/forTest.png"><br>
		            <span class="rest-name">미미식당</span> <span style="float:right">★4.8(618)</span><br>
		            <span>레스토랑에 대한 설명..어쩌고 저쩌고..레스토랑에 대한 설명..어쩌고 저쩌고..</span>
		            </a>
		        </div>
		        <div class="restaurant">
		            <img src="/Fooding/resources/images/forTest.png"><br>
		            <span class="rest-name">뮤땅</span> <span style="float:right">★4.8(618)</span><br>
		            <span>레스토랑에 대한 설명..어쩌고 저쩌고..레스토랑에 대한 설명..어쩌고 저쩌고..</span>
		        </div>
		        <div class="restaurant">
		            <img src="/Fooding/resources/images/forTest.png"><br>
		            <span class="rest-name">뮤땅</span> <span style="float:right">★4.8(618)</span><br>
		            <span>레스토랑에 대한 설명..어쩌고 저쩌고..레스토랑에 대한 설명..어쩌고 저쩌고..</span>
		        </div>
		    </div>
		    <div id="area3" align="center">
		        <h2>별점 best ></h2>
		        <div class="restaurant">
		            <img src="/Fooding/resources/images/forTest.png"><br>
		            <span class="rest-name">뮤땅</span> <span style="float:right">★4.8(618)</span><br>
		            <span>레스토랑에 대한 설명..어쩌고 저쩌고..레스토랑에 대한 설명..어쩌고 저쩌고..</span>
		        </div>
		        <div class="restaurant">
		            <img src="/Fooding/resources/images/forTest.png"><br>
		            <span class="rest-name">뮤땅</span> <span style="float:right">★4.8(618)</span><br>
		            <span>레스토랑에 대한 설명..어쩌고 저쩌고..레스토랑에 대한 설명..어쩌고 저쩌고..</span>
		        </div>
		        <div class="restaurant">
		            <img src="/Fooding/resources/images/forTest.png"><br>
		            <span class="rest-name">뮤땅</span> <span style="float:right">★4.8(618)</span><br>
		            <span>레스토랑에 대한 설명..어쩌고 저쩌고..레스토랑에 대한 설명..어쩌고 저쩌고..</span>
		        </div>
		    </div>
		    <div id="area4" align="center">
		        <h2>지역별 best ></h2>
		        <div class="restaurant">
		            <img src="/Fooding/resources/images/forTest.png"><br>
		            <span class="rest-name">뮤땅</span> <span style="float:right">★4.8(618)</span><br>
		            <span>레스토랑에 대한 설명..어쩌고 저쩌고..레스토랑에 대한 설명..어쩌고 저쩌고..</span>
		        </div>
		        <div class="restaurant">
		            <img src="/Fooding/resources/images/forTest.png"><br>
		            <span class="rest-name">뮤땅</span> <span style="float:right">★4.8(618)</span><br>
		            <span>레스토랑에 대한 설명..어쩌고 저쩌고..레스토랑에 대한 설명..어쩌고 저쩌고..</span>
		        </div>
		        <div class="restaurant">
		            <img src="/Fooding/resources/images/forTest.png"><br>
		            <span class="rest-name">뮤땅</span> <span style="float:right">★4.8(618)</span><br>
		            <span>레스토랑에 대한 설명..어쩌고 저쩌고..레스토랑에 대한 설명..어쩌고 저쩌고..</span>
		        </div>
		    </div>
		</div>
		
		<%@ include file="views/common/footer.jsp" %>
	</div>

	<script>
		$(function(){
			$()
		})
	</script>
</body>
</html>