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
        line-height: 25px;     
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
            /* background-color: ; */
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
    
    

	
	</style>
</head>
<body>
	<%@ include file="restHead.jsp" %>
	<div id="outer2">
		<div id="menubar">
			<%@ include file="restMenubar.jsp" %>
		</div>
		<div id="content" class="container">
			<!-- 컨텐츠 작성부 -->
			<br>
            

                
            <form action="">
                <!-- 넘기지 않을 값, 배치때문에 폼태그 안에 위치 -->
                <select id="order" class="select">
                    <option value="">결제시간 순</option>
                    <option value="">예약날짜 순</option>
                </select>

                <button>검색</button>
                <input type="text" name="keyword" id="keyword" class="input-group">
                <select id="search-option" class="select" name="search-option">
                    <option value="name">이름</option>
                    <option value="book-status">예약상태</option>
                    <option value="book-date">예약날짜</option>
                </select>                
            </form>
            
            <br>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>예약번호</th>
						<th>접수날짜</th>
						<th>성명</th>
						<th>예약날짜</th>
						<th>예약시간</th>
						<th>상태</th>
                        <th>상세정보</th>
					</tr>
                </thead>
                <tbody>
                    <tr>
                        <td>10</td>
                        <td>258</td>
                        <td>2022/12/30</td>
                        <td>채치수</td>
                        <td>2023/01/23</td>
                        <td>15:00</td>
                        <td>예약완료</td>
                        <td><button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#selectUseModal">조회</button></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>258</td>
                        <td>2022/12/30</td>
                        <td>채치수</td>
                        <td>2023/01/23</td>
                        <td>15:00</td>
                        <td>예약완료</td>
                        <td><button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#selectUseModal">조회</button></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>258</td>
                        <td>2022/12/30</td>
                        <td>채치수</td>
                        <td>2023/01/23</td>
                        <td>15:00</td>
                        <td>예약완료</td>
                        <td><button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#selectUseModal">조회</button></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>258</td>
                        <td>2022/12/30</td>
                        <td>채치수</td>
                        <td>2023/01/23</td>
                        <td>15:00</td>
                        <td>예약완료</td>
                        <td><button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#selectUseModal">조회</button></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>258</td>
                        <td>2022/12/30</td>
                        <td>채치수</td>
                        <td>2023/01/23</td>
                        <td>15:00</td>
                        <td>예약완료</td>
                        <td><button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#selectUseModal">조회</button></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>258</td>
                        <td>2022/12/30</td>
                        <td>채치수</td>
                        <td>2023/01/23</td>
                        <td>15:00</td>
                        <td>예약완료</td>
                        <td><button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#selectUseModal">조회</button></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>258</td>
                        <td>2022/12/30</td>
                        <td>채치수</td>
                        <td>2023/01/23</td>
                        <td>15:00</td>
                        <td>예약완료</td>
                        <td><button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#selectUseModal">조회</button></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>258</td>
                        <td>2022/12/30</td>
                        <td>채치수</td>
                        <td>2023/01/23</td>
                        <td>15:00</td>
                        <td>예약완료</td>
                        <td><button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#selectUseModal">조회</button></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>258</td>
                        <td>2022/12/30</td>
                        <td>채치수</td>
                        <td>2023/01/23</td>
                        <td>15:00</td>
                        <td>예약완료</td>
                        <td><button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#selectUseModal">조회</button></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>258</td>
                        <td>2022/12/30</td>
                        <td>채치수</td>
                        <td>2023/01/23</td>
                        <td>15:00</td>
                        <td>예약완료</td>
                        <td><button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#selectUseModal">조회</button></td>
                    </tr>
                </tbody>	
			</table>
		</div>
		
	</div>
    <br><br><br><br><br><br><br>
    <div id="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>
	<script>
		$(function(){
			$('#title').text("예약관리");
			$('#menu1').click();

			// Menubar.jsp 내의 요소, 스타일이 include시 바뀌는 버그를 수정하기 위한 코드(건들필요X)
			$('#page-name').css({"font-size":"28px", "font-weight":600, "margin-left":"10px", "margin-top":"5px"});
		})
		
	</script>
</body>
</html>