<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.fd.admin.model.vo.Notice" %>
<% 
   ArrayList<Notice> list1 = (ArrayList)request.getAttribute("list1");
   ArrayList<Notice> list2 = (ArrayList)request.getAttribute("list2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
       
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
        /* margin-top: -60px; 내려가있어서 위로 올려줌 */
    }
    #menubar {
        width: 220px;
        height: 100%;
        z-index: 1000;
        position: absolute;
    }

    
    /* ↓↓↓ 컨텐츠용 스타일 */
    form{
        margin: 30px;
    }

    .right{
        float: right;
    }

    table td, table th {
        margin:auto;
        text-align: center;
        line-height: 25px;     
    }

    /*라디오 버튼*/
    input{
        accent-color: rgb(221,45,45);
    }
    label{
        color: dimgray
    }

    /*삭제 버튼*/
    #deleteNotice{
        float: right;    
        font-size: 15px;
        width: 70px;
        height: 33px;
    }
    /*등록 버튼*/
    #insertNoticeU, #insertNoticeR{
        float: right;
        font-size: 15px;
        margin-right: 5px;
        width: 70px;
        height: 33px;
    }

    /*업체 공지사항 처음엔 안보이게*/
    .restList{
        display: none;
    }

    /*업체 등록버튼 처음엔 안보이게*/
    #insertNoticeR{
        display:none;
    }

    /*페이징바*/
    .pagination a{
        color:rgb(221,45,45);
    }
    
    /*리스트 호버*/
    .list-area>tbody>tr:hover{
    	cursor:pointer;
    }
    
    
</style>
</head>
<body>
	<%@ include file="adminHead.jsp" %>
	<div id="outer2">
		<div id="menubar">
			<%@ include file="adminMenubar.jsp" %>
		</div>
		<div id="content" class="container">

			<!-- 컨텐츠 작성부 -->
            <br><br>
            <form action="">

                <div class="right">
                    <!--회원/업체-->
                    <input type="radio" id="member" name="toWhom" value="U" checked onchange="listDisplay()">
                    <label for="member">회원</label>&nbsp&nbsp
                    <input type="radio" id="restaurant" name="toWhom" value="R" onchange="listDisplay()">
                    <label for="restaurant">업체</label>
                    &nbsp;&nbsp;&nbsp;&nbsp;

                    <!--등록 삭제-->
                    <button type="button" class="btn btn-outline-danger btn-sm" id="deleteNotice">삭제</button>
                    <a class="btn btn-danger btn-sm" id="insertNoticeU" href="<%=contextPath%>/noEnroll.ad">등록</a>
                    <a class="btn btn-danger btn-sm" id="insertNoticeR" href="<%=contextPath%>/noEnroll.ad">등록</a>
                    
                    <br> <br>
                </div>

                <!--공지사항 표-->
                <table class="table list-area">
                    <thead>
                        <tr>
                            <th><input type="checkbox"></th>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>조회수</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody>
    
	                    <% for(Notice n1 : list1) {%>
                        <tr class="memberList">
                            <td><input type="checkbox"></td>
                            <td><%= n1.getNoticeNo() %></td>
                            <td><%= n1.getNoticeTitle() %></td>
                            <td><%= n1.getUserNo() %></td>
                            <td><%= n1.getCount() %></td>
                            <td><%= n1.getCreateDate() %></td>
                        </tr>
	             		<% } %>   

	                    <% for(Notice n2 : list2) {%>
                        <tr class="restList">
                            <td><input type="checkbox"></td>
                            <td><%= n2.getNoticeNo() %></td>
                            <td><%= n2.getNoticeTitle() %></td>
                            <td><%= n2.getUserNo() %></td>
                            <td><%= n2.getCount() %></td>
                            <td><%= n2.getCreateDate() %></td>
                        </tr>
	             		<% } %>   
	     
                    </tbody>	
                </table>
            
            </form>
            
            
            <!--페이징바-->
            <ul class="pagination justify-content-center" style="margin:20px 0">
                <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
            </ul> 
            <br><br><br>

		</div>
		
	
	<script>
		$(function(){
			// Head.jsp 내의 요소, #title의 문구를 변경
			$('#title').text("공지사항");
			$("#menu4").addClass("active");
			$("#menu4-detail-1").addClass("active");       
		})
		
		// 라디오버튼 클릭시 회원/업체 데이터 받아오기
		function listDisplay(){
			if($('input:radio[id=member]').is(':checked')){
                $(".memberList").show();
                $(".restList").hide();
                $("#insertNoticeU").show();
                $("#insertNoticeR").hide();
            }
            if($('input:radio[id=restaurant]').is(':checked')){
                $(".restList").show();
                $(".memberList").hide();
                $("#insertNoticeR").show();
                $("#insertNoticeU").hide();
            }
		}

        // 쿼리스트링으로 글번호 데이터 넘기기
        
        $(function(){
            $(".list-area>tbody>tr").click(function(){
                location.href = '<%=contextPath%>/noDetail.ad?no=' + $(this).children().eq(1).text();
            })
        })


	</script>
</body>
</html>