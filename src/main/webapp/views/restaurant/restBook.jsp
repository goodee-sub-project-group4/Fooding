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
		}
		#menubar {
			width: 200px;
			height: 100%;
			z-index: 1000;
			position: absolute;
		}
		/* ↓↓↓ 컨텐츠용 스타일 */
		table td, table th {
        margin:auto;
        text-align: center;
        line-height: 25px;     
    }
    #ss {
        float: left;
    }
    #select{
        border: 1px solid gray;
        border-radius: 4px;
        width: 100px;
        height: 33px;
    }
    #search{
        border: 1px solid gray;
        border-radius: 4px;
        width: 150px;
        height: 33px;
        margin-left: 5px;
    }
    #sButton{
        border: 1px solid gray;
        /* background-color: ; */
        border-radius: 4px;
        width: 50px;
        height: 33px;
        margin-left: -6px;
    }
    
    #deleteMember{
        float: right;    
        font-size: 15px;
    }
    #giveMoney{
        float: right;
        font-size: 15px;
        margin-right: 5px;
    }

    #moneyModal-body{
        margin: auto;
    }

    #selectModal-body th{
        text-align: left;
        color: gray;
        font-weight: 500;
    }
    #selectModal-body td{
        padding-left: 60px;
        text-align: left;
    }

    #updateModal-body th{
        text-align: left;
        color: gray;
        font-weight: 500;
    }
    #updateModal-body td{
        padding-left: 60px;
        text-align: left;
    }
	
	</style>
</head>
<body>
	<%@ include file="restHead.jsp" %>
	<div id="outer2">
		<div id="menubar">
			<%@ include file="restMenubar.jsp" %>
		</div>
		<div id="content" class="container">
			<!-- 컨텐츠 작성부 -->
			<br><br><br><br><br>
           
                <select id="select">
                    <option value="">최신 순</option>
                    <option value="">오래된 순</option>
                    <option value="">예약 순</option>
                    <option value="">리뷰 순</option>
                </select>
                <input type="text" id="search" placeholder="아이디 검색" name="keyword">
                <input type="submit" id="sButton" value="검색">
            
            
                <button type="button" class="btn btn-danger btn-sm" id="deleteMember" data-toggle="modal" data-target="#deleteModal">회원 탈퇴</button>
                <button type="button" class="btn btn-danger btn-sm" id="giveMoney" data-toggle="modal" data-target="#moneyModal">적립금 지급</button>
            <div></div>
            <br> 
			<table class="table table-hover">
				<thead>
					<tr>
						<th><input type="checkbox"></th>
						<th>번호</th>
						<th>아이디</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>성별</th>
						<th>예약 횟수</th>
						<th>리뷰 횟수</th>
                        <th>상태</th>
						<th>이용내역</th>
					</tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td data-toggle="modal" data-target="#selectModal" style="cursor: pointer; color: rgb(221,45,45);">user01</td>
                        <td>박연진</td>
                        <td>010-1111-2222</td>
                        <td>여</td>
                        <td>5</td>
                        <td>3</td>
                        <td>정상</td>
                        <td><button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#selectUseModal">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>user01</td>
                        <td>박연진</td>
                        <td>010-1111-2222</td>
                        <td>여</td>
                        <td>5</td>
                        <td>3</td>
                        <td>정상</td>
                        <td><button type="button" class="btn btn-outline-danger">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>user01</td>
                        <td>박연진</td>
                        <td>010-1111-2222</td>
                        <td>여</td>
                        <td>5</td>
                        <td>3</td>
                        <td>정상</td>
                        <td><button type="button" class="btn btn-outline-danger">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>user01</td>
                        <td>박연진</td>
                        <td>010-1111-2222</td>
                        <td>여</td>
                        <td>5</td>
                        <td>3</td>
                        <td>정상</td>
                        <td><button type="button" class="btn btn-outline-danger">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>user01</td>
                        <td>박연진</td>
                        <td>010-1111-2222</td>
                        <td>여</td>
                        <td>5</td>
                        <td>3</td>
                        <td>정상</td>
                        <td><button type="button" class="btn btn-outline-danger">조회</button></td>                    
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>user01</td>
                        <td>박연진</td>
                        <td>010-1111-2222</td>
                        <td>여</td>
                        <td>5</td>
                        <td>3</td>
                        <td>정상</td>
                        <td><button type="button" class="btn btn-outline-danger">조회</button></td>                    
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>user01</td>
                        <td>박연진</td>
                        <td>010-1111-2222</td>
                        <td>여</td>
                        <td>5</td>
                        <td>3</td>
                        <td>정상</td>
                        <td><button type="button" class="btn btn-outline-danger">조회</button></td>                    
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>user01</td>
                        <td>박연진</td>
                        <td>010-1111-2222</td>
                        <td>여</td>
                        <td>5</td>
                        <td>3</td>
                        <td>정상</td>
                        <td><button type="button" class="btn btn-outline-danger">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>user01</td>
                        <td>박연진</td>
                        <td>010-1111-2222</td>
                        <td>여</td>
                        <td>5</td>
                        <td>3</td>
                        <td>정상</td>
                        <td><button type="button" class="btn btn-outline-danger">조회</button></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td>1</td>
                        <td>user01</td>
                        <td>박연진</td>
                        <td>010-1111-2222</td>
                        <td>여</td>
                        <td>5</td>
                        <td>3</td>
                        <td>정상</td>
                        <td><button type="button" class="btn btn-outline-danger">조회</button></td>
                    </tr>
                </tbody>	
			</table>
		</div>
		
	</div>
	<script>
		$(function(){
			$('#title').text("예약관리");
			$('#menu1').click();

			// Menubar.jsp 내의 요소, 스타일이 include시 바뀌는 버그를 수정하기 위한 코드(건들필요X)
			$('#page-name').css({"font-size":"28px", "font-weight":600, "margin-left":"10px", "margin-top":"5px"});
		})
		
	</script>
</body>
</html>