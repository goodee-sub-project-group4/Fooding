<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 제이쿼리구문 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <!-- 부트스트랩 링크3개 -->
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        #content2-padding {width:900px; height: 800px; margin: auto; margin-top: 45px; padding: 20px; box-sizing:border-box; float:left;}
        /* #content2-padding div {border:1px solid green;} */
        #change-area {width: 100%; height: 135px; font-size: 30px; text-align: center; padding-top:20px;
            display: inline-block; border-bottom:1px solid black;}
        #change-infomation {width:800px; margin: auto;}
        /* 첫번째 칸 */
        th {width:25%; height:80px; text-align: right; padding-right:10px;}
        /* 두번째 칸 input */
        .input-area2 {width:50%;}
        .input-area2 input {width:380px; height:40px; margin:20px; font-size:small; padding-left:10px;}
        .gender-area input {margin:20px;}
        .gender-area {font-weight:600;}
        .birth-area input {margin:20px; width:80px; padding-left:20px; font-weight:600;}
        .check-terms input {margin:20px 10px 0px 20px;}
        /* 세번째 칸 */
        .input-area3 {width:20%;}
        .input-area3-phone button {margin-left:5px;}
        .input-area3-nickname button { margin-left:5px; width:125px;}
        .terms {height: 120px;}
        .terms div {padding-left:20px; margin-top:-10px;}
        .terms a {color:black; text-decoration:none; font-weight:600; font-size:14px;}
        /*  가입버튼 */
        #change-btn input {width:130px; height:50px; font-weight:500;}
        #change-btn button {width:130px; height:50px; font-weight:500;}

    </style>
</head>
<body>
	
	<%@ include file="/views/common/head.jsp" %>
	<%@ include file="/views/common/myPageSidebar.jsp" %>
	<%
		String userId = loginUser.getUserId();
		String userPwd = loginUser.getUserPwd();
		String updatePWd = loginUser.getUpdatePwd();
		String userName = loginUser.getUserName();
		String nickname = loginUser.getNickname();
		String userEmail = loginUser.getUserEmail();
		String userPhone = loginUser.getUserPhone();
		String gender = loginUser.getGender() == null ? "" : loginUser.getGender();
		String birth = loginUser.getBirth();
	%>

    

	<div id="content2-padding">
        <div id="change-area">
            <b>개인 정보 수정</b>
        </div>
        <div id="change-infomation">
            <form action="<%=contextPath%>/update.me" method="post" class="enroll-form">
                    
                <table class="table1">
                    <tr>
                        <th>아이디</th>
                        <td class="input-area2"><input type="text" size="55" name="userId" value="<%=userId%>" readonly required></td> <!--아이디는 미리 입력되어있어야함-->
                        <td class="input-area3-id"></td>
                    </tr>
                    <tr>
                        <th>현재 비밀번호</th>
                        <td class="input-area2"><input type="password" size="55" name="userPwd" value="<%=userPwd%>" readonly maxlength="15" placeholder="비밀번호를 입력해주세요" required></td>
                        <td class="input-area3"></td>
                    </tr>
                    <tr>
                        <th>새 비밀번호</th>
                        <td class="input-area2"><input type="password" size="55" name="updatePwd" maxlength="15" placeholder="새로운 비밀번호를 입력해주세요"></td>
                        <td class="input-area3"></td>
                    </tr>
                    <tr>
                        <th>비밀번호 확인</th>
                        <td class="input-area2"><input type="password" size="55" maxlength="15" placeholder="비밀번호를 한 번 더 입력해주세요"></td>
                        <td class="input-area3"></td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td class="input-area2"><input type="text" size="55" name="userName" value="<%=userName%>" maxlength="10" placeholder="이름을 입력해주세요" required></td>
                        <td class="input-area3"></td>
                    </tr>
                    <tr>
                        <th>닉네임</th>
                        <td class="input-area2"><input type="text" size="55" name="nickname" value="<%=nickname%>" placeholder="닉네임을 입력해주세요" required></td>
                        <td class="input-area3-nickname"><button type="button" class="btn btn-danger">중복확인</button></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td class="input-area2"><input type="email" size="55" name="userEmail" value="<%=userEmail%>" placeholder="예:fooding@fooding.com"></td>
                        <td class="input-area3"></td>
                    </tr>
                    <tr>
                        <th>휴대폰</th>
                        <td class="input-area2"><input type="text" size="55" name="userPhone" value="<%=userPhone%>" placeholder="-빼고 숫자만 입력해주세요"></td>
                        <td class="input-area3-phone"><button type="button" class="btn btn-danger">다른번호 인증</button></td>
                    </tr>
                    <tr>
                        <th></th>
                        <td class="input-area2"><input type="text" size="55"></td>
                        <td class="input-area3-phone"><button type="button" class="btn btn-danger">인증번호 확인</button></td>
                    </tr>
                    <tr>
                        <th>성별&nbsp;&nbsp;&nbsp; </th>
                        <td class="gender-area">
                            <input type="radio" style="width:17px; height:17px;" name="gender" value="M">남자
                            <input type="radio" style="width:17px; height:17px;" name="gender" value="F">여자
                            <input type="radio" style="width:17px; height:17px;" name="gender" value="N">선택안함
                        </td>
                        <td class="input-area3"></td>
                    </tr>
                    <tr>
                        <th>생년월일&nbsp;&nbsp;&nbsp; </th>
                        <td class="birth-area" width="500px">
                            <input type="text" size="10" placeholder="YYYY" value="" name="birth">
                            <span>/</span>
                            <input type="text" size="10" placeholder="MM" value="" name="birth">
                            <span>/</span>
                            <input type="text" size="10" placeholder="DD" value="" name="birth">
                        </td>
                        <td class="input-area3"></td>
                    </tr>
                </table>
                
                
                
                <br><br>
                    <div align="center" id="change-btn">
                        <button type="button" class="btn btn-outline-danger" onclick="location.href='<%=contextPath%>/delete.me'">회원탈퇴</button>&nbsp;&nbsp;
                        <input type="submit" class="btn btn-danger" value="회원정보수정">
                    </div>
                    <br><br>
            </form>

        </div>

    </div>

    <script>
        $(function() {
            const gender = "<%=gender%>";
            $("input[type=radio]").each(function() {
                if(gender.search($(this).val()) != -1) {
                    $(this).attr("checked", true);
                }
            })
            const birth = "<%=birth%>";
            const year = birth.substr(0, 4);
            const month = birth.substr(4, 2);
            const day = birth.substr(6, 2);
            const birthArr = [year, month, day]     
            $('.birth-area').children('input').each(function(i) {
                $(this).val(birthArr[i]);
            });
        })
    </script>

</body>
</html>