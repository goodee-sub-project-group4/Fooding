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
            /* height: 33px; */
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
        
        .status-b {
        	color: dodgerblue;
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
                        <td class="list-status"><%=status %></td>
                        <td><button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#book-detail" onclick="viewDetail(<%= list.get(i).getBookNo()%>)">조회</button></td>
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
                            <td id="bookNo">12</td>
                            <td id="bookDate">2023-02-15</td>
                            <td id="bookTime">15:00</td>
                            <td id="people">2</td>
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
                            <td id="bookName">강백호</td>
                            <td id="bookPhone">010-9999-9999</td>
                            <td id="email">fooding@gmail.com</td>
                            <td id="request">-</td>
                        </tr>
                    </table>
                    <br>
                    <h3>주문내역</h3>
                    <table class="table table-sm">
                        <tr class="table-secondary" id="menu-start">
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
                            <td id="payDate">23-01-07 15:30:25</td>
                            <td id="payOp">카드</td>
                            <td id="payTotal">45000</td>
                        </tr>
                    </table>
                    <br>
                    <h3>예약상태</h3>
                    <form action="<%=contextPath%>/bookStatus.re">
                    	<input type="hidden" name="statusBookNo" val="0" id="statusBookNo">
                        <select name="bookStatus" id="bookStatus" disabled>
                            <option value="B">예약완료</option>
                            <option value="C">취소</option>
                            <option value="D">이용완료</option>
                        </select>
                        <button type="submit" class="btn btn-danger btn-sm" disabled>저장</button>
                        <button type="reset" class="btn btn-secondary btn-sm" disabled>취소</button>
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
			$('.list-status').each(function(){
				if($(this).text()=="예약완료") {
					$(this).addClass("status-b");
				}
			});
			
		})
		
		function viewDetail(bookNo){
			$.ajax({
				url:"<%=contextPath%>/bookDetail.re",
				data:{no:bookNo},
				success: function(set){
					//기본정보 채우기
					$('#bookNo').text(set[0].bookNo);
					$('#statusBookNo').val(set[0].bookNo);
					$('#bookDate').text(set[0].bookDate);
					$('#bookTime').text(set[0].bookTime);
					$('#people').text(set[0].people);
					$('#bookName').text(set[0].bookName);
					$('#bookPhone').text(set[0].bookPhone);
					$('#email').text(set[0].email);
					//request는 null이 가능한데, null일경우 이전에 조회했던 내용이 뜬다
					// >> 한번 비워주고 실행한다.
					$('#request').text("-");
					$('#request').text(set[0].request);
					$('#payDate').text(set[2].payDate);
					$('#payOp').text(set[2].payOp);
					$('#payTotal').text(set[2].payTotal);
					
					//[메뉴조회]를 위해 하단의 for문을 넣었으나, 이것만 있으면 상세조회를 누를때마다 쌓인다.
					// >> 이전에 쌓은 요소들을 먼저 지워주고 시작한다.
					$('#menu-start').siblings().remove();
					for(let i=0; i<set[1].length; i++) {
						$('#menu-start').after($('<tr class="table-light">'+
	                            '<td>'+set[1][i].menuNo+'</td>'+
	                            '<td>'+set[1][i].menuCount+'</td>'+
	                            '<td>'+set[1][i].price+'</td>'+
	                            '<td>'+set[1][i].bmPrice+'</td>'+
	                        '</tr>'));
					}
					
					//[예약상태] 설정을 위해 하단의 each함수를 넣었으나, 이것만 있으면 상세조회를 누를때 이전 조회에 영향을 받는다.
					// >> 이전에 변경한 값들을 지워주고 시작한다.
					$('#bookStatus').attr("disabled", true);
					$('#bookStatus').siblings().attr("disabled", true);
					$('#bookStatus').children().each(function(){
						if($(this).val()==set[0].status) {
							$(this).attr("selected",true);
							if(set[0].status=="B") {
								//예약완료 상태는 버튼 활성화
								$('#bookStatus').attr("disabled", false);
								$('#bookStatus').siblings().attr("disabled", false);
							}
						}
					})
				}, error: function() {
					console.log("예약상세조회 ajax통신실패")
				}
			})
		}
		
	</script>
</body>
</html>