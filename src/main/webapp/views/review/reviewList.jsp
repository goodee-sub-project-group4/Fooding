<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내가 쓴 리뷰</title>
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
        .outer {border:1px solid black; width:1200px; height:1500px; position:relative;}
        .review-area {border:1px solid black; width:75%; height:1500px; margin:1px; position:absolute; right:1px;}
        /* 상단 영역 */
        .review-head { border:1px solid black; width:100%; height:170px; margin:auto;}
        .review-head1-1 { border:1px solid black; width:80%; height:70px; position:absolute; left:5px; top:90px;}
        .review-head1-2 { border:1px solid black; width:15%; height: 70px; position:absolute; right:5px; top:90px;}
        /* 내가 쓴 리뷰문구, 버튼 */
        .review-head1-1 h2 {width:250px; font-weight:500; position:absolute; left:5px; top:20px;}
        .review-head1-2 button {width:60px; height:30px; padding:3px; position:absolute; right:10px; top:40px;}
       
        /* 예약명 내용 */
        #content-box {width:300px; height:170px; position:absolute; left:280px; padding:15px; margin:5px;}
        #content-box div {margin:5px; padding-top:5px;}
        #res-name {height:30%; font-weight:600;}
        #review-content {height:60%;}
        
        /* 글씨위치 가운데로 하기위해서 */
        #star, #date {padding-top:70px; text-align: center;}
        #no {padding-top:80px;}
        #button  { padding-top:65px; position:absolute; right:3px;}
        #button button {width:60px; height:30px; padding:3px;}
        #img {padding:20px; position:absolute; left:120px; }

        

    </style>
</head>
<body>

    <div class="outer">
        <div class="review-area">
            <div class="review-head">
                <div class="review-head1-1"><h2>내가 쓴 리뷰</h2></div>
                <div class="review-head1-2"><button type="button" class="btn btn-outline-danger">삭제</button></div>
            </div>

            <table class="table">
                <thead>
                    <tr align="center">
                        <th width="80">번호</th>
                        <th colspan="2" width="500">예약명</th>
                        <th width="100">별점</th>
                        <th width="100">작성일</th>
                        <th width="100">버튼</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td id="no"><input type="checkbox" style="width:17px; height:17px;"><span> 3</span></td>
                        <td id="img"><img src="C:\Users\lbn06\Desktop\오븐\KakaoTalk_20230109_214834302.jpg" width="120" height="160"></td>
                        <td>
                            <div id="content-box">
                                <div id="res-name">식당이름</div>
                                <div id="review-content">리뷰내용</div>
                            </div>
                        </td>
                        <td id="star"><p>★ 별점</p></td>
                        <td id="date"><p>작성일</p></td>
                        <td id="button"><button type="button" class="btn btn-outline-danger">수정</button></td>
                    </tr>
                </tbody>

            </table>

        </div>
    </div>
    
</body>
</html>