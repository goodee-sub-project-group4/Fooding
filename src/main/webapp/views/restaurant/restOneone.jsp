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
        #ask-area {
            width:700px;
            margin:auto;
        }
		table td, table th {
            margin:auto;
            text-align: center;    
            vertical-align: middle;
            line-height: 33px;
        }
        table th {
			color:rgb(85, 85, 85);
		}
                
        
        .answer-yet {
            color:dodgerblue;
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
            <div id="ask-area" align="center">
			<br><br><br><br>
			<table class="table table-hover">
				<thead>
					<tr class="table-secondary">
						<th>번호</th>
						<th>작성일</th>
						<th>제목</th>
						<th>처리결과</th>
					</tr>
                </thead>
                <tbody>
                    <tr>
                        <td>7</td>
                        <td>2023/01/10</td>
                        <td>메뉴 등록이 안됩니다.</td>
                        <td class="answer-yet">미답변</td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td>2023/01/10</td>
                        <td>메뉴 등록이 안됩니다.</td>
                        <td class="answer-yet">미답변</td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td>2023/01/10</td>
                        <td>메뉴 등록이 안됩니다.</td>
                        <td>답변완료</td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td>2023/01/10</td>
                        <td>메뉴 등록이 안됩니다.</td>
                        <td>답변완료</td>
                    </tr>                    
                </tbody>	
			</table><br><br><br><br>

            <button type="button" class="btn btn-outline-danger btn-lg">1:1문의하러가기</button>
            
            </div>
		</div>
	</div>


    

    <br><br><br><br><br><br><br>
    <div id="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>
	<script>
		$(function(){
			$('#title').text("1:1문의");
			$("#menu3").addClass("active");
			$("#menu3_3").addClass("active");


		})
		
	</script>
</body>
</html>