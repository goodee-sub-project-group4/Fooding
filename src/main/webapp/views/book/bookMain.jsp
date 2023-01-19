<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
<!-- Cacao map API -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	694ae779a7a7935c84a1e22edd5c5d87"></script>
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
    #content1, #content2, #content3{box-sizing: border-box; height: 100%;}
    #content1-padding, #content2-padding, #content3-padding{float: left; margin: auto; padding: 5px; box-sizing: border-box;}

    /* 컨텐트 왼쪽 영역 */
    #content1-padding{width: 20%; height: 500px;}
    /* 지역 카테고리 */
    #content1-1{height: 30%; box-sizing: border-box;}
    /* 음식 카테고리 */
    #content1-2{height: 70%; box-sizing: border-box;}

    /* 컨텐트 가운데 영역 */
    #content2-padding{width: 50%; height: 100%;}
    /* 컨텐트 가운데 전체 높이 */
    #content2{height: 2450px;}
    #content2-1{height: 1050px;}
    #content2-1 div{box-sizing: border-box;}
    
    /* 업체 사진 */
    #thumbnail{height: 350px;}
    /* 업체 정보 */
    #content-main{width: 100%; padding: 5px; height: 700px; float: left;}
    /* 업체명 (조회/리뷰/별점) */
    #main1{width: 100%; height: 100px;}
    /* 업체세부정보 + 메뉴 */
    #main2{width: 100%; height: 600px;}
    #main2 div{float: left;}
    #main2-1, #main2-3{width: 25%;}
    #main2-2, #main2-4{width: 75%;}
    #main2-1, #main2-2{height: 200px;}
    #main2-3, #main2-4{height: 400px;}
    #main2-4{overflow: auto;}
    /* 메뉴 */
    .menu{width: 50%; padding: 3px; text-align: center;}
    .menu img{width: 180px; height: 100px;}

    /* 리뷰 */
    #content2-2{margin-top: 50px; height: 1270px; overflow: auto}
    #content2-2 div{box-sizing: border-box;}
    #review-head{height: 50px;}
    .review-content{width: 100%;}
    .review-content div{float: left;}
    .review-content1-1{width: 25%; height: 50px;}
    /* 리뷰 제목 */
    .review-content1-2{width: 75%; height: 50px;}
    /* 리뷰 작성자 */
    .review-content2-1{width: 25%; height: 355px;}
    .review-content2-2{width: 75%; height: 355px;}
    /* 리뷰 내용 */
    .review-text{width: 100%; height: 200px;}
    /* 리뷰 사진 */
    .review-picture{width: 100%; height: 150px; padding: 10px; text-align: center;}
    .review-picture img{width: 30%; height: 120px;}
    /* 리뷰 페이징 */
    .paging{height: 50px; text-align: center; padding-top: 20px;}

    /* 컨텐트 오른쪽 영역 */
    #content3-padding{width: 30%; height: 465px;}
    /* 지도 */
    #map{height: 350px; box-sizing: border-box;}
    /* 예약 펼치기 버튼 */
    #content3-2{height: 100px; box-sizing: border-box;}
    #book-btn{width: 100%; height: 100%; border: none; font-size: 3em; box-sizing: border-box;}
    #content3-3{display: none;}

    /* 예약 내용 */
    #content3-3{width: 100%; height: 1500px;}
    /* 예약 업체명 */
    #book-title{height: 70px; line-height: 70px; text-align: center;}
    /* 예약 날짜 */
    #book-menu1, #book-menu2, #book-menu3, #book-menu4{height: 70px; text-align: center; line-height: 70px;}
    /* 메뉴 슬라이드 */
    .slide-detail{
        width: 100%;
        height: 300px;
        margin-top:5px;
        padding: 10px;
        box-sizing: border-box;
        display: none;
    }
