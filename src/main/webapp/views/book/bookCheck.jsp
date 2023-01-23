<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
    #content2-padding {width: 900px; height: 2000px; margin: auto; margin-top: 45px; padding: 20px; box-sizing:border-box; float: left;}
    #selectList{width: 100%; height: 100px; font-size: 30px; margin-bottom: 20px; display: inline-block; text-align: center;}
    #selectDate{width: 100px; height: 35px; margin-top: 5px; margin-right: 5%; float: right; font-size: 15px;}

    #selectList-main{width: 95%; display: inline-block; margin-left: 2.5%;}
    #selectList-no{width: 5%; height: 200px; float: left; line-height: 200px; text-align: center; margin-right: 20px;}
    #selectList-img{width: 200px; height: 200px; float: left;}
    #selectList-text{width: 450px; height: 200px; padding-top: 5px; padding-left: 30px; float: left;}
    #selectList-btn{width: 90px; height: 200px; float: right; position: relative;}
    
    /* 예약리스트 페이징 */
    .paging{height: 50px; text-align: center; padding-top: 20px;}
    </style>
</head>
<body>
	
	<%@ include file="/views/common/head.jsp" %>
	<%@ include file="/views/common/myPageSidebar.jsp" %>
	
    <div id="content2-padding">
        <div id="selectList">
            <b>예약/결제내역 조회</b>
            <br>
            <select name="selectDate" id="selectDate">
                <option value="oneM" >1개월</option>
                <option value="threeM" >3개월</option>
                <option value="sixM" >6개월</option>
                <option value="oneY" >1년</option>
            </select>
        </div>
        <div id="selectList-main">
            <b style="font-size: larger;">결제일시 &nbsp;&nbsp;&nbsp; 2023.01.01</b>
            <hr style="display: block; margin-top: 5px; margin-bottom: 30px; background: black; height: 2px;">
            
            <div>
                <div id="selectList-no" style="font-size: 20px;">01</div>
                <img src="" alt="" id="selectList-img">
                <div>
                    <div id="selectList-text">
                        <table>
                            <tr>
                                <th style="width: 80px; height: 70px;">업체명</th>
                                <td style="width: 350px;">업체이름</td>
                            </tr>
                            <tr>
                                <td style="height: 40px;">예약일시</td>
                                <td>2022-12-25 (금) 오후 14:00</td>
                            </tr>
                            <tr>
                                <td style="height: 40px;">예약인원</td>
                                <td>5명</td>
                            </tr>
                            <tr>
                                <td style="height: 40px;">결제금액</td>
                                <td>53,000원</td>
                            </tr>
                        </table>
                    </div>
                    <div id="selectList-btn">
                        <div style="height: 65px; margin-top: 25px;">
                            <button type="button" class="btn btn-outline-secondary">상세조회</button>
                        </div>
                        <div style="height: 65px;">
                            <button type="button" class="btn btn-outline-secondary">문의하기</button>
                        </div>
                        <div><button type="button" class="btn btn-outline-danger">리뷰쓰기</button></div>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br><br>
        <div id="selectList-main">
            <b style="font-size: larger;">결제일시 &nbsp;&nbsp;&nbsp; 2023.01.01</b>
            <hr style="display: block; margin-top: 5px; margin-bottom: 30px; background: black; height: 2px;">
            
            <div>
                <div id="selectList-no" style="font-size: 20px;">01</div>
                <img src="" alt="" id="selectList-img">
                <div>
                    <div id="selectList-text">
                        <table>
                            <tr>
                                <th style="width: 80px; height: 70px;">업체명</th>
                                <td style="width: 350px;">업체이름</td>
                            </tr>
                            <tr>
                                <td style="height: 40px;">예약일시</td>
                                <td>2022-12-25 (금) 오후 14:00</td>
                            </tr>
                            <tr>
                                <td style="height: 40px;">예약인원</td>
                                <td>5명</td>
                            </tr>
                            <tr>
                                <td style="height: 40px;">결제금액</td>
                                <td>53,000원</td>
                            </tr>
                        </table>
                    </div>
                    <div id="selectList-btn">
                        <div style="height: 65px; margin-top: 25px;">
                            <button type="button" class="btn btn-outline-secondary">상세조회</button>
                        </div>
                        <div style="height: 65px;">
                            <button type="button" class="btn btn-outline-secondary">문의하기</button>
                        </div>
                        <div><button type="button" class="btn btn-outline-danger">리뷰쓰기</button></div>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br><br>
        <div id="selectList-main">
            <b style="font-size: larger;">결제일시 &nbsp;&nbsp;&nbsp; 2023.01.01</b>
            <hr style="display: block; margin-top: 5px; margin-bottom: 30px; background: black; height: 2px;">
            
            <div>
                <div id="selectList-no" style="font-size: 20px;">01</div>
                <img src="" alt="" id="selectList-img">
                <div>
                    <div id="selectList-text">
                        <table>
                            <tr>
                                <th style="width: 80px; height: 70px;">업체명</th>
                                <td style="width: 350px;">업체이름</td>
                            </tr>
                            <tr>
                                <td style="height: 40px;">예약일시</td>
                                <td>2022-12-25 (금) 오후 14:00</td>
                            </tr>
                            <tr>
                                <td style="height: 40px;">예약인원</td>
                                <td>5명</td>
                            </tr>
                            <tr>
                                <td style="height: 40px;">결제금액</td>
                                <td>53,000원</td>
                            </tr>
                        </table>
                    </div>
                    <div id="selectList-btn">
                        <div style="height: 65px; margin-top: 25px;">
                            <button type="button" class="btn btn-outline-secondary">상세조회</button>
                        </div>
                        <div style="height: 65px;">
                            <button type="button" class="btn btn-outline-secondary">문의하기</button>
                        </div>
                        <div><button type="button" class="btn btn-outline-danger">리뷰쓰기</button></div>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br><br>
        <div id="selectList-main">
            <b style="font-size: larger;">결제일시 &nbsp;&nbsp;&nbsp; 2023.01.01</b>
            <hr style="display: block; margin-top: 5px; margin-bottom: 30px; background: black; height: 2px;">
            
            <div>
                <div id="selectList-no" style="font-size: 20px;">01</div>
                <img src="" alt="" id="selectList-img">
                <div>
                    <div id="selectList-text">
                        <table>
                            <tr>
                                <th style="width: 80px; height: 70px;">업체명</th>
                                <td style="width: 350px;">업체이름</td>
                            </tr>
                            <tr>
                                <td style="height: 40px;">예약일시</td>
                                <td>2022-12-25 (금) 오후 14:00</td>
                            </tr>
                            <tr>
                                <td style="height: 40px;">예약인원</td>
                                <td>5명</td>
                            </tr>
                            <tr>
                                <td style="height: 40px;">결제금액</td>
                                <td>53,000원</td>
                            </tr>
                        </table>
                    </div>
                    <div id="selectList-btn">
                        <div style="height: 65px; margin-top: 25px;">
                            <button type="button" class="btn btn-outline-secondary">상세조회</button>
                        </div>
                        <div style="height: 65px;">
                            <button type="button" class="btn btn-outline-secondary">문의하기</button>
                        </div>
                        <div><button type="button" class="btn btn-outline-danger">리뷰쓰기</button></div>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br><br>
        <div id="selectList-main">
            <b style="font-size: larger;">결제일시 &nbsp;&nbsp;&nbsp; 2023.01.01</b>
            <hr style="display: block; margin-top: 5px; margin-bottom: 30px; background: black; height: 2px;">
            
            <div>
                <div id="selectList-no" style="font-size: 20px;">01</div>
                <img src="" alt="" id="selectList-img">
                <div>
                    <div id="selectList-text">
                        <table>
                            <tr>
                                <th style="width: 80px; height: 70px;">업체명</th>
                                <td style="width: 350px;">업체이름</td>
                            </tr>
                            <tr>
                                <td style="height: 40px;">예약일시</td>
                                <td>2022-12-25 (금) 오후 14:00</td>
                            </tr>
                            <tr>
                                <td style="height: 40px;">예약인원</td>
                                <td>5명</td>
                            </tr>
                            <tr>
                                <td style="height: 40px;">결제금액</td>
                                <td>53,000원</td>
                            </tr>
                        </table>
                    </div>
                    <div id="selectList-btn">
                        <div style="height: 65px; margin-top: 25px;">
                            <button type="button" class="btn btn-outline-secondary">상세조회</button>
                        </div>
                        <div style="height: 65px;">
                            <button type="button" class="btn btn-outline-secondary">문의하기</button>
                        </div>
                        <div><button type="button" class="btn btn-outline-danger">리뷰쓰기</button></div>
                    </div>
                </div>
            </div>
        </div>
        <br><br><br><br>
        <div class="paging">
            < 1 2 3 4 5 6 7 8 9 >
        </div>
    </div>
</body>
</html>