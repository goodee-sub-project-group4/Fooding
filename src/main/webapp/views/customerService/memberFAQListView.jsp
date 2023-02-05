<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.fd.admin.model.vo.Faq" %>
<%
	ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 리스트</title>
    <style>
        /* #outer {width:1200px; height: 800px; position: relative; margin:auto;}		 */



        #content2-padding {width: 900px; margin: auto; margin-top: 45px; padding: 20px; box-sizing:border-box; float:left;}
        /* #content2-padding div {border:1px solid green;} */
        #notice-area {width: 100%; height: 135px; font-size: 30px; text-align: center; display: inline-block;}
        /* #list-area {height: 600px;} */
        
        /*표 내용*/

        .list {
            cursor: pointer;
            height: 40px;
            border-bottom: 1px solid rgb(223, 223, 223);
            margin-left: -30px;
        }
        .list>div>div{
            display: inline-block; 
        }

        .table th {text-align: center;}
        .content {
            width: 780px;
            position: relative;
            text-align: left;
            white-space: pre-line; 
            display: none;
            } 
        #answer {margin-top:-25px;}
        #number {width: 70px; text-align: center;}
        #category {width: 150px; text-align: center;}
        #faqTitle { padding-left:10px;}

        /*페이징바*/
        .pagination a {color:red; margin-top:20px;}
        
    </style>
</head>
<body>

    <%@ include file="/views/common/head.jsp" %>
    <%@ include file="/views/common/customerServiceSidebar.jsp" %>
    <div class="wrap">
        <div id="content2-padding">
            <div id="notice-area">
                <b>FAQ</b>
            </div>

            <div id="list-area">
                <table class="table">
                    <tr style="border-bottom: 2px solid rgb(223, 223, 223); height: 50px;">
                        <th width="80px">번호</th>
                        <th width="150px">카테고리</th>
                        <th>제목</th>
                    </tr>
                </table>
				<% for(Faq f : list) { %>
                <ul>
                    <div class="list">
                    
                        <div>
                            <div id="number"><%=f.getFaqNo()%></div>
                            <div id="category"><%=f.getCategory()%></div>
                            <div id="faqTitle">
                                <div><%=f.getFaqTitle()%></div>
                            </div>
                        </div>
                        
                    </div>
                   
                    <div class="content">
                    
                        <div id="answer">
                           <%=f.getFaqContent()%>
                        </div>
                        
                    </div>
                </ul>
                <% } %>
            </div>

            <div>
                <ul class="pagination justify-content-center" style="margin:50px 0">
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
        <%@ include file="/views/common/footer.jsp" %>
    </div>


    <script>
		$(function(){
			$('#title').text("FAQ");
			$('#menu4-detail-2').click();
            $('#menu4').css("background-color","whitesmoke");
            $('#menu4').css("color","rgb(221,45,45)");
		})


        $(function(){
            $(".list").click(function(){
                $(this).next().slideToggle();
            })
        })
 
	</script>
	
</body>
</html>