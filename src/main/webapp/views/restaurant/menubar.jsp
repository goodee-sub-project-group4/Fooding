<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    #menu {
        border-width: 0px 2px 2px 2px;
        border-color: whitesmoke;
        border-style: solid;
        background-color: white;
        width: 200px;
        height: 182px;
        float:left;
        box-sizing:border-box;
        position:absolute;
        left:10px;
        top:100px;
        z-index: 100;
    }
    #menu ul, #menu2-detail ul, #menu3-detail ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        width:100%;
        height:100%;
    }
    #menu li, #menu2-detail li, #menu3-detail li {
        border-top-width: 2px;
        border-top-color: whitesmoke;
        border-top-style: solid;
        padding: 10px;
        box-sizing: border-box;
        width:100%;
        height:60px;
        font-size: 17px;
        line-height: 40px;
        
    }
    
    li:hover {
        background-color: whitesmoke;
        cursor: pointer;
    }

    li span {
        float: right;
    }

    #menu2-detail {
        background-color: white;
        border-width: 0px 2px 2px 2px;
        border-color: whitesmoke;
        border-style: solid;
        width: 200px;
        height: 362px;
        float:left;
        box-sizing: border-box;
        position:absolute;
        left:208px;
        top:160px;
        display:block;
    }

    #menu3-detail {
        background-color: white;
        border-width: 0px 2px 2px 2px;
        border-color: whitesmoke;
        border-style: solid;
        width: 200px;
        height: 182px;
        float:left;
        box-sizing: border-box;
        position:absolute;
        left:208px;
        top:220px;
        display:none;
    }
    li { 
    	position:relative;/*a태그 포지션의 기준이 될*/
    }
    
	#menu3-detail a, #menu2-detail a, #menu a{
        text-decoration: none;
        color: black;
        /*a태그의 영역을 확장하기 위한 속성*/
        width:200px;
        height:60px;
        position:absolute;
        right:0px;
        bottom:0px;
    }
    li label { /*a태그 위치조정으로 밀려난 글자위치조정*/
    	position:relative;
    	left:12px;
    	top:12px;
    }
    
    #page-name { 
        margin: 0;
        font-weight: 600;
        color: rgb(71, 71, 71);
        margin-left:10px;
        font-size:30px;
    } 


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
 
</head>
<body>
    <br>
    <h2 id="page-name">업체 페이지</h2>
    <div id="menu">
        <ul><!-- -->
            <li id="menu1"><a href="/Fooding/book.re"><label>예약관리</label></a><span>></span></li>
            <li id="menu2">매장관리<span>></span></li>
            <li id="menu3">고객센터<span>></span></li>
        </ul>
    </div>
    
    <div id="menu2-detail" class="detail">
        <ul>
            <li><a href='/Fooding/calendar.re'><label>달력설정</label></a><span>></span></li>
            <li><a href='/Fooding/info.re'><label>매장정보</label></a><span>></span></li>
            <li><a href='/Fooding/menu.re'><label>메뉴정보</label></a><span>></span></li>
            <li><a href='/Fooding/qna.re'><label>문의답변</label></a><span>></span></li>
            <li><a href='/Fooding/review.re'><label>리뷰관리</label></a><span>></span></li>
            <li><a href='/Fooding/monthly.re'><label>정산</label></a><span>></span></li>
        </ul>
    </div>
    
    <div id="menu3-detail" class="detail">
        <ul>
            <li><a href='/Fooding/notice.re'><label>공지사항</label></a><span>></span></li>
            <li><a href='/Fooding/faq.re'><label>FAQ</label></a><span>></span></li>
            <li><a href="/Fooding/oneone.re"><label>1:1문의</label></a><span>></span></li>
        </ul>
    </div>

	<script>
        
        $(function(){
            
            $('li').click(function(){
                /*클릭시 배경색 효과주기*/
                $(this).siblings().css("background-color","");
                $(this).css("background-color","whitesmoke");
                $(this).siblings().css("color","");
                $(this).css("color","rgb(221,45,45)");
                $(this).siblings().children().css("color","");
                $(this).children().css("color","rgb(221,45,45)");

                /*디테일 메뉴를 띄우고 닫게 하는 기능*/
                let detailId = '#'+$(this).attr("id")+"-detail";
                if(detailId.classList == null) {
                    $('.detail').css("display","none");
                }
        		
                if($(detailId).css("display") == "none") {
                    $('.detail').css("display","none");
                    $(detailId).css("display", "block");
                }else {
                	$(detailId).css("display", "none");
                }  
                
            })
            /* 외부영역 클릭시 디테일 메뉴 닫게
            $(document).click(function() {
                var area = $("#menu");
                if (!area.is(event.target) && !area.has(event.target).length) {
                    $(".detail").hide();
                }
            })*/
            
        })
    </script> 
    
</body>
</html>