<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <style>
            #calendar-outer {
                display: inline-block;
                border: 1px solid lightgray;
                width:408px;
                box-sizing: border-box;

            }
            #calendar-outer>div>div { /*칸 낱개 스타일*/
                box-sizing: border-box;
                width:58px;
                height:40px;
                border:1px solid lightgray;
                margin:0px; 
                float: left;
            }
                    
            #week>div { /*요일줄 스타일*/
                background-color: whitesmoke;
                line-height: 40px;
                text-align: center;
                font-size: 16px;
                font-weight: 600;
                color:rgb(63, 63, 63);
            }

            .notThisMonth { /*날짜칸*/
                color:rgb(209, 209, 209);
                padding:2px;
                line-height: 36px;
                font-size: 12px;
                text-align: left;
            }
            .thisMonth { /*날짜칸*/
                padding:2px;
                line-height: 36px;
                font-size: 12px;
                color:rgb(168, 166, 166);
                text-align: left;
            }
            
        </style>
    </head>

    <body> 
        <div id="calendar-outer">
            <div id="week">
                <div>sun</div>
                <div>mon</div>
                <div>tue</div>
                <div>wed</div>
                <div>thu</div>
                <div>fri</div>
                <div>sat</div>
            </div><br clear="both">
            <div id="line-1st" class="line">
				<!-- 동적으로 생성된 날짜가 들어올 자리 -->
            </div><br clear="both">
            <div id="line-2nd" class="line">
            	<!-- 동적으로 생성된 날짜가 들어올 자리 -->
            </div><br clear="both">
            <div id="line-3rd" class="line">
            	<!-- 동적으로 생성된 날짜가 들어올 자리 -->
            </div><br clear="both">
            <div id="line-4th" class="line">
				<!-- 동적으로 생성된 날짜가 들어올 자리 -->
            </div><br clear="both">
            <div id="line-5th" class="line">
				<!-- 동적으로 생성된 날짜가 들어올 자리 -->
            </div>
            <div id="line-6th" class="line">
				<!-- 동적으로 생성된 날짜가 들어올 자리 -->
            </div>
        </div>
        
        <script>
        //현재 연도와 월 구하기
        let year = new Date().getFullYear();
    	let month = new Date().getMonth()+1;
    	
        //이전달의 마지막 날 날짜와 요일 구하기
        let startDay = new Date(year, month-1, 0);
        let prevDate = startDay.getDate(); 
        let prevDay = startDay.getDay(); 
        
        //이번달의 마지막날 날짜와 요일 구하기
        let endDay = new Date(year, month, 0);
        let lastDate = endDay.getDate(); 
        let lastDay = endDay.getDay(); 
        
        //첫째줄)지난달에 해당하는 칸 작성하기
        for(let i=prevDay; i>=0; i--) {
        	$('#line-1st').append('<div class="notThisMonth" value="">'+(prevDate-i)+'<div>');
        }
        //첫째줄)이번달에 해당하는 칸 작성하기
        for(let i=1; i<=6-prevDay; i++) {
        	$('#line-1st').append('<div class="thisMonth" value="'+i+'">'+i+'</div>');
        }
        //두번째줄
        for(let i=(6-prevDay)+1; i<=(6-prevDay)+7; i++) {
        	$('#line-2nd').append('<div class="thisMonth" value="'+i+'">'+i+'</div>');
        }
        //세번째줄
        for(let i=(6-prevDay)+8; i<=(6-prevDay)+14; i++) {
        	$('#line-3rd').append('<div class="thisMonth" value="'+i+'">'+i+'</div>');
        }
      	//네번째줄
        for(let i=(6-prevDay)+15; i<=(6-prevDay)+21; i++) {
        	$('#line-4th').append('<div class="thisMonth" value="'+i+'">'+i+'</div>');
        }
      	//다섯번째줄이 마지막줄일수도 있고, 여섯번째 줄이 마지막줄일수도 있다.
      	if(lastDate<=(6-prevDay)+28) {
      		//다섯번째줄이 마지막인 경우
      		for(let i=(6-prevDay)+22; i<=lastDate; i++) {
        		$('#line-5th').append('<div class="thisMonth" value="'+i+'">'+i+'</div>');
        	}
      		for(let i=1; i<=(6-lastDay); i++) {
            	$('#line-5th').append('<div class="notThisMonth" value="">'+i+'</div>');
            }
      	}else {
      		//여섯번째 줄이 마지막인 경우,
      		//다섯번째줄
      		for(let i=(6-prevDay)+22; i<=(6-prevDay)+28; i++) {
        		$('#line-5th').append('<div class="thisMonth" value="'+i+'">'+i+'</div>');
        	}
      		//여섯번째줄
      		for(let i=(6-prevDay)+29; i<=lastDate; i++) {
        		$('#line-6th').append('<div class="thisMonth" value="'+i+'">'+i+'</div>');
        	}
      		for(let i=1; i<=(6-lastDay); i++) {
            	$('#line-6th').append('<div class="notThisMonth" value="">'+i+'</div>');
            }
      	}

        </script>

    </body>

    </html>