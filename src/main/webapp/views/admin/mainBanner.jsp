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
        /* margin-top: -60px; 내려가있어서 위로 올려줌 */
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

            <form align="center">
                <table>
                    <tr>
                        <td>
                            <img src="" width="800px" height="300">
                        </td>
                    </tr>  
                    <tr>
                        <td>
                            <br><img src="" width="800" height="300">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br><img src="" width="800" height="300">
                        </td>
                    </tr>  
                    <tr>
                        <td>
                            <div style="display:none">
                                <input type="file">
                            </div>
                        </td>
                    </tr>  
                    <tr><td><br></td></tr> 
                    <tr>
                        <td>
                            <button type="submit" class="btn btn-danger">등록하기</button>
                        </td>
                    </tr>               
                </table>


                
    
                <br>
                
                
            </form>
            <br><br>

            
			
		</div>

		
	
	<script>
		$(function(){
			$('#title').text("메인 배너");
			$('#menu3-detail-1').click();
            $('#menu3').css("background-color","whitesmoke");
            $('#menu3').css("color","rgb(221,45,45)");
		})



	</script>
</body>
</html>