<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* 적립금 조회 상단 */
    #point-content-padding {width: 900px; height: 2000px; margin: auto; margin-top: 45px; padding: 20px; box-sizing:border-box; float: left;}
    #selectList{width: 100%; height: 80px; font-size: 30px; display: inline-block; text-align: center;}
    #selectDate{width: 100px; height: 35px; margin-top: 5px; float: right; font-size: 15px;}

    /* 적립금 조회 테이블 */
    #point-content{width:850px; margin: auto; margin-top: 30px;}
    table th{text-align: center; line-height: 25px; background-color:rgb(240, 239, 239);;}
    table td{text-align: center; line-height: 40px;}

    /* 페이징 */
    .paging{height: 50px; text-align: center; padding-top: 20px;}
</style>
</head>
<body>

    <%@ include file="/views/common/head.jsp" %>
	<%@ include file="/views/common/myPageSidebar.jsp" %>

    <div id="point-content-padding">
        <div id="selectList">
            <b>적립금 조회</b>
            <br>
            <select name="selectDate" id="selectDate">
                <option value="oneM" >1개월</option>
                <option value="threeM" >3개월</option>
                <option value="sixM" >6개월</option>
                <option value="oneY" >1년</option>
            </select>
        </div>

        <div id="point-content">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>업체명</th>
                        <th>예약번호</th>
                        <th>적립날짜</th>
                        <th>상태</th>
                        <th>결제금</th>
                        <th>적립금 상태</th>
                        <th>적립금</th>
                        <th>적립금 총액</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>미오 도쿄 다이닝</td>
                        <td>45672548</td>
                        <td>2023/01/24</td>
                        <td>여</td>
                        <td>25,000원</td>
                        <td>적립</td>
                        <td>+ 250원</td>
                        <td>5,240원</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>미오 도쿄 다이닝</td>
                        <td>45672548</td>
                        <td>2023/01/24</td>
                        <td>여</td>
                        <td>25,000원</td>
                        <td>적립</td>
                        <td>+ 250원</td>
                        <td>5,240원</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>미오 도쿄 다이닝</td>
                        <td>45672548</td>
                        <td>2023/01/24</td>
                        <td>여</td>
                        <td>25,000원</td>
                        <td>적립</td>
                        <td>+ 250원</td>
                        <td>5,240원</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>미오 도쿄 다이닝</td>
                        <td>45672548</td>
                        <td>2023/01/24</td>
                        <td>여</td>
                        <td>25,000원</td>
                        <td>적립</td>
                        <td>+ 250원</td>
                        <td>5,240원</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>미오 도쿄 다이닝</td>
                        <td>45672548</td>
                        <td>2023/01/24</td>
                        <td>여</td>
                        <td>25,000원</td>
                        <td>적립</td>
                        <td>+ 250원</td>
                        <td>5,240원</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>미오 도쿄 다이닝</td>
                        <td>45672548</td>
                        <td>2023/01/24</td>
                        <td>여</td>
                        <td>25,000원</td>
                        <td>적립</td>
                        <td>+ 250원</td>
                        <td>5,240원</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>미오 도쿄 다이닝</td>
                        <td>45672548</td>
                        <td>2023/01/24</td>
                        <td>여</td>
                        <td>25,000원</td>
                        <td>적립</td>
                        <td>+ 250원</td>
                        <td>5,240원</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>미오 도쿄 다이닝</td>
                        <td>45672548</td>
                        <td>2023/01/24</td>
                        <td>여</td>
                        <td>25,000원</td>
                        <td>적립</td>
                        <td>+ 250원</td>
                        <td>5,240원</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>미오 도쿄 다이닝</td>
                        <td>45672548</td>
                        <td>2023/01/24</td>
                        <td>여</td>
                        <td>25,000원</td>
                        <td>적립</td>
                        <td>+ 250원</td>
                        <td>5,240원</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>미오 도쿄 다이닝</td>
                        <td>45672548</td>
                        <td>2023/01/24</td>
                        <td>여</td>
                        <td>25,000원</td>
                        <td>적립</td>
                        <td>+ 250원</td>
                        <td>5,240원</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="paging">
            < 1 2 3 4 5 6 7 8 9 >
        </div>
    </div>
</body>
</html>