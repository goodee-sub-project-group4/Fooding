<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.fd.restaurant.model.vo.Restaurant" %>
<% 
   ArrayList<Restaurant> list = (ArrayList)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

    tbody>tr:hover{
        cursor: pointer;   
    }


    /*카테고리*/
    #select{
        border: 1px solid gray;
        border-radius: 4px;
        width: 100px;
        height: 33px;
    }

    /*체크 버튼*/
    input{
        accent-color: rgb(221,45,45);
    }   
    
    /*삭제 버튼*/
    #insertNotice{
        float: right;
        font-size: 15px;
        margin-right: 5px;
        width: 70px;
        height: 33px;
    }

    /*페이징바*/
    .pagination a{
        color:rgb(221,45,45);
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

                <!--카테고리-->
                <select id="select">
                    <option value="">상태</option>
                    <option value="">미확인</option>
                    <option value="">승인</option>
                    <option value="">승인대기</option>
                    <option value="">반려</option>
                </select>

                <div class="right">
                    <!--삭제-->
                    <a class="btn btn-danger btn-sm" id="insertNotice">삭제</a>
                    <br> <br>
                </div>

                <!--등록요청 표-->
                <table class="table list-area">
                    <thead>
                        <tr>
                            <th><input type="checkbox"></th>
                            <th>번호</th>
                            <th>작성일</th>
                            <th>업체명</th>
                            <th>처리상태</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<% for(Restaurant r : list) {%>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td><%= r.getResNo() %></td>
                            <td><%= r.getApplyDate() %></td>
                            <td><%= r.getResName() %></td>
                            <td>
                            	<%= (r.getStatus().equals("W")) ? "승인대기" : (r.getStatus().equals("N")) ? "반려" : "승인"  %>

                            </td>
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
               $('#title').text("업체 등록 요청");
               $("#menu4").addClass("active");
               $("#menu4-detail-4").addClass("active");
               
        })
        
        $(function(){
            $(".list-area tbody").on('click', 'tr td:not(:first-child)', function(){
                const tr = $(this).parent('tr');
                const td = tr.children();
                let tdArray = new Array();
                td.each(function(i){
                    tdArray.push(td.eq(i).text());
                });
                location.href = '<%=contextPath%>/rrDetail.ad?no=' + tdArray[1];
            })
        })
 

	</script>
</body>
</html>