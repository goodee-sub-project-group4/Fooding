<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fd.member.model.vo.Member , com.fd.search.model.vo.Search, java.util.ArrayList" %>
<%
	String contextPath = request.getContextPath(); // /Fooding
	String alertMsg = (String)session.getAttribute("alertMsg"); // Alert

	Member loginUser = (Member)session.getAttribute("loginUser");
	
	ArrayList<Search> list = (ArrayList<Search>)request.getAttribute("list");
%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
    .wrap{width: 1200px; margin: auto;}
    .header div{border: 1px solid black;}
    #header1-padding, #header2-padding, #header3-padding{
        float:left;
        box-sizing: border-box;
        padding: 5px;
        height: 150px;
    }
    #header1-padding, #header3-padding{width: 25%;}
    #header2-padding{width: 50%;}
    #header1, #header2, #header3{height: 100%;}
    #header3-1, #header3-2{box-sizing: border-box; width: 100%; height: 50%;}
    #header-line{width:100%; float: left; box-sizing: border-box; padding: 20px;}
    #header-line>div{height:3px; background-color: black;}
    
    /* 컨텐트 전체 영역 */
    .content div{border: 1px solid black;} 
    .content{width: 1200px; margin: auto; box-sizing: border-box; float: left;}
    #content1, #content2 {box-sizing: border-box; height: 100%;}
    #content1-padding, #content2-padding {float: left; margin: auto; padding: 5px; box-sizing: border-box;}

    /* 컨텐트 왼쪽 영역 */
    #content1-padding{width: 20%; height: 500px;}

    /* 내가 한 수정!! */
    /* 카테고리 로고*/
    .icon{
        border: 1px solid red; 
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
        border:1px solid red; 
        width:150px; 
        margin-top:25px; 
        margin-left:30px; 
    }

    /* 음식 카테고리 */
    /* 스타일 퍼옴 */
    .circle{
        display: inline-block; /* 영역적용가능해짐 */
        width: 20px; height: 20px;
        border: 2px solid #666;
        box-sizing: border-box;
        border-radius: 10px; /* 모서리둥글게 처리 */
        position: relative; top: 4px;
        cursor: pointer; /* 마우스 올렸을때 손모양 처리 */

        background-image: url(https://blog.kakaocdn.net/dn/XTnSL/btrhtUIVtpB/5FungHN6IXVXG8bLbhE9Dk/img.png);
        background-size: 70%;
        background-repeat: no-repeat;
        background-position: center;
    }

    .chk:checked + .circle{
    background-color: navy;
    border-color: navy;
    background-image: url(https://blog.kakaocdn.net/dn/t7a2D/btrhtVgLYmG/dUxzAkBy9hIZ4gHmyllQrk/img.png);
    }

    /* 체크박스는 display:none;을 주면 데이터 처리가 안됨 */
    .chk{ position: absolute; left: -999em; }

    #ctFood{
        width:150px;
        margin-left:30px;
        margin-top:15px;
    }



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

    #searchCount{
        display:inline; 
    }
    #searchFilter{
        display:inline; 
        float:right; 
    }

    /* 업체 정보 */
    #content-main{width: 100%; padding: 5px; float: left;}
    
    /*음식점정보(음식점 썸네일 사진+음식점 간단설명) 옆으로 붙도록 인라인 블럭처리*/
    .searchRes{
        display:inline-block; 
        margin: 30px;
    }

    /*찜하기*/
    .zzim{

        float:right;
        box-sizing: border-box; 
    }

    /* 리뷰 페이징 */
    .paging{height: 50px; text-align: center; padding-top: 20px;}
    

