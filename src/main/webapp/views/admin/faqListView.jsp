<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.fd.admin.model.vo.Faq" %>
<% 
   ArrayList<Faq> listU = (ArrayList)request.getAttribute("listU");
   ArrayList<Faq> listR = (ArrayList)request.getAttribute("listR");
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

    table td, table th {
        margin:auto;
        text-align: center;
        line-height: 25px;     
    }

    .right{
        float: right;
    }

    /*라디오 버튼*/
    input{
        accent-color: rgb(221,45,45);
    }
    label{
        color: dimgray
    }

    /*카테고리*/
    .select{
        border: 1px solid gray;
        border-radius: 4px;
        width: 100px;
        height: 33px;
    }

    /*삭제 버튼*/
    #deleteFaq{
        float: right;    
        font-size: 15px;
        width: 70px;
        height: 33px;
    }
    /*등록 버튼*/
    #insertFaq{
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



    /*표 내용*/
    .list {
        cursor: pointer;
        height: 40px;
        border-bottom: 1px solid rgb(223, 223, 223);
        margin-left: -32px;
    }
    .list>div>div{
        display: inline-block; 
    }

    .faqContent {
        position: relative;
        padding: 20px;
        padding-bottom: 20px;
        text-align: left;
        white-space: pre-line;
        display: none;
        margin-right: 32px;
    } 
    
    #checkbox, #number{
        width: 70px;
        text-align: center;
        
    }    
    #category{
        width: 150px;
        text-align: center;
    }
    #faqTitle{
        width: 300px;
    }

    #mdButton{
        display: inline-flex;
        padding-left: 300px;
        padding-bottom: 20px;
    }

    /*업체 FAQ리스트 처음엔 안보이게*/
    .restList{
        display: none;
    }

    /*업체 카테고리 처음엔 안보이게*/
    .categoryR{
        display:none;
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
            <form action="<%=contextPath%>/faqEnroll.ad">
                
                <!--카테고리-->
                <div class="categoryU">
                    <select class="select" name="category" onchange="changeCategory()">
                        <option>구분</option>
                        <option>회원</option>
                        <option>예약</option>
                        <option>결제/취소</option>
                        <option>적립금</option>
                        <option>서비스이용</option>
                    </select>
                </div>

                <!--카테고리-->
                <div class="categoryR">
                    <select class="select" name="category" onchange="changeCategory()">
                        <option>구분</option>
                        <option>업체</option>
                        <option>예약</option>
                        <option>결제/취소</option>
                        <option>적립금</option>
                        <option>서비스이용</option>
                    </select>
                </div>

                <div class="right">
                    <!--회원/업체-->
                    <input type="radio" id="member" name="who" value="U" checked onchange="listDisplay()">
                    <label for="member">회원</label>&nbsp;&nbsp;
                    <input type="radio" id="restaurant" name="who" value="R" onchange="listDisplay()">
                    <label for="restaurant">업체</label>
                    &nbsp;&nbsp;&nbsp;&nbsp;

                    <!--등록 삭제-->
                    <button type="button" class="btn btn-outline-danger btn-sm" id="deleteFaq">삭제</button>
                    <button class="btn btn-danger btn-sm" id="insertFaq">등록</button> 
                    <br> <br>
                </div>


                <!--표-->
                <table class="table">
                    <tr style="border-bottom: 2px solid rgb(223, 223, 223); height: 50px;">
                        <th width="70px"><input type="checkbox"></th>
                        <th width="80px">번호</th>
                        <th width="150px">카테고리</th>
                        <th>제목</th>
                    </tr>  
                </table>
				
				<% for(Faq f1 : listU) {%>
                <ul class="memberList">
                    <div class="list">
                        <div>
                            <div id="checkbox"><input type="checkbox"></div>
                            <div id="number"><%= f1.getFaqNo() %></div>
                            <div id="category"><%= f1.getCategory() %></div>
                            <div id="faqTitle">
                                <div><%= f1.getFaqTitle() %></div>
                            </div>
                        </div>
                    </div>
                    <div class="faqContent">
                        <div>
                            <%= f1.getFaqContent() %>
                        </div>
                        <div id="mdButton" align="center">
                            <div><a href="<%=contextPath%>/faqUpdateForm.ad?no=<%=f1.getFaqNo()%>" class="btn btn-outline-danger">수정하기</a>&nbsp&nbsp</div>
                            <div><a href="<%=contextPath%>/faqDelete.ad?no=<%=f1.getFaqNo()%>" class="btn btn-danger">삭제하기</a></div>
                        </div>
                    </div>
                </ul>
                <% } %>
                
                <% for(Faq f2 : listR) {%>
                <ul class="restList">
                    <div class="list">
                        <div>
                            <div id="checkbox"><input type="checkbox"></div>
                            <div id="number"><%= f2.getFaqNo() %></div>
                            <div id="category"><%= f2.getCategory() %></div>
                            <div id="faqTitle">
                                <div><%= f2.getFaqTitle() %></div>
                            </div>
                        </div>
                    </div>
                    <div class="faqContent">
                        <div>
                            <%= f2.getFaqContent() %>
                        </div>
                        <div id="mdButton" align="center">
                            <div><a href="<%=contextPath%>/faqUpdateForm.ad?no=<%=f2.getFaqNo()%>" class="btn btn-outline-danger">수정하기</a>&nbsp&nbsp</div>
                            <div><a href="<%=contextPath%>/faqDelete.ad?no=<%=f2.getFaqNo()%>" class="btn btn-danger">삭제하기</a></div>
                        </div>
                    </div>
                </ul>
                <% } %>
                
                
            
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
			$('#title').text("FAQ");
			$("#menu4").addClass("active");
			$("#menu4-detail-2").addClass("active");

            // 답변 펼침효과
            $(".list").click(function(){
				$(this).parent().siblings("ul").children(".faqContent").slideUp();
				$(this).next().slideToggle();
			}) 
		})
		
		// 라디오버튼 클릭시 회원/업체 데이터 받아오기
		function listDisplay(){
			if($('input:radio[id=member]').is(':checked')){
                $(".categoryU").show();
                $(".categoryR").hide();
                $(".memberList").show();
                $(".restList").hide();
                
            }
            if($('input:radio[id=restaurant]').is(':checked')){
                $(".categoryR").show();
                $(".categoryU").hide();
                $(".restList").show();
                $(".memberList").hide();
                
            }
		}

        // 카테고리 조회,,
        // function changeCategory(){
        //     var kind = $(this).val();
        //     $.ajax({
        //         url : 
        //     })
        // }

 
	</script>
</body>
</html>