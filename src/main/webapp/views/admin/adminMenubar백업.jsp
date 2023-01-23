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
        border-color: gray;
        border-style: solid;
        background-color: white;
        width: 200px;
        height: 302px;
        float:left;
        box-sizing:border-box;
        position:absolute;
        left:10px;
        top:100px;
        z-index: 100;
    }
    #menu ul, #menu3-detail ul, #menu4-detail ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        width:100%;
        height:100%;
    }
    #menu li, #menu3-detail li, #menu4-detail li {
        border-top-width: 2px;
        border-top-color: gray;
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
        background-color: lightgrey;
        cursor: pointer;
    }

    

    #menu3-detail {
        background-color: white;
        border-width: 0px 2px 2px 2px;
        border-color: gray;
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

    #menu4-detail {
        background-color: white;
        border-width: 0px 2px 2px 2px;
        border-color:  gray;
        border-style: solid;
        width: 200px;
        height: 182px;
        float:left;
        box-sizing: border-box;
        position:absolute;
        left:208px;
        top:280px;
        display:none;
    }
    
    #page-name { 
        margin: 0;
        font-weight: 600;
        color: rgb(71, 71, 71);
    }

    

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
    <br>
    <h2 id="page-name">관리자 페이지</h2>
    <div id="menu">
        <ul>
            <li id="menu1">회원관리<span>></span></li>
            <li id="menu2">업체관리<span>></span></li>
            <li id="menu3">사이트관리<span>></span></li>
            <li id="menu4">고객센터 관리<span>></span></li>
            <li id="menu5">리뷰관리<span>></span></li>
        </ul>
    </div>
    
    <div id="menu3-detail" class="detail">
        <ul>
            <li>메인 배너<span>></span></li>
            <li>이용 약관<span>></span></li>
        </ul>
    </div>
    
    <div id="menu4-detail" class="detail">
        <ul>
            <li>회원<span>></span></li>
            <li>업체<span>></span></li>
            <li>업체 등록 요청<span>></span></li>
        </ul>
    </div>

    <script>
        $(function(){
            $('li').click(function(){
                /*클릭시 배경색 효과주기*/
                $(this).siblings().css("background-color","");
                $(this).css("background-color","lightgrey");

                /*디테일 메뉴를 띄우고 닫게 하는 기능*/
                let detailId = '#'+$(this).attr("id")+"-detail";
                if(detailId.classList == null) {
                    $('.detail').css("display","none");
                }
                if($(detailId).css("display") == "none") {
                    $('.detail').css("display","none");
                    $(detailId).css("display", "block")
                } 
            })
        })

        
    </script>
    
</body>
</html>