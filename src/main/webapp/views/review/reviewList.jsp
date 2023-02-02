<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.fd.review.model.vo.Review" %>
<%
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰리스트</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 제이쿼리 구문 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>


    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<style>
        /* 리뷰바상단 */
        #content2-padding {width: 900px; height: 1000px; margin:auto; margin-top: 45px; padding: 20px; box-sizing:border-box; float: left;}
        /*#content2-padding div {border:1px solid green;}*/
        #review-area {width: 100%; height: 135px; font-size: 30px; margin-bottom: 30px; text-align: center;}
        #revise-btn {width:10%; margin-left:774px; margin-top:65px;}
        #revise-btn button {width:60px; height:35px; padding:3px;}

        /* 타이틀 */
        #review-title {height:60px; border-bottom:1px solid black; border-top:1px solid black; position:relative; text-align:center; font-weight: 600;}
        #review-title1 {height:100%; width:5%;}
        #review-title2 {height:100%; width:5%; position:absolute; top:0px; left:5%; padding-top:14px;}
        #review-title3 {height:100%; width:55%; position:absolute; top:0px; left:10%; padding-top:14px;}
        #review-title4 {height:100%; width:10%; position:absolute; top:0px; left:65%; padding-top:14px;}
        #review-title5 {height:100%; width:15%; position:absolute; top:0px; left:75%; padding-top:14px;}
        #review-title6 {height:100%; width:10%; position:absolute; top:0px; left:90%;}
       
        /* 내용틀 */
        .review-content {height:180px; border-bottom:1px solid black; position:relative;}
        #review-content1 {height:100%; width:5%; text-align:center; padding-top:70px;}
        #review-content2 {height:100%; width:5%; position:absolute; top:0px; left:5%; text-align:center; padding-top:70px;}
        #review-content3 {height:100%; width:20%; position:absolute; top:0px; left:10%;text-align:center; padding-top:20px;}
        #review-content4 {height:100%; width:35%; position:absolute; top:0px; left:30%;}
        #review-content5 {height:100%; width:10%; position:absolute; top:0px; left:65%; text-align:center; padding-top:70px;}
        #review-content6 {height:100%; width:15%; position:absolute; top:0px; left:75%; text-align:center; padding-top:70px;}
        #review-content7 {height:100%; width:10%; position:absolute; top:0px; left:90%; text-align:center; padding-top:65px;}

        /* 내용 */
        #review-content4-1 {height:30%; padding:20px; padding-top:40px; font-weight:600;}
        #review-content4-2 {height:70%; padding:20px; color:rgb(86, 86, 86);}
        #review-content7 button {height:35px;}
        
        /* 페이징 */
        #paging {margin-top: 50px;}
        .container a {color:red; }
        .pagination {justify-content: center;}       
        
        /* 리뷰쓰기모달 */
        .modal fade {border: none;}
        .modal-header1 { padding: 30px; border: none;}
        .modal-title b {margin-left: 20px;}
        .close {margin-top: -80px;}

        /* content2 */
        .review-content2 {height: 200px; position: relative; border-top: 1px solid black; border-bottom: 1px solid black; margin-top: -45px;}
        #review-content2-1 {height: 100%; width: 18%; }
        #review-content2-2 {height: 100%; width: 50%; position: absolute; top: 0px; left: 25%;}
        #review-content2-3 {height: 100%; width: 20%; position: absolute; top: 0px; left: 80%;}

        /* content2 내용 */
        #review-content2-1 img {margin: 20px;}
		#review-content2-2 div {margin-top: 40px;}
		#review-content2-2-1 {height: 15%; font-size: 23px; font-weight: 600; margin-top: 50px;}
		#review-content2-3 p {width: 70px; position: absolute; top: 150px; right: 65px;}
		#review-content2-3 select {height: 13%; position: absolute; top: 150px; right: 20px;}

        /* content3 */
        .review-content3 {height: 230px; position: relative;}

        #review-content3-1 {height: 100%; width: 15%;}
		#review-content3-2 {height: 100%; width: 85%; position: absolute; top: 0px; right: 0px;}

        /* content3 내용 */
        #review-content3-1 p,
        #review-content5-1 p {margin: 20px; font-weight: 600; font-size: 15px;}

        #review-content3-2 textarea {margin-left: 40px; height: 90%; width: 540px; margin-top: 20px; border-radius: 5px;}

        /* content4 */
        .review-content4 {height: 340px; position: relative;}
        #review-content4-1 {height: 50%; width: 100%; position: absolute; left:0px; padding-left:10px;}
        #review-content4-1 p {margin: 10px; font-size: 16px; font-weight: 600;}
		#review-content4-2 {height: 50%; width: 100%; position: absolute; top: 35%; padding: 10px;}
		#review-content4-2 p {color: rgb(190, 190, 190); font-size: 13px; padding-left: 20px;}
		#review-content4-2 img {margin: 20px;margin-top: 10px;}

      	/* content5 */
      	#review-content5 {width: 60px; margin: auto; padding-top: 70px;} 
      
    </style>
    
