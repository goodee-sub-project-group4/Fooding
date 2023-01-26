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
			height: 700px;
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

        /* content부 스타일 */
        #detail-area {
            width:600px;
            margin:auto; 
            border-top: 1px solid lightgray; 
            padding-top:20px;
        }
        
        .table th {
            height:40px; 
            width: 100px; 
            background-color: rgb(240, 239, 239);
        }
        .table td {
            padding-left:20px;
        }
        .table p {
            padding:30px;
        }
        #detail-area button {
            float: right;
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
			<br><br><br>
            
            <div id="detail-area">
    
                <table class="table">
                    <tr>
                        <th>제목</th>
                        <td>푸딩 공지사항</td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>admin</td>
                    </tr>
                    <tr>
                        <th>작성일</th>
                        <td>2023.01.22</td>
                    </tr>     
                    <tr>
                        <td colspan="2">
                            <br>
                            <p>
                                푸딩공지사항 
                            </p>
                            <br>
                        </td>
                    </tr>
                </table><br>
                <button class="btn btn-secondary">뒤로가기</button>
            </div>

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


		})
		
	</script>
</body>
</html>