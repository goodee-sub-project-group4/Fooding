<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    }

    #menubar {
        width: 200px;
        height: 100%;
        z-index: 1000;
        position: absolute;
    }

    /* ↓↓↓ 컨텐츠용 스타일 */
    
    form{
        margin: 30px;
    }

    #useTerms textarea, #policy textarea{
        width: 680px;
        box-sizing: border-box;
        padding: 20px;
        margin-left: 30px;
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

            <form action="" align="center">
                <table id="useTerms">
                    <tr>
                        <th>이용약관</th>
                        <td>
                            <textarea name="content1" id="" cols="30" rows="10" style="resize:none"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th></th>
                        <td height="70px">
                            <button type="submit" class="btn btn-danger">수정하기</button>
                        </td>
                    </tr>
                </table>

            
                <br><br>

                <table id="policy">
                    <tr>
                        <th>
                            개인정보 <br>
                            처리방침
                        </th>
                        <td>
                            <textarea name="content2" id="" cols="30" rows="10" style="resize:none"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th></th>
                        <td height="70px">
                            <button type="submit" class="btn btn-danger">수정하기</button>
                        </td>
                    </tr>
                </table>

            </form>


            
			
		</div>
		
	
	<script>
		$(function(){
			$('#title').text("이용약관");
			$('#menu3-detail-2').click();
            $('#menu3').css("background-color","whitesmoke");
            $('#menu3').css("color","rgb(221,45,45)");
		})

        


	</script>
</body>
</html>