</head>
<body>

	<%@ include file="/views/common/head.jsp" %>
	<%@ include file="/views/common/myPageSidebar.jsp" %>

    <div id="content2-padding">
        <div id="review-area">
            <b>내가 쓴 리뷰</b>
            <div id="revise-btn"><button type="button" class="btn btn-outline-danger">삭제</button></div>
        </div>
        <div id="review-title">
            <div id="review-title1"></div>
            <div id="review-title2">번호</div>
            <div id="review-title3">예약명</div>
            <div id="review-title4">별점</div>
            <div id="review-title5">작성일</div>
            <div id="review-title6"></div>
        </div>
	<% if(list.isEmpty()) { %>
        <!-- case1. 리뷰가 없을 경우 -->
        <!-- <div align="center" style="margin-top:20px;"><b>존재하는 리뷰가 없습니다.</b></div> -->
        
	<% } else { %>
        <!-- case2. 리뷰가 있을 경우 -->
        <% for(Review r : list) { %>
        <div class="review-content">
            <div id="review-content1"><input type="checkbox" style="width:20px; height:20px; accent-color: rgb(222, 66, 66); "></div>
            <div id="review-content2"><%= r.getReviewNo() %></div>
            <div id="review-content3"><img src="" width="125" height="140"></div>
            <div id="review-content4">
                <div id="review-content4-1"><%= r.getResNo() %></div>
             	<%
             		String rc = r.getReviewContent();
             		String finalRc = "";
             		if(rc.length() > 40) {
             			finalRc = rc.substring(0, 39) + "...";
             		} else {
             			finalRc = r.getReviewContent();
             		}
             	%>
                <div id="review-content4-2" style="border:1px solid red;"><%= finalRc %></div>
            </div>
            <div id="review-content5">★ <%= r.getStar() %></div>
            <div id="review-content6"><%= r.getCreateDate() %></div>
            <div id="review-content7"><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#reviewModifyModal">수정</button></div>
            
        </div>
       <% } %>
	<% } %>
        
        <div id="paging">
            <div class="container">                  
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                </ul>
            </div>
        </div>
    </div>
    
	<!-- 리뷰쓰기모달  -->
                <!-- The Modal -->
                <div class="modal fade" id="reviewModifyModal">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header1">
                                <h3 class="modal-title"><b>리뷰</b></h3><br>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <form action="<%= contextPath%>/reviewForm.re" id="review-form" method="post" enctype="multipart/form-data">
                                <div class="modal-body"></div>
                                    <div class="review-content2">
                                        <div id="review-content2-1"><img src="" width="130" height="160"></div> <!-- 업체이미지 가져와야함 -->
                                        <div id="review-content2-2">
                                            <div id="review-content2-2-1">업체명</div> <!-- 업체명 가져와야함  -->
                                            <!-- <input type="hidden" name="resNo" value="">
                                            <input type="hidden" name="userNo" value=""> -->
                                            
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
                                                <option value="5.0" selected>5.0</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="review-content3">
                                        <div id="review-content3-1">
                                            <p>내용</p>
                                        </div>
                                        <div id="review-content3-2"><textarea name="reviewContent" style="resize:none"
                                                required></textarea></div>
                                    </div>
                                    <div class="review-content4">
                                        <div id="review-content4-1">
                                            <p>사진첨부</p>
                                        </div>
                                        <div id="review-content4-2">
                                            <img id="img1" src="" width="150" height="150" onclick="clickFile(1);">
                                            <img id="img2" src="" width="150" height="150" onclick="clickFile(2);">
                                            <img id="img3" src="" width="150" height="150" onclick="clickFile(3);">

                                            <div id="file-area" style="display:none">
                                                <input type="file" name="file1" onchange="loadImg(this, 1);">
                                                <input type="file" name="file2" onchange="loadImg(this, 2);">
                                                <input type="file" name="file3" onchange="loadImg(this, 3);">
                                            </div>

                                            <br>
                                            <p> - 사진은 최대 8 장까지, 30 MB 이하의 이미지만 업로드가 가능합니다. <br>
                                                - 상품과 무관하거나 반복되는 동일 단어 / 문장을 사용하여 후기로 볼 수
                                                없는 <br>&nbsp 글, 판매자와 고객의 후기 이용을 방해한다고 판단되는 경우,
                                                배송 박스, 구매 <br>&nbsp 상품을 구분할 수 없는 전체 사진, 화면캡쳐, 음란 및 부적절하
                                                거나 불법적인 <br>&nbsp 내용은 통보없이 삭제 및 적립금 회수될 수 있습니다. <br>
                                                - 전화번호, 이메일, 주소, 계좌번호 등 개인정보가 노출되지 않도록 주의해
                                                주<br>&nbsp세요. <br>
                                            </p>
                                        </div>
                                    </div>
                                    <br>

                                    <!-- Modal footer -->
                                    <div class="modal-footer" style="border:none;">
                                        <input type="submit" class="btn btn-danger" style="width:90px;" value="등록">
                                    </div>
                                    <br>
                            </form>

                            <!-- 사진첨부 스크립트 -->
                            <script>
                            	// 클릭했을 때 파일첨부 가능
                            	function clickFile(num) {
                            		$("input[name=file" + num + "]" ).click();
                            	}
                            
                            
                         		// inputFile : input type="file" 요소객체 / num : input요소에 변화가 생겼는지 구분숫자(해당 img 영역)
                                function loadImg(inputFile, num) {
                                    
                         			if(inputFile.files.length == 1) { // 파일이 있다면 미리보기
                         				// 파일 읽을 FileReader 객체생성
                         				const reader = new FileReader();
                         				// 파일 읽어들이는 메소드 실행
                         				reader.readAsDataURL(inputFile.files[0]);
                         				// 이 파일만의 고유한 url 부여됨
                         				
                         				// 읽기 완료. 실행할 함수
                         				reader.onload = function(e) { 
                         					// e.target.result : url 경로
                         					switch(num) {
                         					case 1 : $("#img1").attr("src", e.target.result); break;
                         					case 2 : $("#img2").attr("src", e.target.result); break;
                         					case 3 : $("#img3").attr("src", e.target.result); break;
                         					}
                         				}
                         				
                         			} else { // 미리보기 취소
                         				switch(num) {
                     					case 1 : $("#img1").attr("src", null); break;
                     					case 2 : $("#img2").attr("src", null); break;
                     					case 3 : $("#img3").attr("src", null); break;
                     					}
                         				
                         			}
                                    
                                }

                            </script>
                            
                        </div>
                    </div>
                </div>
                </div>
    
   
</body>
</html>