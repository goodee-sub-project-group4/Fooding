<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.fd.common.model.vo.PageInfo, com.fd.restaurant.model.vo.Restaurant" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Restaurant> list = (ArrayList<Restaurant>)request.getAttribute("list");
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
    
    /* 컨텐트 전체 영역 */
    .content div{border: 1px solid black;} 
    .content{width: 1200px; margin: auto; box-sizing: border-box; float: left;}
    #content1, #content2 {box-sizing: border-box; height: 100%;}
    #content1-padding, #content2-padding {float: left; margin: auto; padding: 5px; box-sizing: border-box;}

    /* 컨텐트 왼쪽 영역 */
    #content1-padding{width: 20%; height: 500px;}

    /* 내가 한 수정!! */
    /* 카테고리 로고*/
    .icon{border: 1px solid red; float:left;}

    /* 카테고리 이름 (로고 옆에 붙도록 수정)*/
    .ctName{height: 30px; line-height: 30px; font-size: 20px;}

    /* 지역 카테고리 상위 칸*/
    #content1-1{height: 30%; /*150px*/	box-sizing: border-box;}
    
    /* 음식 카테고리 상위 칸*/
    #content1-2{height: 70%; /*350px;*/ box-sizing: border-box;}

    /* 지역 카테고리 */
    #ctLocal{border:1px solid red; width:150px; margin-top:25px; margin-left:30px;}

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
    .paging{height: 50px; text-align: center; padding-top: 20px;}
</style>
</head>

