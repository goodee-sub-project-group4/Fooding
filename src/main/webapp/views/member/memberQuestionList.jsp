<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 리스트</title>
	<!-- 제이쿼리구문 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <!-- 부트스트랩 링크3개 -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        #content2-padding {width: 900px; height: 800px; margin: auto; margin-top: 45px; padding: 20px; box-sizing:border-box; float:left;}
        /* #content2-padding div {border:1px solid green;} */
        #notice-area {width: 100%; height: 135px; font-size: 30px; text-align: center; display: inline-block;}

        #question-list {height: 60px; border-bottom: black; position:relative;}
        #question-list button {width:160px; height:60px; font-size:20px; font-weight:500; background-color:transparent; border:none; }
        #question-list button:hover {font-weight:600;}
        #question-list input {width:60px; height:35px; padding:3px; position:absolute; right:10px; bottom:10px;}

        #list-area {height: 650px;}
        .table {text-align:center;}
        #num {text-align: right; padding-right:5px;}

        /*페이징바*/
        .pagination a{color:red;}

    </style>
</head>
<body>
 		<%@ include file="/views/common/head.jsp" %>
        <%@ include file="/views/common/customerServiceSidebar.jsp" %>
    
        <div id="content2-padding">
            <div id="notice-area">
                <b>내가 쓴 1 : 1 문의</b>
            </div>
            <div id="question-list">
                <button type="button" id="res-q-btn">매장 문의</button>
                <button type="button" id="admin-q-btn">관리자 문의</button>
                <input type="button" class="btn btn-outline-danger" value="삭제">
            </div>
            <div id="list-area">
                <table class="table">
                    <thead>
                        <tr>
                            <th colspan="2" width="60px" id="num">번호</th>
                            <th width="510px">제목</th>
                            <th width="110px">작성일</th>
                            <th width="110px">상태</th>
                            <th width="110px">수정버튼</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr id="">
                            <td><input type="checkbox" style="accent-color:red; width:20px; height:20px; margin-top:3px;"></td>
                            <td>3</td>
                            <td>결제가 안되는데~~~~</td>
                            <td>23.01.23</td>
                            <td>완료</td>
                            <td><input type="button" class="btn btn-outline-danger" value="수정" style="margin-top:-5px;"></td>
                        </tr>
                    </tbody>	
                </table>

            </div>

            <div>
                <ul class="pagination justify-content-center" style="margin:50px 0px;">
                    <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                </ul>
            </div> 
            <br><br><br>

        </div>
		
		<script>
		
			$("#res-q-btn").click(function() {
	        
	        });
	                
	        $("#admin-q-btn").click(function() {
	                    
	        });
	        
		</script>


</body>
</html>