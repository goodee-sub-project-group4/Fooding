<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    #menu {
        border-width: 0px 2px 2px 2px;
        border-color: whitesmoke;
        border-style: solid;
        background-color: white;
        width: 200px;
        /* height: 182px; */
        float:left;
        box-sizing:border-box;
        position:absolute;
        left:10px;
        top:100px;
        z-index: 100;
    }
    #menu a{
        text-decoration: none;
        color: black;
        display: block;
    }
    #menu ul, #menu3-detail ul, #menu4-detail ul, #menu5-detail ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        width:100%;
        height:100%;
    }
    #menu li, #menu3-detail li, #menu4-detail li, #menu5-detail li {
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

    li span {
        float: right;
    }
    li:hover {
        background-color: whitesmoke;
        cursor: pointer;
    }

    li span {
        float: right;
    }


    #menu3-detail {
        background-color: white;
        border-width: 0px 2px 2px 2px;
        border-color: whitesmoke;
        border-style: solid;
        width: 200px;
        height: 122px;
        float:left;
        box-sizing: border-box;
        position:absolute;
        left:208px;
        top:220px;
        display:none;
    }
    #menu3-detail a{
        text-decoration: none;
        color: black;
        display: block;
    }

    #menu4-detail {
        background-color: white;
        border-width: 0px 2px 2px 2px;
        border-color: whitesmoke;
        border-style: solid;
        width: 200px;
        height: 242px;
        float:left;
        box-sizing: border-box;
        position:absolute;
        left:208px;
        top:280px;
        display:none;
    }
    #menu4-detail a{
        text-decoration: none;
        color: black;
        display: block;
    }

    #menu5-detail {
        background-color: white;
        border-width: 0px 2px 2px 2px;
        border-color: whitesmoke;
        border-style: solid;
        width: 200px;
        height: 122px;
        float:left;
        box-sizing: border-box;
        position:absolute;
        left:208px;
        top:340px;
        display:none;
    }
    #menu5-detail a{
        text-decoration: none;
        color: black;
        display: block;
    }

    #page-name { 
        margin: 0;
        font-weight: 600;
        color: rgb(71, 71, 71);
        font-size: 28px;
        margin: 10px;
        text-align: center;
    }
    

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
    <br>
    <h2 id="page-name">관리자 페이지</h2>
    <div id="menu">
        <ul>
            <li id="menu1"><a href="<%= request.getContextPath()%>/member.ad">회원 관리<span>></span></a></li>
            <li id="menu2"><a href="<%= request.getContextPath()%>/rest.ad">업체 관리<span>></span></a></li>
            <li id="menu3">사이트 관리<span>></span></li>
            <li id="menu4">고객센터 관리<span>></span></li>
            <li id="menu5">신고 관리<span>></span></li>
        </ul>
    </div>    
    
    <div id="menu3-detail" class="detail">
        <ul>
            <li id="menu3-detail-1"><a href="<%= request.getContextPath()%>/banner.ad">메인 배너<span>></span></a></li>
            <li id="menu3-detail-2"><a href="<%= request.getContextPath()%>/terms.ad">이용약관<span>></span></a></li>
        </ul>
    </div>

    <div id="menu4-detail" class="detail">
        <ul>
            <li id="menu4-detail-1"><a href="<%= request.getContextPath()%>/noList.ad">공지사항<span>></span></a></li>
            <li id="menu4-detail-2"><a href="<%= request.getContextPath()%>/faqList.ad">FAQ<span>></span></a></li>
            <li id="menu4-detail-3"><a href="<%= request.getContextPath()%>/quList.ad">1:1 문의<span>></span></a></li>
            <li id="menu4-detail-4"><a href="<%= request.getContextPath()%>/rrList.ad">업체 등록 요청<span>></span></a></li>
        </ul>
    </div>

    <div id="menu5-detail" class="detail">
        <ul>
            <li id="menu5-detail-1"><a href="<%= request.getContextPath()%>/review.bl">리뷰 신고<span>></span></a></li>
            <li id="menu5-detail-2"><a href="<%= request.getContextPath()%>/rest.bl">업체 신고<span>></span></a></li>
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
                    $(detailId).css("display","block")
                } 
            })
            
            // 외부영역 클릭시 디테일 메뉴 닫게
            $(document).click(function() {
                var area = $("#menu");
                if (!area.is(event.target) && !area.has(event.target).length) {
                    $(".detail").hide();
                }
            });


        })


        
    </script>
    
</body>
</html>