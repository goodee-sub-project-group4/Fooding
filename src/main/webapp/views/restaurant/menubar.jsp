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
        display:none;
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

    #page-name { 
        margin: 0;
        font-weight: 600;
        color: rgb(71, 71, 71);
    }
    

</style>
</head>
<body>
    <br>
    <h2 id="page-name">업체 페이지</h2>
    <div id="menu">
        <ul>
            <li id="menu1" onclick= "location.href='/Fooding/book.re'">예약관리<span>></span></li>
            <li id="menu2">매장관리<span>></span></li>
            <li id="menu3">고객센터<span>></span></li>
        </ul>
    </div>
    
    <div id="menu2-detail" class="detail">
        <ul>
            <li onclick="location.href='/Fooding/calendar.re'">달력설정<span>></span></li>
            <li onclick="location.href='/Fooding/info.re'">매장정보<span>></span></li>
            <li onclick= "location.href='/Fooding/menu.re'">메뉴정보<span>></span></li>
            <li onclick= "location.href='/Fooding/qna.re'">문의답변<span>></span></li>
            <li onclick= "location.href='/Fooding/review.re'">리뷰관리<span>></span></li>
            <li onclick= "location.href='/Fooding/monthly.re'">정산<span>></span></li>
        </ul>
    </div>
    
    <div id="menu3-detail" class="detail">
        <ul>
            <li onclick= "location.href='/Fooding/notice.re'">공지사항<span>></span></li>
            <li onclick= "location.href='/Fooding/faq.re'">FAQ<span>></span></li>
            <li onclick= "location.href='/Fooding/oneone.re'">1:1문의<span>></span></li>
        </ul>
    </div>

    <script>
        $(function(){
            let flag = 0;
            $('li').click(function(flag){
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
                }
                             

                
            })
            
            
        })


        
    </script>
    
</body>
</html>