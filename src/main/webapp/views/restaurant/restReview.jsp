<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		/* ↓↓↓ 기본골격용 스타일들 */
		#outer2 {
			width:1200px;
			height: 800px;
			position: relative;
			margin:auto;
		}			
		
		#content {
			width:950px;
			display: inline-block;
			box-sizing: border-box;
			position:absolute;
			right:10px;
            padding:10px;
		}
		#menubar {
			width: 200px;
			height: 100%;
			z-index: 1000;
			position: absolute;
		}
        #footer {
			width:1200px;
			margin:auto;
		}

		/* ↓↓↓ 컨텐츠용 스타일 */
		table td, table th {
            margin:auto;
            text-align: center;    
            vertical-align: middle;
            line-height: 33px;
        }
        table th {
			color:rgb(85, 85, 85);
		}
        .select {
            border: 1px solid gray;
            border-radius: 4px;
            width: 120px;
            height: 33px;
        }
        
        #search {
            float:right;
            border: 1px solid gray;
            /* background-color: ; */
            border-radius: 4px;
            width: 50px;
            height: 33px;
            margin-left:5px;
        }
        #good {
            position: relative;
            bottom:3px;
            margin-right: 20px;
        }
        #keyword {
            float: right;
            border: 1px solid gray;
            border-radius: 4px;
            width: 150px;
            height: 33px;
            margin-left: 6px;
        }        
        #search-option {
            float: right;
        }

        /* 리뷰상세조회(모달) */      
        .modal-body span { /*신고문구*/
        	color:gray;
        	font-size:12px;
            float: right;
        }
        .modal-body img { /*리뷰사진*/
            width:200px;
            float:left;
            margin-left: 10px;
        }
        .modal-body h3 { /*별점*/
            font-size:40px;
            float: right;
            margin-right: 10px;
        }
        .modal-body p { /*리뷰내용*/
            /* border:1px solid red; */
            display: inline-block;
            width:235px;    
            margin-left:15px;
            text-align: center;       
        }
        .modal-body label { /*리뷰번호*/
            float:left;
        }
        #heart { /*좋아요*/
            position: relative;
            left: 170px;
            width:120px;
        }
        #heart img {
            display: inline-block;
            width:100px;    
        }
        #heart h4 {
            font-size: 18px;
        }
        .modal-body button { /*닫기*/
            float: right;
        }


            
        .pagination a{ /*페이징바*/
            color:rgb(221,45,45);
        }
	
	</style>
</head>
<body>
	<%@ include file="head.jsp" %>
	<div id="outer2">
		<div id="menubar">
			<%@ include file="menubar.jsp" %>
		</div>
		<div id="content" class="container">
			<!-- 컨텐츠 작성부 -->
			<br>
            

                
            <form action="">
                <!-- 넘기지 않을 값, 배치때문에 폼태그 안에 위치 -->
                <button class="btn btn-danger" id="good">좋아요</button>
                <select id="order" class="select">
                    <option value="">작성날짜 순</option>
                    <option value="">예약날짜 순</option>
                </select>
                

                <button id="search">검색</button>
                <input type="text" name="keyword" id="keyword" class="input-group">
                <select id="search-option" class="select" name="search-option">
                    <option value="name">이름</option>
                    <option value="book-status">예약번호</option>
                    <option value="book-date">예약날짜</option>
                </select>                
            </form>
            
            <br>
			<table class="table table-hover">
				<thead>
					<tr class="table-secondary">
						<th><input type="checkbox"></th>
						<th>번호</th>
						<th>예약번호</th>
						<th>별점</th>
						<th>리뷰내용</th>
						<th>작성일</th>
                        <th>좋아요</th>
                        <th>상세정보</th>
					</tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>8</td>
                        <td>525</td>
                        <td>5</td>
                        <td>너무 맛있고 최고!</td>
                        <td>2023/01/23</td>
                        <td>♡</td>
                        <td><button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#review-detail">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>8</td>
                        <td>525</td>
                        <td>5</td>
                        <td>너무 맛있고 최고!</td>
                        <td>2023/01/23</td>
                        <td>♥</td>
                        <td><button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#review-detail">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>8</td>
                        <td>525</td>
                        <td>5</td>
                        <td>너무 맛있고 최고!</td>
                        <td>2023/01/23</td>
                        <td>♡</td>
                        <td><button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#review-detail">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>8</td>
                        <td>525</td>
                        <td>5</td>
                        <td>너무 맛있고 최고!</td>
                        <td>2023/01/23</td>
                        <td>♡</td>
                        <td><button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#review-detail">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>8</td>
                        <td>525</td>
                        <td>5</td>
                        <td>너무 맛있고 최고!</td>
                        <td>2023/01/23</td>
                        <td>♡</td>
                        <td><button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#review-detail">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>8</td>
                        <td>525</td>
                        <td>5</td>
                        <td>너무 맛있고 최고!</td>
                        <td>2023/01/23</td>
                        <td>♡</td>
                        <td><button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#review-detail">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>8</td>
                        <td>525</td>
                        <td>5</td>
                        <td>너무 맛있고 최고!</td>
                        <td>2023/01/23</td>
                        <td>♥</td>
                        <td><button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#review-detail">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>8</td>
                        <td>525</td>
                        <td>5</td>
                        <td>너무 맛있고 최고!</td>
                        <td>2023/01/23</td>
                        <td>♥</td>
                        <td><button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#review-detail">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>8</td>
                        <td>525</td>
                        <td>5</td>
                        <td>너무 맛있고 최고!</td>
                        <td>2023/01/23</td>
                        <td>♥</td>
                        <td><button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#review-detail">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>8</td>
                        <td>525</td>
                        <td>5</td>
                        <td>너무 맛있고 최고!</td>
                        <td>2023/01/23</td>
                        <td>♥</td>
                        <td><button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#review-detail">조회</button></td>
                    </tr>
                </tbody>	
			</table><br><br>
            <!--페이징바-->
            <ul class="pagination justify-content-center" style="margin:20px;">
                <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
            </ul> 
		</div>
		
	</div>


    <!-- The Modal -->
    <div class="modal" id="review-detail">
        <div class="modal-dialog">
            <div class="modal-content">        
                <!-- Modal body -->
                <div class="modal-body">
                    <label>예약번호 453</label>
                    <span>해당리뷰 신고하기</span>
                    <br clear="both"><br><br><br>
                    <img src="/Fooding/resources/images/forTest.png" class="rounded">
                    <h3>★4.5</h3>
                    <p>
                        분위기도 너무 좋고 맛도 정말좋아요!다시 방문할게요~
                    </p><br><br><br><br>
                    <div id="heart" align="center">
                        <!-- 좋아요 전 -->
                        <img src="/Fooding/resources/images/heart-empty.png"><br>
                        <!-- 좋아요 후 -->
                        <!-- <img class="heart" src="/Fooding/resources/images/heart-filled.png"><br> -->
                        <h4>좋아요 누르기</h4>
                    </div>
                    
                    <br clear="both"><br>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
                </div>      
            </div>
        </div>
    </div>


    <br><br><br><br><br><br><br>
    <div id="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>
	<script>
		$(function(){
			$('#title').text("리뷰관리");
            $('#menu2-detail').find('li').eq(4).click();
            $('#menu2').css("background-color","whitesmoke");
            $('#menu2').css("color","rgb(221,45,45)");


		})
		
	</script>
</body>
</html>