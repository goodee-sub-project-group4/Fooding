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
        border-color: rgb(104, 104, 104);
        border-style: solid;
        background-color: white;
        width: 200px;
        height: 182px;
        float:left;
        box-sizing:border-box;
        position:absolute;
        left:10px;
        top:10px;
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
        border-top-color: rgb(104, 104, 104);
        border-top-style: solid;
        padding: 10px;
        box-sizing: border-box;
        width:100%;
        height:60px;
        font-size: 17px;
        line-height: 40px;
        
    }
    li:hover {
        background-color: lightgray;
        cursor: pointer;
    }

    li span {
        float: right;
    }

    #menu2-detail {
        background-color: white;
        border-width: 0px 2px 2px 2px;
        border-color: rgb(104, 104, 104);
        border-style: solid;
        width: 200px;
        height: 362px;
        float:left;
        box-sizing: border-box;
        position:absolute;
        left:208px;
        top:70px;
        display:none;
    }

    #menu3-detail {
        background-color: white;
        border-width: 0px 2px 2px 2px;
        border-color: rgb(104, 104, 104);
        border-style: solid;
        width: 200px;
        height: 182px;
        float:left;
        box-sizing: border-box;
        position:absolute;
        left:208px;
        top:130px;
        display:none;
    }

    

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</head>
<body>
    <div id="menu">
        <ul>
            <li id="menu1">예약관리<span>></span></li>
            <li id="menu2">매장관리<span>></span></li>
            <li id="menu3">고객센터<span>></span></li>
        </ul>
    </div>
    
    <div id="menu2-detail" class="detail">
        <ul>
            <li>달력설정<span>></span></li>
            <li>매장정보<span>></span></li>
            <li>메뉴정보<span>></span></li>
            <li>문의답변<span>></span></li>
            <li>리뷰<span>></span></li>
            <li>정산<span>></span></li>
        </ul>
    </div>
    
    <div id="menu3-detail" class="detail">
        <ul>
            <li>공지사항<span>></span></li>
            <li>FAQ<span>></span></li>
            <li>1:1문의<span>></span></li>
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