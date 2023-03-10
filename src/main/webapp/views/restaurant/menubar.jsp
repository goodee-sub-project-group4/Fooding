<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resources/js/jquery-3.6.3.min.js"></script>

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
        color:rgb(221,45,45);
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
        margin-left:10px;
        font-size:30px;
    }  

	.active{
		background:whitesmoke;
		color:rgb(221,45,45);
	}
</style> 
</head>
<body>
    <br>
    <h2 id="page-name">?????? ?????????</h2>
    <div id="menu">
        <ul>
            <li id="menu1" onclick= "location.href='/Fooding/book.re'">????????????<span>></span></li>
            <li id="menu2">????????????<span>></span></li>
            <li id="menu3">????????????<span>></span></li>
        </ul>
    </div>
    
    <div id="menu2-detail" class="detail">
        <ul>
            <li onclick="goCalendar()" id="menu2_1">????????????<span>></span></li>
            <li onclick="location.href='/Fooding/info.re'" id="menu2_2">????????????<span>></span></li>
            <li onclick= "location.href='/Fooding/menu.re'" id="menu2_3">????????????<span>></span></li>
            <li onclick= "location.href='/Fooding/qna.re'" id="menu2_4">????????????<span>></span></li>
            <li onclick= "location.href='/Fooding/review.re'" id="menu2_5">????????????<span>></span></li>
            <li onclick= "goMonthly();" id="menu2_6">??????<span>></span></li>
        </ul>
    </div>
    
    <div id="menu3-detail" class="detail">
        <ul>
            <li onclick= "location.href='/Fooding/notice.re'" id="menu3_1">????????????<span>></span></li>
            <li onclick= "location.href='/Fooding/faq.re'" id="menu3_2">FAQ<span>></span></li>
            <li onclick= "location.href='/Fooding/oneone.re'" id="menu3_3">1:1??????<span>></span></li>
        </ul>
    </div>

	<script>
        
        $(function(){
        	//??????????????? ??????????????????
            $('li').click(function(){
                let detailId = '#'+$(this).attr("id")+"-detail";
                $(detailId).siblings("div").not("#menu").hide();
        		$(detailId).toggle();
            })
            //????????? ????????? ?????????????????? ??????
            $(document).click(function() {
                var area = $("#menu");
                if (!area.is(event.target) && !area.has(event.target).length) {
                    $(".detail").hide();
                }
            });
      		
        })
        
        function goMonthly(){
        	//?????? ???????????? ???????????? ???,???,???????????? ????????????
        	let year = new Date().getFullYear();
        	let month = new Date().getMonth();
        	let lastDay = new Date(year, month, 0).getDate();
        	location.href='/Fooding/monthly.re?year='+year+'&month='+month+'&lastDay='+lastDay;
        }
        
        function goCalendar(){
        	//?????? ????????? ??? ?????????
            let year = new Date().getFullYear();
        	let month = new Date().getMonth()+1;
        	location.href='/Fooding/calendar.re?year='+year+'&month='+month;        	
        }


        
    </script> 
    
</body>
</html>