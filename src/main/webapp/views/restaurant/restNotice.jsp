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
        
        form button{
            float:right;
            border: 1px solid gray;
            border-radius: 4px;
            width: 50px;
            height: 33px;
            margin-left:5px;
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
        table {
            margin-top: 10px;
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

                <button>검색</button>
                <input type="text" name="keyword" id="keyword" class="input-group">
                <select id="search-option" class="select" name="search-option">
                    <option value="">제목</option>
                    <option value="">내용</option>
                    <option value="">제목+내용</option>
                </select>                
            </form>
            
            <br><br>
			<table class="table table-hover">
				<thead>
					<tr class="table-secondary">
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
                </thead>
                <tbody>
                    <tr>
                        <td>10</td>
                        <td>푸딩공지사항입니다.</td>
                        <td>admin</td>
                        <td>2022/12/30</td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>푸딩공지사항입니다.</td>
                        <td>admin</td>
                        <td>2022/12/30</td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>푸딩공지사항입니다.</td>
                        <td>admin</td>
                        <td>2022/12/30</td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>푸딩공지사항입니다.</td>
                        <td>admin</td>
                        <td>2022/12/30</td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>푸딩공지사항입니다.</td>
                        <td>admin</td>
                        <td>2022/12/30</td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>푸딩공지사항입니다.</td>
                        <td>admin</td>
                        <td>2022/12/30</td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>푸딩공지사항입니다.</td>
                        <td>admin</td>
                        <td>2022/12/30</td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>푸딩공지사항입니다.</td>
                        <td>admin</td>
                        <td>2022/12/30</td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>푸딩공지사항입니다.</td>
                        <td>admin</td>
                        <td>2022/12/30</td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>푸딩공지사항입니다.</td>
                        <td>admin</td>
                        <td>2022/12/30</td>
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



    <br><br><br><br><br><br><br>
    <div id="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>
	<script>
		$(function(){
			$('#title').text("공지사항");
			$('#menu3-detail').find('li').eq(0).click();
            $('#menu3').css("background-color","whitesmoke");
            $('#menu3').css("color","rgb(221,45,45)");


			// Menubar.jsp 내의 요소, 스타일이 include시 바뀌는 버그를 수정하기 위한 코드(건들필요X)
			$('#page-name').css({"font-size":"28px", "font-weight":600, "margin-left":"10px", "margin-top":"5px"});
		})
		
	</script>
</body>
</html>