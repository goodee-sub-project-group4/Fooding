<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.fd.book.model.vo.*" %>
<%
	ArrayList<Book> list = (ArrayList<Book>)request.getAttribute("list");
%>
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

        /* 예약상세조회(모달) */
        .modal-content {
            height:1000px;
        }
        .modal-header h4  {
            font-weight: 800;
        }
        .modal-body h3 {
        	font-size:16px;
        	font-weight:600;
        }
        .modal-body .table {
        	font-size:14px;
        }
        .modal-body th {
            color:rgb(97, 97, 97);
        }
        .modal-body button {
        	width:80px;
        }
        .modal-body span {
        	color:crimson;
        	font-size:12px;
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
					<tr class="table-secondary">
						<th>순번</th>
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
                	<% for(int i=0; i<list.size(); i++) { %>
                    <tr>
                        <td><%=list.size()-i %></td>
                        <td><%=list.get(i).getBookNo() %></td>
                        <td><%=list.get(i).getBookA() %></td>
                        <td><%=list.get(i).getBookName() %></td>
                        <td><%=list.get(i).getBookDate() %></td>
                        <td><%=list.get(i).getBookTime() %></td>
                        <%
                        	String status = "";
                        	switch(list.get(i).getStatus()){
                        		case "B" : status = "예약완료"; break;
                        		case "C" : status = "예약취소"; break;
                        		case "D" : status = "이용완료"; break;
                        	}
                        %>
                        <td><%=status %></td>
                        <td><button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#book-detail" onclick="location.href='<%=contextPath%>/bookDetail.re?no='+<%= list.get(i).getBookNo()%>">조회</button></td>
                    </tr>
             		<% } %>
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
    <div class="modal" id="book-detail">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4>예약상세조회</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body">
                    <br>
                    <h3>예약정보</h3>
                    <table class="table table-sm">
                        <tr class="table-secondary">
                            <th>예약번호</th>
                            <th>예약날짜</th>
                            <th>예약시간</th>
                            <th>예약인원</th>
                        </tr>
                        <tr class="table-light">
                            <td>12</td>
                            <td>2023-02-15</td>
                            <td>15:00</td>
                            <td>2</td>
                        </tr>
                    </table>
                    <br>
                    <h3>예약자정보</h3>
                    <table class="table table-sm">
                        <tr class="table-secondary">
                            <th>이름</th>
                            <th>연락처</th>
                            <th>이메일</th>
                            <th>요청사항</th>
                        </tr>
                        <tr class="table-light">
                            <td>강백호</td>
                            <td>010-9999-9999</td>
                            <td>fooding@gmail.com</td>
                            <td>주차관련해서 문의드렸는데 확인부탁드립니다.</td>
                        </tr>
                    </table>
                    <br>
                    <h3>주문내역</h3>
                    <table class="table table-sm">
                        <tr class="table-secondary">
                            <th>메뉴</th>
                            <th>수량</th>
                            <th>단가</th>
                            <th>금액</th>
                        </tr>
                        <tr class="table-light">
                            <td>시금치파스타</td>
                            <td>1</td>
                            <td>19000</td>
                            <td>19000</td>
                        </tr>
                        <tr class="table-light">
                            <td>먹물파스타</td>
                            <td>1</td>
                            <td>22000</td>
                            <td>22000</td>
                        </tr>
                        <tr class="table-light">
                            <td>콜라</td>
                            <td>2</td>
                            <td>2000</td>
                            <td>4000</td>
                        </tr>
                    </table>
                    <br>
                    <h3>결제정보</h3>
                    <table class="table table-sm">
                        <tr class="table-secondary">
                            <th>결제시간</th>
                            <th>결제수단</th>
                            <th>결제금액</th>
                        </tr>
                        <tr class="table-light">
                            <td>23-01-07 15:30:25</td>
                            <td>카드</td>
                            <td>45000</td>
                        </tr>
                    </table>
                    <br>
                    <h3>예약상태</h3>
                    <form action="">
                        <select name="" id="">
                            <option value="">예약완료</option>
                            <option value="">취소</option>
                            <option value="">이용완료</option>
                        </select>
                        <button type="button" class="btn btn-danger">저장</button>
                        <button type="reset" class="btn btn-secondary">취소</button>
                    </form>
                    <span>*예약상태는 변경 후 되돌릴 수 없으니 신중히 선택해주세요.</span>
                    
                    

                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    
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
			$('#title').text("예약관리");
			$("#menu1").addClass("active");

		})
		
	</script>
</body>
</html>