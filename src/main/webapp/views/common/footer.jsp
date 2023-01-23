<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /*footer*/
    #footer-line{
        width:100%;
        float: left;
        /* box-sizing: border-box; */
        padding: 40px;
    }
    #footer-line>div{
        height:1px;
        background-color: lightgrey;
    }
    .footer div{
        border: 1px;
    }
    #footer1-padding{
        float:left;
        box-sizing: border-box;
        padding: 5px;
        width: 100%;
        height: 200px;
    }
    #footer1{
        margin-left: 5%;
        margin-bottom: 1%;
        height: 20%;
    }
    #footer2{
        margin-left: 5%;
        height: 70%;
        color: gray;
        line-height: 150%;
    }
    #footer3{
        text-align: center;
        height: 10%;
        color: gray;
        padding: 5%;
    }
    #footer1>a{
        text-decoration: none;
        color: black;
        font-size: 14px;
        margin: 10px;
        vertical-align: middle;
    }
</style>
</head>
<body>
    <!--푸터-->
    <div id="footer-line" width="1200">
        <div></div>
    </div> 
    <div class="footer">
        <div id="footer1-padding">
            <div id="footer1">
                <a href="">푸딩소개</a>
                <a href="">이용약관</a>
                <a href="">개인정보처리방침</a>
                <a href="">고객센터</a>
            </div>
            <div id="footer2">
                법인명(상호) : 주식회사 푸딩 | 사업자등록번호 : 261-81-00000 <br>
                통신판매업 : 제 2023-서울금천-00000호 | 개인정보보호책임자 : 푸딩 <br>
                주소 : 서울특별시 구로구 가산디지털2로 115, 11층(가산동) | 대표이사 : 푸딩 <br>
                입점문의 : 입점문의하기 | 제휴문의 : business@fooding.com <br>
                채용문의 : recruit@fooding.com <br>
                고객센터 : 1644 - 0000 <br>
            </div>
            <div id="footer3">
                COPYRIGHT ⓒ FOODING CORP. ALL RIGHT RESERVED.
            </div>
        </div>
    </div>
</body>
</html>