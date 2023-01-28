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

    .selectList-main{width: 95%; display: inline-block; margin-left: 2.5%;}
    .selectList-no{width: 5%; height: 200px; float: left; line-height: 200px; text-align: center; margin-right: 15px;}
    .selectList-img{width: 180px; height: 200px; float: left;}
    .selectList-text{width: 350px; height: 200px; padding-top: 5px; padding-left: 15px; float: left;}
    .selectList-btn{width: 220px; height: 200px; padding-top: 30px; float: right; position: relative;}
    .selectList-btn button{margin-bottom: 25px; height: 55px;}
    .allways-btn{float: right; width: 100px; margin-right: 15px;}
    .service-complete-btn{display: block;}
    
    /* 예약리스트 페이징 */
    .paging{height: 50px; text-align: center; padding-top: 20px;}
    
    /* 리뷰쓰기모달 */
    .modal fade { border:none;}
    .modal-header {padding:30px; border:none;}
    /* content2 */
    .review-content2 {height:200px; position:relative; border-top:1px solid black; border-bottom:1px solid black; margin-top:-25px;}
    #review-content2-1 {height:100%; width:18%;}
    #review-content2-2 {height:100%; width:50%; position:absolute; top:0px; left:25%;}
    #review-content2-3 {height:100%; width:20%; position:absolute; top:0px; left:80%;}
    /* content2 내용 */
    #review-content2-1 img {margin:20px;}
    #review-content2-2 div { margin-top:40px;}
    #review-content2-2-1 {height:15%; font-size:23px; font-weight:600; margin-top:50px;}
    #review-content2-3 p {border:1px solid black; width:70px; position:absolute; top:150px; right:65px;}
    #review-content2-3 select {height:13%; position:absolute; top:150px; right:20px;}
    /* content3 */
    .review-content3 {height:230px; position:relative;}
    #review-content3-1 {height:100%; width:15%; }
    #review-content3-2 {height:100%; width:85%;position:absolute; top:0px; right:0px;} 
    /* content3 내용 */
    #review-content3-1 p, #review-content5-1 p {margin:20px; font-weight:600; font-size:15px;}
    #review-content3-2 textarea {margin-left:40px; height:90%; width:540px; margin-top:20px; border-radius:5px;}
    /* content4 */
    .review-content4 {height:340px; position:relative;}
    #review-content4-1 {height:100%; width:15%;}
    #review-content4-1 p { margin:20px; font-size:16px; font-weight:600;}
    #review-content4-2 {height:100%; width:85%; position:absolute; top:0px; left:15%; padding:20px;} 
    #review-content4-2 p {color:rgb(190, 190, 190); font-size:13px; margin-top:10px; padding-left:20px;}
    #review-content4-2 img {margin:20px; margin-top:10px;}
    /* content5 */
    #review-content5 {width:60px; margin:auto; padding-top:30px;}
    
    /* 문의하기모달 */
    .modal-header {padding:30px; border:none;}
    /* content2 */
    .question-content2 {height:200px; position:relative; border-top:1px solid black; border-bottom:1px solid black; margin-top:-25px;}
    #question-content2-1 {height:100%; width:18%;}
    #question-content2-2 {height:100%; width:50%; position:absolute; top:0px; left:25%;}
    /* content5 */
    .question-content5 {height:60px; position:relative;}
    #question-content5-1 {height:100%; width:15%; }
    #question-content5-2 {height:100%; width:85%;position:absolute; top:0px; right:0px;} 
    #question-content5-1 p{position:absolute; top:25px; left:20px; font-weight:600; font-size:15px;}
    #question-content5-2 input {margin-left:40px; height:70%; width:540px; margin-top:20px; border-radius:5px;}
    /* content2 내용 */
    #question-content2-1 img {margin:20px;}
    #question-content2-2 div { margin-top:40px;}
    #question-content2-2-1 {height:15%; font-size:23px; font-weight:600; margin-top:50px;}
    /* content3 */
    .question-content3 {height:230px; position:relative;}
    #question-content3-1 {height:100%; width:15%; }
    #question-content3-2 {height:100%; width:85%;position:absolute; top:0px; right:0px;}
    #question-content3-1 p{position:absolute; top:25px; left:20px; font-weight:600; font-size:15px;}
    #question-content3-2 textarea {margin-left:40px; height:90%; width:540px; margin-top:20px; border-radius:5px;}
    /* content4 */
    .question-content4 {height:340px; position:relative;}
    #question-content4-1 {height:100%; width:15%;}
    #question-content4-1 p { margin:20px; font-size:16px; font-weight:600;}
    #question-content4-2 {height:100%; width:85%; position:absolute; top:-20px; left:15%; padding:20px;} 
    #question-content4-2 p {color:rgb(190, 190, 190); font-size:13px; margin-top:10px; padding-left:20px;}
    #question-content4-2 img {margin:20px; margin-top:10px;}
    /* content5 */
    #question-content5 {width:60px; margin:auto; padding-top:30px;}
    
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
        <div class="selectList-main">
            <b style="font-size: larger;">결제일시 &nbsp;&nbsp;&nbsp; 2023.01.01</b>
            <hr style="display: block; margin-top: 5px; margin-bottom: 30px; background: black; height: 2px;">
            
            <div>
                <div class="selectList-no" style="font-size: 20px;">01</div>
                <img src="" alt="" class="selectList-img">
                <div>
                    <div class="selectList-text">
                        <table>
                            <tr>
                                <th style="width: 80px; height: 70px;">업체명</th>
                                <td style="width: 250px;">업체이름</td>
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
                    <div class="selectList-btn">
                        <div class="allways-btn">
                            <div>
                                <button type="button" class="btn btn-outline-secondary">상세조회</button>
                            </div>
                            <div>
                                <button type="button" class="btn btn-outline-secondary">문의하기</button>
                            </div>
                        </div>
                        <div class="service-complete-btn">
                            <div>
                                <button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#reviewModal">리뷰쓰기</button>
                            </div>
                            <div>
                                <button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#reviewModal">신고하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <br><br><br><br>
        <div class="paging">
            < 1 2 3 4 5 6 7 8 9 >
        </div>
    </div>
    
    <!-- 리뷰쓰기모달  -->
    <!-- The Modal -->
	<div class="modal fade" id="reviewModal">
	    <div class="modal-dialog modal-lg">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header">
	          <h3 class="modal-title"><b>리뷰</b></h3><br><br>
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	            <div class="review-content2">
	                <div id="review-content2-1"><img src="C:\Users\lbn06\Desktop\오븐\KakaoTalk_20230125_213512530_01.jpg" width="130" height="160"></div>
	                <div id="review-content2-2">
	                    <div id="review-content2-2-1">제목</div>
	                </div>
	                <div id="review-content2-3">
	                    <p>★ 별점</p>
	                    <select name="star" id="star">
	                        <option value="1.0">1.0</option>
	                        <option value="1.5">1.5</option>
	                        <option value="2.0">2.0</option>
	                        <option value="2.5">2.5</option>
	                        <option value="3.0">3.0</option>
	                        <option value="3.5">3.5</option>
	                        <option value="4.0">4.0</option>
	                        <option value="4.5">4.5</option>
	                        <option value="5">5</option>
	                    </select>
	                </div>
	            </div>
	            <div class="review-content3">
	                <div id="review-content3-1"><p>내용</p></div>
	                <div id="review-content3-2"><textarea name="review_content" style="resize:none"></textarea></div>
	            </div>
	            <div class="review-content4">
	                <div id="review-content4-1"><p>사진첨부</p></div>
	                <div id="review-content4-2">
	                    <img id="img1" src="C:\Users\lbn06\Desktop\오븐\KakaoTalk_20230123_223422687.jpg" width="150" height="150">
	                    <img id="img2" src="C:\Users\lbn06\Desktop\오븐\KakaoTalk_20230123_223422687.jpg" width="150" height="150">
	                    <img id="img3" src="C:\Users\lbn06\Desktop\오븐\KakaoTalk_20230123_223422687.jpg" width="150" height="150">
	                    <br>
	                    <p> - 사진은 최대 8 장까지, 30 MB 이하의 이미지만 업로드가 가능합니다. <br> 
	                        - 상품과 무관하거나 반복되는 동일 단어 / 문장을 사용하여 후기로 볼 수      
	                        없는 <br>&nbsp 글, 판매자와 고객의 후기 이용을 방해한다고 판단되는 경우, 
	                        배송 박스, 구매 <br>&nbsp 상품을 구분할 수 없는 전체 사진, 화면캡쳐, 음란 및 부적절하
	                        거나 불법적인 <br>&nbsp 내용은 통보없이 삭제 및 적립금 회수될 수 있습니다. <br>
	                        - 전화번호, 이메일, 주소, 계좌번호 등 개인정보가 노출되지 않도록 주의해
	                        주<br>&nbsp세요. <br>
	                        </p></div>
	                </div>
	                <br>
	                <!-- Modal footer -->
	                <div class="modal-footer" style="border:none;" >
	                    <close type="button" class="btn btn-danger" data-toggle="modal" data-target="#reviewModal" style="width:90px;">등록</button>
	                </div>
	                <br>
	                
	            </div>
	        </div>
	      </div>
	    </div>
	  </div>
	  
	  <!-- 문의하기모달 -->
	  <!-- The Modal -->
        <div class="modal fade" id="questionModal">
            <div class="modal-dialog modal-lg">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title">1 : 1 문의</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                
                <!-- Modal body -->
                <div class="modal-body">

                    <div class="question-content2">
                        <div id="question-content2-1"><img src="C:\Users\lbn06\Desktop\오븐\KakaoTalk_20230125_213512530_01.jpg" width="130" height="160"></div>
                        <div id="question-content2-2">
                            <div id="question-content2-2-1">식당이름</div>
                        </div>
                    </div>

                    <div class="question-content5">
                        <div id="question-content5-1"><p>제목</p></div>
                        <div id="question-content5-2"><input type="text" style="width:540px;"></div>
                    </div>

                    <div class="question-content3">
                        <div id="question-content3-1"><p>내용</p></div>
                        <div id="question-content3-2"><textarea name="review_content" style="resize:none"></textarea></div>
                    </div>

                    <div class="question-content4">
                        <div id="question-content4-1"><p>사진첨부</p></div>
                        <div id="question-content4-2">
                            <img id="img11" src="C:\Users\lbn06\Desktop\오븐\KakaoTalk_20230123_223422687.jpg" width="150" height="150">
                            <img id="img22" src="C:\Users\lbn06\Desktop\오븐\KakaoTalk_20230123_223422687.jpg" width="150" height="150">
                            <img id="img33" src="C:\Users\lbn06\Desktop\오븐\KakaoTalk_20230123_223422687.jpg" width="150" height="150">
                            <br>
                            <p> - 사진은 최대 8 장까지, 30 MB 이하의 이미지만 업로드가 가능합니다. <br> 
                                - 상품과 무관하거나 반복되는 동일 단어 / 문장을 사용하여 후기로 볼 수      
                                없는 <br>&nbsp 글, 판매자와 고객의 후기 이용을 방해한다고 판단되는 경우, 
                                배송 박스, 구매 <br>&nbsp 상품을 구분할 수 없는 전체 사진, 화면캡쳐, 음란 및 부적절하
                                거나 불법적인 <br>&nbsp 내용은 통보없이 삭제 및 적립금 회수될 수 있습니다. <br>
                                - 전화번호, 이메일, 주소, 계좌번호 등 개인정보가 노출되지 않도록 주의해
                                주<br>&nbsp세요. <br>
                                </p></div>
                        </div>
                        <br>
                    </div>

                    <!-- Modal footer -->
                    <br>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="width:90px;">등록</button>
                    </div>
                    <br>

                    </div>
                </div>
            </div>
        </div>
	  
</body>
</html>