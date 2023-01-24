<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 리스트</title>
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
        #content2-padding {width: 900px; height:1300px; margin: auto; margin-top: 45px; padding: 20px; box-sizing:border-box; float:left;}
        /* #content2-padding div {border:1px solid green;} */
        #notice-area {width: 100%; height: 135px; font-size: 30px; text-align: center; display: inline-block;}
        #list-area {height: 600px;}
        
        /*표 내용*/
        .list {
            cursor: pointer;
            height: 40px;
            border-bottom: 1px solid rgb(223, 223, 223);
            margin-left: -30px;
        }
        .list>div>div{
            display: inline-block; 
        }

        .table th {text-align: center;}
        .content {
            width: 780px;
            position: relative;
            text-align: left;
            white-space: pre-line; 
            display: none;
            } 
        #answer {margin-top:-25px;}
        #number {width: 70px; text-align: center;}
        #category {width: 150px; text-align: center;}
        #faqTitle { padding-left:10px;}

        /*페이징바*/
        .pagination a {color:red; margin-top:20px;}
        
    </style>
</head>
<body>
	<div><%@ include file="/views/common/head.jsp" %></div>
	<div><%@ include file="/views/common/CustomerServiceSidebar.jsp" %></div>

    <div id="content2-padding">
        <div id="notice-area">
            <b>공지사항</b>
        </div>
        <div id="list-area">
            <table class="table">
                <tr style="border-bottom: 2px solid rgb(223, 223, 223); height: 50px;">
                    <th width="80px">번호</th>
                    <th width="150px">카테고리</th>
                    <th>제목</th>
                </tr>
            </table>
            <ul>
                <div class="list">
                    <div>
                        <div id="number">1</div>
                        <div id="category">회원</div>
                        <div id="faqTitle">
                            <div>아이디, 비밀번호를 잊어버렸습니다</div>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div id="answer">
                        ■ 아이디, 비밀번호 찾기 안내

                        - 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송 됩니다.

                        [로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]
                        
                    </div>
                </div>
            </ul>
            <ul>
                <div class="list">
                    <div>
                        <div id="number">1</div>
                        <div id="category">회원</div>
                        <div id="faqTitle">
                            <div>아이디, 비밀번호를 잊어버렸습니다</div>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div id="answer">
                        ■ 아이디, 비밀번호 찾기 안내

                        - 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송 됩니다.

                        [로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]
                        
                    </div>
                </div>
            </ul>
            <ul>
                <div class="list">
                    <div>
                        <div id="number">1</div>
                        <div id="category">회원</div>
                        <div id="faqTitle">
                            <div>아이디, 비밀번호를 잊어버렸습니다</div>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div id="answer">
                        ■ 아이디, 비밀번호 찾기 안내

                        - 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송 됩니다.

                        [로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]
                        
                    </div>
                </div>
            </ul>
            <ul>
                <div class="list">
                    <div>
                        <div id="number">1</div>
                        <div id="category">회원</div>
                        <div id="faqTitle">
                            <div>아이디, 비밀번호를 잊어버렸습니다</div>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div id="answer">
                        ■ 아이디, 비밀번호 찾기 안내

                        - 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송 됩니다.

                        [로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]
                        
                    </div>
                </div>
            </ul>
            <ul>
                <div class="list">
                    <div>
                        <div id="number">1</div>
                        <div id="category">회원</div>
                        <div id="faqTitle">
                            <div>아이디, 비밀번호를 잊어버렸습니다</div>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div id="answer">
                        ■ 아이디, 비밀번호 찾기 안내

                        - 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송 됩니다.

                        [로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]
                        
                    </div>
                </div>
            </ul>
            <ul>
                <div class="list">
                    <div>
                        <div id="number">1</div>
                        <div id="category">회원</div>
                        <div id="faqTitle">
                            <div>아이디, 비밀번호를 잊어버렸습니다</div>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div id="answer">
                        ■ 아이디, 비밀번호 찾기 안내

                        - 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송 됩니다.

                        [로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]
                        
                    </div>
                </div>
            </ul>
            <ul>
                <div class="list">
                    <div>
                        <div id="number">1</div>
                        <div id="category">회원</div>
                        <div id="faqTitle">
                            <div>아이디, 비밀번호를 잊어버렸습니다</div>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div id="answer">
                        ■ 아이디, 비밀번호 찾기 안내

                        - 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송 됩니다.

                        [로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]
                        
                    </div>
                </div>
            </ul>
            <ul>
                <div class="list">
                    <div>
                        <div id="number">1</div>
                        <div id="category">회원</div>
                        <div id="faqTitle">
                            <div>아이디, 비밀번호를 잊어버렸습니다</div>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div id="answer">
                        ■ 아이디, 비밀번호 찾기 안내

                        - 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송 됩니다.

                        [로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]
                        
                    </div>
                </div>
            </ul>
            <ul>
                <div class="list">
                    <div>
                        <div id="number">1</div>
                        <div id="category">회원</div>
                        <div id="faqTitle">
                            <div>아이디, 비밀번호를 잊어버렸습니다</div>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div id="answer">
                        ■ 아이디, 비밀번호 찾기 안내

                        - 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송 됩니다.

                        [로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]
                        
                    </div>
                </div>
            </ul>
            <ul>
                <div class="list">
                    <div>
                        <div id="number">1</div>
                        <div id="category">회원</div>
                        <div id="faqTitle">
                            <div>아이디, 비밀번호를 잊어버렸습니다</div>
                        </div>
                    </div>
                </div>
                <div class="content">
                    <div id="answer">
                        ■ 아이디, 비밀번호 찾기 안내

                        - 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송 됩니다.

                        [로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]
                        
                    </div>
                </div>
            </ul>

        </div>

        <div>
            <ul class="pagination justify-content-center" style="margin:50px 0">
                <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
            </ul>
        </div> 
        <br><br><br>

    </div>

    <script>
		$(function(){
			$('#title').text("FAQ");
			$('#menu4-detail-2').click();
            $('#menu4').css("background-color","whitesmoke");
            $('#menu4').css("color","rgb(221,45,45)");
		})


        $(function(){
            $(".list").click(function(){
                $(this).next().slideToggle();
            })
        })
 
	</script>
	
</body>
</html>