<body>
    <div class="wrap">
    
        <%@ include file="../common/head.jsp" %>   

        <div class="content">
            <div id="content1-padding">
            
            
                <form name=form method=get action="<%=contextPath%>/search.res">
                <div id="content1">
                    <div id="content1-1"> 
                        <!--로고랑 카테고리 이름-->
                        <img src="images/003-location.png" width="30px" height="30px;" class="icon">
                        <div class="ctName">지역</div>

                        <div id="ctLocal">
                            
                            <script language='javascript'>
                                    var cnt = new Array();
                                    cnt[0] = new Array('전체');
                                    cnt[1] = new Array('전체','강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
                                    cnt[2] = new Array('전체','강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
                                    cnt[3] = new Array('전체','남구','달서구','동구','북구','서구','수성구','중구','달성군');
                                    cnt[4] = new Array('전체','계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');
                                    cnt[5] = new Array('전체','광산구','남구','동구','북구','서구');
                                    cnt[6] = new Array('전체','대덕구','동구','서구','유성구','중구');
                                    cnt[7] = new Array('전체','남구','동구','북구','중구','울주군');
                                    cnt[8] = new Array('전체','고양시','과천시','광명시','구리시','군포시','남양주시','동두천시','부천시','성남시','수원시','시흥시','안산시','안양시','오산시','의왕시','의정부시','평택시','하남시','가평군','광주시','김포시','안성시','양주군','양평군','여주군','연천군','용인시','이천군','파주시','포천시','화성시');
                                    cnt[9] = new Array('전체','강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','황성군');
                                    cnt[10] = new Array('전체','제천시','청주시','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');
                                    cnt[11] = new Array('전체','공주시','보령시','서산시','아산시','천안시','금산군','논산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
                                    cnt[12] = new Array('전체','군산시','김제시','남원시','익산시','전주시','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
                                    cnt[13] = new Array('전체','광양시','나주시','목포시','순천시','여수시','여천시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','여천군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
                                    cnt[14] = new Array('전체','경산시','경주시','구미시','김천시','문겅시','상주시','안동시','영주시','영천시','포항시','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
                                    cnt[15] = new Array('전체','거제시','김해시','마산시','밀양시','사천시','울산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','양산시','의령군','창녕군','하동군','함안군','함양군','합천군');
                                    cnt[16] = new Array('전체','서귀포시','제주시','남제주군','북제주군');

                                    function change(add) {
                                        sel=document.form.county
                                        /* 옵션메뉴삭제 */
                                        for (i=sel.length-1; i>=0; i--){
                                            sel.options[i] = null;
                                        }

                                        /* 옵션박스추가 */
                                        for (i=0; i < cnt[add].length;i++){                     
                                            sel.options[i] = new Option(cnt[add][i], cnt[add][i]);
                                        }         
                                    }
                            </script>
                                시/도: 
                                <select name='city' onchange="change(this.selectedIndex);" class=input style="width:100px;">
                                    <option value='전체'>전체</option>
                                    <option value='서울'>서울특별시</option>
                                    <option value='부산'>부산광역시</option>
                                    <option value='대구'>대구광역시</option>
                                    <option value='인천'>인천광역시</option>
                                    <option value='광주'>광주광역시</option>
                                    <option value='대전'>대전광역시</option>
                                    <option value='울산'>울산광역시</option>
                                    <option value='경기'>경기도</option>
                                    <option value='강원'>강원도</option>
                                    <option value='충북'>충청북도</option>
                                    <option value='충남'>충청남도</option>
                                    <option value='전북'>전라북도</option>
                                    <option value='전남'>전라남도</option>
                                    <option value='경북'>경상북도</option>
                                    <option value='경남'>경상남도</option>S
                                    <option value='제주'>제주도</option>
                                </select>   
                                <br>
                                구/군: 
                                <select name='county'  class=select style="width:100px;">
                                    <option value=''>전체</option>
                                </select>
                        </div>
                        <br>
                    </div>

                    <div id="content1-2">
                        <!--로고랑 카테고리 이름-->
                        <img src="images/002-chicken-1.png" width="30px" height="30px" class="icon">
                        <div class="ctName">음식</div>

                        <!--음식카테고리-->
                        <div class="food">
                            <input type="radio" id="all" name="foodCt"  value="all" checked>
                            <label for="all">전체</label>
                            <br>

                            <input type="radio" id="western" name="foodCt" value="western">
                            <label for="western">양식</label>
                            <br> 

                            <input type="radio" id="japanese" name="foodCt">
                            <label for="japanese">일식</label>
                            <br>

                            <input type="radio" id="chinese" name="foodCt" value="chinese">
                            <label for="chinese">중식</label>
                            <br>

                            <input type="radio" id="chicken" name="foodCt" value="chicken">
                            <label for="chicken">분식류/치킨</label>
                            <br>

                            <input type="radio" id="asia" name="foodCt" value="aisa">
                            <label for="asia">아시아/퓨전</label>
                            <br>

                            <input type="radio" id="buffet" name="foodCt" value="buffet">
                            <label for="buffet">뷔페/레스토랑</label>
                            <br>

                            <input type="radio" id="bar" name="foodCt" value="bar">
                            <label for="bar">술집</label>
                            <br>

                            <input type="radio" id="cafe" name="foodCt" value="cafe">
                            <label for="cafe">카페</label>
                            <br>
                        </div>
                    </div>
                    <button type="submit">검색하기</button>
                </div>
            </form>
            </div>
            <div id="content2-padding">
                <div id="content2">
                    <!-- 검색결과 -->
                    <div id="searchResult">
                        치킨에 대한 검색 결과 
                    </div>

                    <!-- 검색결과 조회된 음식점 총 갯수 -->
                    <div id="searchCount">
                        총 208건
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
	                                <img src="images/chicken.jpg" style="width:400px;" height="300px;">
	                            </div>
	                            <!-- 음식점 사진 아래 간단 설명 -->
	                            <div class="resDescription" style="width:400px;">
	                                <%= r.getResName()%><br>
	                                <%= r.getAddress() %><br>
	                                <%= r.getFoodCt() %><br>
	                                <span class="zzim">
	                                    <img src="images/찜하기.png" width="50px;">
	                                </span>
	                                <img src="images/조회수.png" width="20px;">
	                                조회수: 89,459,500 <br>
	                                <img src="images/리뷰수2.png" width="20px;">
	                                리뷰수: 54 
	                            </div>
	                        </div>
	                        <% } %>
                        <% } %>

                        <!-- 페이징바 -->
                        <div class="paging">
                            <% if(pi.getCurrentPage() != 1) { %>
        					<button onclick="location.href='<%=contextPath%>/list.bo?cpage=<%=pi.getCurrentPage() - 1%>';">&lt;</button>
        					<% } %>
        	
        					<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
        					<button onclick="location.href='<%=contextPath%>/list.bo?cpage=<%=p%>';"><%= p %></button>
        					<% } %>
        	
        					<% if(pi.getCurrentPage() != pi.getMaxPage()) { %>
        					<button onclick="location.href='<%=contextPath%>.list.bo?cpage=<%=pi.getCurrentPage()+1%>';">&gt;</button>
        					<% } %>
        					
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div id="footer">
        </div>
    </div>
</body>
</html>