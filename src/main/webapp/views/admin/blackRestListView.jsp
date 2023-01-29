<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    /*체크박스 버튼*/
    input{
        accent-color: rgb(221,45,45);
    }
    label{
        color: dimgray
    }

    /*카테고리*/
    #select{
        border: 1px solid gray;
        border-radius: 4px;
        width: 100px;
        height: 33px;
    }

    /*삭제 버튼*/
    #deleteNotice{
        float: right;    
        font-size: 15px;
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

    .blackContent {
        position: relative;
        padding: 20px;
        padding-bottom: 20px;
        white-space: pre-line;
        display: none;
        margin-right: 32px;
    } 
    
    #checkbox, #number, #blackStar{
        width: 80px;
        text-align: center;      
    }    
    #blackRest, #blackId, #blackDate, #blackStatus{
        text-align: center;
    }
    #blackRest{
        width: 210px;
    }
    #blackId{
        width: 135px;
    }
    #blackDate{
        width: 120px;
    }
    #blackStatus{
        width: 115px;
    }

    /*리뷰내용*/
    .blackContent>table {
        table-layout: fixed;
        width: 100;
        border: 5px solid red;
        
    }
    #blackDetail{
        border: 1px solid red;
        table-layout: fixed;
        text-align: left;
    }
    #blackImg{
        display: flex;        
    }
    #blackImg>img{
        border: 1px solid red;
        margin: 5px;
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
                    <option value="">신고</option>
                    <option value="">처리중</option>
                    <option value="">처리완료</option>
                </select>

                <!--삭제-->
                <button type="button" class="btn btn-danger btn-sm" id="deleteNotice">삭제</button>
                <br> <br>


                <!--표-->
                <table class="table">
                    <tr style="border-bottom: 2px solid rgb(223, 223, 223); height: 50px;">
                        <th width="65px"><input type="checkbox"></th>
                        <th width="70px">번호</th>
                        <th width="110px">작성자 (ID)</th>
                        <th width="180px">업체명</th>
                        <th width="100px">작성일</th>
                        <th width="110px">처리상태</th>
                    </tr>  
                </table>

                <ul>
                    <div class="list">
                        <div>
                            <div id="checkbox"><input type="checkbox"></div>
                            <div id="number">1</div>
                            <div id="blackId">user01</div>
                            <div id="blackRest">미오도쿄다이닝</div>
                            <div id="blackDate">2023.01.25</div>
                            <div id="blackStatus">처리완료</div>
                        </div>
                    </div>
                    <div class="blackContent">
                            <table>
                                <tr>
                                    <td id="blackDetail">

                                    </td>
                                </tr>
                                <tr><td><br></td></tr>
                                <tr>
                                    <td id="blackImg">
                                        <img src="../../resources/images/chicken.jpg" alt="" width="150" height="150">
                                        <img src="../../resources/images/chicken.jpg" alt="" width="150" height="150">
                                        <img src="../../resources/images/chicken.jpg" alt="" width="150" height="150">
                                    </td>
                                </tr>
                            </table>
                        <div align="center" style="border: 1px solid red;">
                            <a href="" class="btn btn-danger">신고</a><!--신고하기 버튼 누르면 해당 글 삭제(숨김)처리되면서 회원 신고횟수 1누적-->
                            <a href="" class="btn btn-outline-danger">확인</a>
                        </div>
                    </div>
                </ul>


                

                

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
			$('#title').text("업체신고");
			$("#menu5").addClass("active");
			$("#menu5-detail-2").addClass("active");

            // 답변 펼침효과
            $(".list").click(function(){
				$(this).parent().siblings("ul").children(".blackContent").slideUp();
				$(this).next().slideToggle();
			}) 
        })
	
	</script>
</body>
</html>