</style>
</head>
<body>
    <div class="wrap">
        <div class="header">
            <div id="header1-padding">
                <div id="header1">

                </div>
            </div>
            <div id="header2-padding">
                <div id="header2">
            </div>

            </div>
            <div id="header3-padding">
                <div id="header3">
                    <div id="header3-1"></div>
                    <div id="header3-2"></div>
                </div>
            </div>
        </div>
        <div id="header-line">
            <div></div>
        </div>    


        <div class="content">
            <div id="content1-padding">
                <div id="content1">
                    <div id="content1-1">  

                    </div>
                    <div id="content1-2">

                    </div>
                </div>
            </div>
            <div id="content2-padding">
                <div id="content2">
                    <div id="content2-1">
                        <div id="thumbnail">
                            <img src="" alt="">
                        </div>
                        <div id="content-main">
                            <div id="main1">
                                <b>(업체명)</b>
                                <br>
                                조회수 / 리뷰수 / 별점
                            </div>
                            <div id="main2">
                                <div id="main2-1">
                                    사업자명<br>
                                    사업자등록번호<br>
                                    주소<br>
                                    업종<br>
                                    주차<br>
                                    영업시간<br>
                                    브레이크타임<br>
                                </div>
                                <!-- 업체 정보 데이터-->
                                <div id="main2-2">
                                    사업자명<br>
                                    사업자등록번호<br>
                                    주소<br>
                                    업종<br>
                                    주차<br>
                                    영업시간<br>
                                    브레이크타임<br>
                                </div>
                                <div id="main2-3">
                                    메뉴
                                </div>
                                <div id="main2-4">
                                    <div class="menu">
                                        <img src="sample.jpeg" alt=""><br>
                                        치킨 스테이크 <br>
                                        가격 25,000원
                                    </div>
                                    <div class="menu">
                                        <img src="sample.jpeg" alt=""><br>
                                        치킨 스테이크 <br>
                                        가격 25,000원
                                    </div>
                                    <div class="menu">
                                        <img src="sample.jpeg" alt=""><br>
                                        치킨 스테이크 <br>
                                        가격 25,000원
                                    </div>
                                    <div class="menu">
                                        <img src="sample.jpeg" alt=""><br>
                                        치킨 스테이크 <br>
                                        가격 25,000원
                                    </div>
                                    <div class="menu">
                                        <img src="sample.jpeg" alt=""><br>
                                        치킨 스테이크 <br>
                                        가격 25,000원
                                    </div>
                                    <div class="menu">
                                        <img src="sample.jpeg" alt=""><br>
                                        치킨 스테이크 <br>
                                        가격 25,000원
                                    </div>
                                    <div class="menu">
                                        <img src="sample.jpeg" alt=""><br>
                                        치킨 스테이크 <br>
                                        가격 25,000원
                                    </div>
                                    <div class="menu">
                                        <img src="sample.jpeg" alt=""><br>
                                        치킨 스테이크 <br>
                                        가격 25,000원
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div id="content2-2">
                        <div id="review-head">
                            사용자 리뷰
                        </div>
                        <div class="review-content">
                            <div class="review-content1-1">
                            </div>
                            <div class="review-content1-2">
                                리뷰 작성일<br>
                                리뷰 제목
                            </div>
                            <div class="review-content2-1">
                                홍길동<br>
                                별점
                            </div>
                            <div class="review-content2-2">
                                <div class="review-text"></div>
                                <div class="review-picture">
                                    <img src="sample2.jpeg" alt="">
                                    <img src="sample2.jpeg" alt="">
                                    <img src="sample2.jpeg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="review-content">
                            <div class="review-content1-1">
                            </div>
                            <div class="review-content1-2">
                                리뷰 작성일<br>
                                리뷰 제목
                            </div>
                            <div class="review-content2-1">
                                홍길동<br>
                                별점
                            </div>
                            <div class="review-content2-2">
                                <div class="review-text"></div>
                                <div class="review-picture">
                                    <img src="sample2.jpeg" alt="">
                                    <img src="sample2.jpeg" alt="">
                                    <img src="sample2.jpeg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="review-content">
                            <div class="review-content1-1">
                            </div>
                            <div class="review-content1-2">
                                리뷰 작성일<br>
                                리뷰 제목
                            </div>
                            <div class="review-content2-1">
                                홍길동<br>
                                별점
                            </div>
                            <div class="review-content2-2">
                                <div class="review-text"></div>
                                <div class="review-picture">
                                    <img src="sample2.jpeg" alt="">
                                    <img src="sample2.jpeg" alt="">
                                    <img src="sample2.jpeg" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="paging">
                        < 1 2 3 4 5 6 7 8 9 >
                    </div>
                </div>
            </div>
            <div id="content3-padding">
            	<!-- 지도 api -->
                <div id="content3-1">
                	<div id="map">
                		
                	</div>
                </div>
                
                <script>
					var container = document.getElementById('map');
					var options = {
						center: new kakao.maps.LatLng(33.450701, 126.570667),
						level: 3
					};
			
					var map = new kakao.maps.Map(container, options);
				</script>
                
                <div id="content3-2">
                    <button type="button" id="book-btn">예약</button>
                </div>
                <br>
                <div id="content3-3">
                    <div>
                        <div id="book-title">
                            업체명

                        </div>
                    </div>
                    <br>
                    <div id="book-menu1" class="menu-slide">
                        (달)월 (일)일 (요일)요일
                    </div>
                    <div class="slide-detail">
   
                    </div>
                    <div id="book-menu2" class="menu-slide">
                        시간 선택
                    </div>
                    <div class="slide-detail">

                    </div>
                    <div id="book-menu3">
                        메뉴 선택
                    </div>
                    <div id="book-menu4">
                        예약인원
                    </div>
                    <br>
                    <div id="book-menu5">
                        예약확인 및 예약자 정보
                    </div>
                    <br>
                    <div id="book-menu6">
                        서비스 약관
                    </div>
                    <br><br>
                    <button>예약하기</button>
                </div>
            </div>
        </div>
 
        <script>
            // 예약 버튼 활성화/비활성화
            $(function(){
                $("#book-btn").click(function(){
                    if($("#content3-3").css('display') == "none"){
                        $("#content3-3").css('display', 'block')
                    }else{
                        $("#content3-3").css('display', 'none')
                    }
                })
            })

            // 예약날짜, 시간, 메뉴 슬라이드 효과

            $(function(){
                $(".menu-slide").click(function(){
                const $slide = $(this).next();
                if($slide.css('display') == 'none'){

                    $(this).siblings('.slide-detail').slideUp();
                    $slide.slideDown(); 
                }else{
                    $slide.slideUp();
                }
                })
            })
        </script>
        <div id="footer">
        </div>
    </div>
</body>
</html>