</style>
</head>
<body>
	
		<!-- Alert -->
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
                <div id="header1"><img id="img-logo" src="/Fooding/resources/images/logo.png" width="240" height="80"></div>
            </div>

            <!-- 헤더바2 검색창 -->
            <div id="header2-padding">
                <form action="" id="header2-search">
                    <!-- 돋보기 클릭시 검색가능 -->
                    <div id="search">
                        <input type="text" name="keyword" size="45">&nbsp;&nbsp;<img src="/Fooding/resources/images/search.png" width="25" height="25" onclick="searchRes();">
                    </div>
                </form>
            </div>
            
            <script>
            function searchRes(){
            	$.ajax({
            		url:"<%=contextPath%>/ajaxsearch2.aj",
            		data:{
            			keyword:$("#search input").val()
            		},
            		type:"post",
            		success:function(result){
            			
            			list.
            		},
            		error:function(){
            			console.log("검색용 ajax 통신 실패"); 
            		}
            		
      
            	})
            }
            </script>

            <!-- 헤더바3-1  -->
            <div id="header3-padding">
				<% if(loginUser == null) { %>
                <div id="header3">
                    <!-- case1. 로그인 전 -->
                    <div id="header3-1">
                        <span><a href="<%= contextPath %>/enrollForm.me">회원가입</a></span>
                        <span>&nbsp;|&nbsp;</span>
                        <span><a href="<%= contextPath %>/loginForm.me">로그인</a></span>
                        <span>&nbsp;|&nbsp;</span>
                        <span>
                            <button type="button" data-toggle="dropdown">고객센터▼ &nbsp;</button>
                            <span class="dropdown-menu">
                                <a class="dropdown-item" href="#">공지사항</a>
                                <a class="dropdown-item" href="#">FAQ</a>
                                <a class="dropdown-item" href="#">1:1문의</a>
                                <a class="dropdown-item" href="#">업체등록</a>
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
                            <a class="dropdown-item" href="#">리뷰</a>
                            <a class="dropdown-item" href="#">찜하기</a>
                            <a class="dropdown-item" href="#">적립금</a>
                            <a class="dropdown-item" href="#">개인정보수정</a>
                            <a class="dropdown-item" href="<%= contextPath %>/logout.me">로그아웃</a>
                            </span>
                        </span>
                        <span>&nbsp;|&nbsp;</span>
                        <span>
                            <button type="button" data-toggle="dropdown">고객센터▼ &nbsp;</button>
                            <span class="dropdown-menu">
                                <a class="dropdown-item" href="#">공지사항</a>
                                <a class="dropdown-item" href="#">FAQ</a>
                                <a class="dropdown-item" href="#">1:1문의</a>
                                <a class="dropdown-item" href="#">업체등록</a>
                            </span>
                        </span>
                    </div>
				<% } %>
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

	
	 
    <div class="wrap">
        <div class="content">
            <div id="content1-padding">
                <div id="content1">
                    <div id="content1-1"> 

                        <!--로고랑 카테고리 이름-->
                        <img src="/Fooding/resources/images/003-location.png" width="30px" height="30px;" class="icon">
                        <div class="ctName">지역</div>

                        <div id="ctLocal">
                            <!-- 지역 카테고리 시작(퍼옴)-->
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
                                            sel.options[i] = null
                                        }

                                        /* 옵션박스추가 */
                                        for (i=0; i < cnt[add].length;i++){                     
                                            sel.options[i] = new Option(cnt[add][i], cnt[add][i]);
                                        }         
                                    }
                                
                            </script>
                            <form name=form method=post action=$PHP_SELF>
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
                                    <option value='경남'>경상남도</option>
                                    <option value='제주'>제주도</option>
                                </select>   
                                <br>
                                구/군: 
                                <select name='county'  class=select style="width:100px;">
                                    <option value=''>전체</option>
                                </select>
                            </form> 
                            <!-- 지역 카테고리 끝(퍼음)-->
                        </div>
                    </div>
                    <div id="content1-2">
                        <!--로고랑 카테고리 이름-->
                        <img src="/Fooding/resources/images/002-chicken-1.png" width="30px" height="30px" class="icon">
                        <div class="ctName">음식</div>

                        <!--음식카테고리-->
                        <div id="ctFood">
                            <form action="#">
                                <!--label태그는 체크박스를 누르지 않아도 연결된 체크박스를 체크해줌-->
                                <label for="western">
                                  <input type="checkbox" class="chk" id="western">
                                  <!--실제로는 글자를 기울이는 태그, 퍼블리셔들이 아이콘담을 때 많이 사용-->
                                  <i class="circle"></i>
                                  <span class="text">양식</span>
                                </label>
                                <br> 
                            
                                <label for="japanese">
                                  <input type="checkbox" class="chk" id="japanese">
                                  <!--실제로는 글자를 기울이는 태그, 퍼블리셔들이 아이콘담을 때 많이 사용-->
                                  <i class="circle"></i>
                                  <span class="text">일식</span>
                                </label>
                                <br>
                            
                                <label for="chinese">
                                  <input type="checkbox" class="chk" id="chinese">
                                  <!--실제로는 글자를 기울이는 태그, 퍼블리셔들이 아이콘담을 때 많이 사용-->
                                  <i class="circle"></i>
                                  <span class="text">중식</span>
                                </label>
                                <br>
                            
                                <label for="chicken">
                                  <input type="checkbox" class="chk" id="chicken">
                                  <!--실제로는 글자를 기울이는 태그, 퍼블리셔들이 아이콘담을 때 많이 사용-->
                                  <i class="circle"></i>
                                  <span class="text">분식류/치킨</span>
                                </label>
                                <br>
                            
                                <label for="asia">
                                  <input type="checkbox" class="chk" id="asia">
                                  <!--실제로는 글자를 기울이는 태그, 퍼블리셔들이 아이콘담을 때 많이 사용-->
                                  <i class="circle"></i>
                                  <span class="text">아시아/퓨전</span>
                                </label>
                                <br>
                            
                                <label for="buffet">
                                  <input type="checkbox" class="chk" id="buffet">
                                  <!--실제로는 글자를 기울이는 태그, 퍼블리셔들이 아이콘담을 때 많이 사용-->
                                  <i class="circle"></i>
                                  <span class="text">뷔페/레스토랑</span>
                                </label>
                                <br>
                            
                                <label for="bar">
                                  <input type="checkbox" class="chk" id="bar">
                                  <!--실제로는 글자를 기울이는 태그, 퍼블리셔들이 아이콘담을 때 많이 사용-->
                                  <i class="circle"></i>
                                  <span class="text">술집</span>
                                </label>
                                <br>
                            
                                <label for="cafe">
                                  <input type="checkbox" class="chk" id="cafe">
                                  <!--실제로는 글자를 기울이는 태그, 퍼블리셔들이 아이콘담을 때 많이 사용-->
                                  <i class="circle"></i>
                                  <span class="text">카페</span>
                                </label>
                                
                              </form>
                        </div>
                    </div>
                </div>
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

						
						<% for(Search s : list) { %>
                        <div class="searchRes">
                            <!-- 음식점 사진-->
                            <div class="resThumbnail">
                                <img src="/Fooding/resources/images/chicken.jpg" style="width:400px;" height="300px;">
                            </div>
                            <!-- 음식점 사진 아래 간단 설명 -->
                            <div class="resDescription" style="width:400px;">
                                <%= s.getResName() %> 4.5  <br>
                                <%= s.getAddress() %> - <%=s.getFoodCt() %> <br>
                                <span class="zzim">
                                    <img src="/Fooding/resources/images/찜하기.png" width="50px;">
                                </span>
                                <img src="/Fooding/resources/images/조회수.png" width="20px;">
                                조회수: 89,459,500 <br>
                                <img src="/Fooding/resources/images/리뷰수2.png" width="20px;">
                                리뷰수: 54 
                            </div>
                        </div>
                        <% } %>



                        <!-- 페이징바 -->
                        <div class="paging">
                            < 1 2 3 4 5 6 7 8 9 >
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