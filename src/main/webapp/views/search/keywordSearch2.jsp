<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.fd.common.model.vo.PageInfo, com.fd.restaurant.model.vo.Restaurant" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Restaurant> list = (ArrayList<Restaurant>)request.getAttribute("list");
	String keyword = (String)request.getAttribute("keyword");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
    .wrap{width: 1200px; margin: auto;}
    
#content1, #content2, #content3{box-sizing: border-box; height: 100%;}
    #content1-padding, #content2-padding, #content3-padding{float: left; margin: auto; padding: 5px; box-sizing: border-box;}

	#content1-padding{width: 20%; height: 500px;}

	.icon{ 
        float:left; 
    }

    /* 카테고리 이름 (로고 옆에 붙도록 수정)*/
    .ctName{
        height: 30px; 
        line-height: 30px; 
        font-size: 20px;
    }

    /* 지역 카테고리 상위 칸*/
    #content1-1{
        height: 30%; /*150px*/
        box-sizing: border-box;

    }
    /* 음식 카테고리 상위 칸*/
    #content1-2{
        height: 70%; /*350px;*/
        box-sizing: border-box;
    }

    /* 지역 카테고리 */
    #ctLocal{
        width:150px; 
        margin-top:25px; 
        margin-left:30px; 
    }

    /* 음식 카테고리 */
    .food{width:150px; margin-left:30px; margin-top:15px;}


    /* 컨텐트 가운데 영역 */
    #content2-padding{width: 80%; height: 100%;}
    /* 컨텐트 가운데 전체 높이 */
    /*#content2{height: 2450px;}*/

    /*여기서부터 수정!!*/
    
    /* 검색 결과(치킨에 대한 검색결과) */ 
    #searchResult{
        height: 200px; 
        font-size:30px; 
        text-align: center; 
        line-height: 200px;

    }

    #searchCount{display:inline; }
    #searchFilter{display:inline; float:right; }

    /* 업체 정보 */
    #content-main{width: 100%; padding: 5px; float: left;}
    
    /*음식점정보(음식점 썸네일 사진+음식점 간단설명) 옆으로 붙도록 인라인 블럭처리*/
    .searchRes{display:inline-block; margin: 30px;}

    /*찜하기*/
    .zzim{float:right;box-sizing: border-box; }

    /* 리뷰 페이징 */
    .paging-area{height: 50px; text-align: center; padding-top: 20px;}
</style>
</head>

<body>
    <div class="wrap">
    
        <%@ include file="../common/head.jsp" %>   
        <%@ include file="../common/searchSidebar.jsp" %>

        <div class="content">
            

            <div id="content2-padding">
                <div id="content2">
                    <!-- 검색결과 -->
                    <div id="searchResult">
                        <b><%= keyword %></b>에 대한 검색 결과 
                    </div>

                    <!-- 검색결과 조회된 음식점 총 갯수 -->
                    <div id="searchCount">
                        <b>총 <%= pi.getListCount() %>건</b>
                    </div>

                    <!-- 검색결과 필터링: 별점순|방문자순|리뷰순-->
                    <div id="searchFilter">
                        <b>별점순</b> | 방문자순 | 리뷰순
                    </div>

                    <!-- 검색결과 조회된 음식점 목록들 -->
                    <div id="content-main">
                    
                    
                    	<% if(list.isEmpty()){ %>
							<!-- case1. 조회된 음식점이 없을 경우  -->
							<div align="center">조회된 음식점이 없습니다.</div>
						<% } else { %>
							<!-- case2. 조회된 음식점이 있을 경우  -->
							<% for(Restaurant r : list){ %>
	                        <div class="searchRes">
	                            <!-- 음식점 사진-->
	                            <div class="resThumbnail">
	                                <img src="<%= contextPath %>/<%= r.getrImg() %>" style="width:400px;" height="300px;">
	                            </div>
	                            <!-- 음식점 사진 아래 간단 설명 -->
	                            <div class="resDescription" style="width:400px;">
	                                음식점 이름 : <%= r.getResName()%> <br>
	                                별점 : <%= r.getStar() %> <br>
	                                주소 : <%= r.getAddress() %> <br>
	                                음식카테고리 : <%= r.getFoodCt() %> <br>
	                                <span class="zzim">
	                                    <img src="/Fooding/resources/images/heart.png" width="50px;">  
	                                </span>
	                                <img src="/Fooding/resources/images/조회수.png" width="20px;">
	                                조회수: <%= r.getCount() %> <br>
	                                <img src="/Fooding/resources/images/리뷰수2.png" width="20px;">
	                                리뷰수: 54
	                            </div>
	                        </div>
	                        <% } %>
                        <% } %>
                        
						
						<div class="paging-area">
						

				        	<% if(pi.getCurrentPage() != 1){ %>
			            	<button onclick="location.href='<%=contextPath%>/keyword.sh?cpage=<%=pi.getCurrentPage()-1%>&keyword=<%=keyword%>';">&lt;</button>
				            <% } %>
				
							<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
				            	<button onclick="location.href='<%=contextPath%>/keyword.sh?cpage=<%=p%>&keyword=<%=keyword%>';"><%= p %></button>
				            <% } %>
				
							<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
				            	<button onclick="location.href='<%=contextPath%>/keyword.sh?cpage=<%=pi.getCurrentPage()+1%>&keyword=<%=keyword%>';">&gt;</button>
							<% } %>
								        

				        </div>

                    </div>
                      
                </div>
            </div>
        </div>
  
    </div>
</body>
</html>