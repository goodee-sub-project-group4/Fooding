<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		/* ↓↓↓ 기본골격용 스타일들 (수정할필요X) */
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
			border-width:0px;
			width:200px;
			height: 100%;
			z-index: 1000;
			position: absolute;
		}
		#footer {
			width:1200px;
			margin:auto;
		}
		/* ↓↓↓ 컨텐츠용 스타일 */
		#faq-area {
			width:800px;
			margin: auto;
		}
		table td, table th {
			margin:auto;
			text-align: center;
			line-height: 25px;     
		}

		/*라디오 버튼*/
		input{
			accent-color: rgb(221,45,45);
		}
		label{
			color: dimgray
		}

		/*카테고리*/
		#select{
			border: 1px solid gray;
			border-radius: 4px;
			width: 130px;
			height: 33px;
			float:right;
		}
		
		/*표...상단*/
		.listTitle{
			margin-left: 32px;
			border-bottom: 1px solid rgb(223, 223, 223);
			border-top: 2px solid rgb(223, 223, 223);
			padding-bottom: 20px;
			padding-top: 20px;
		}
		.listTitle>div {
			display: inline-block;
		}

		/*표 내용*/
		.list {
			cursor: pointer;
			height: 40px;
			border-bottom: 1px solid rgb(223, 223, 223);
			margin-left: -30px
		}
		.list>div>div{
			display: inline-block; 
		}

		.content {
			position: relative;
			padding-left: 70px; 
			padding-bottom: 30px;
			text-align: left;
			white-space: pre-line;
			border-bottom: 1px solid rgb(244, 244, 244);
			display: none;
			margin-left: -30px;
		} 
		
		#number{
			width: 100px;
			text-align: center;
		}
		#category{
			width: 150px;
			text-align: center;
		}
		#faqTitle{
			width: 500px;
			text-align: center;
		}
	</style>
</head>
<body>
	
	<%@ include file="head.jsp" %>
	<div id="outer2">
		<div id="menubar">
			<%@ include file="menubar.jsp" %>
		</div>
		<div id="content">
			<!-- 컨텐츠 작성부 -->
			<br><br>
			<div id="faq-area">
                <select id="select">
                    <option value="">전체보기</option>
                    <option value="">예약/결제</option>
                    <option value="">취소</option>
					<option value="">서비스오류</option>
                </select><br>


                <table class="table">
                    <tr style="border-bottom: 2px solid rgb(223, 223, 223); height: 50px;">
                        <th width="80px">번호</th>
                        <th width="110px">카테고리</th>
                        <th width="400px">제목</th>
                    </tr>                    
                </table>

                <ul>
                    <div class="list">
                        <div>
                            <div id="number">1</div>
                            <div id="category">업체</div>
                            <div id="faqTitle">
                                아이디, 비밀번호를 잊어버렸습니다
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
                            <div id="category">업체</div>
                            <div id="faqTitle">
                                아이디, 비밀번호를 잊어버렸습니다
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
                            <div id="category">업체</div>
                            <div id="faqTitle">
                                아이디, 비밀번호를 잊어버렸습니다
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
                            <div id="category">업체</div>
                            <div id="faqTitle">
                                아이디, 비밀번호를 잊어버렸습니다
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
                            <div id="category">업체</div>
                            <div id="faqTitle">
                                아이디, 비밀번호를 잊어버렸습니다
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
                            <div id="category">업체</div>
                            <div id="faqTitle">
                                아이디, 비밀번호를 잊어버렸습니다
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
                            <div id="category">업체</div>
                            <div id="faqTitle">
                                아이디, 비밀번호를 잊어버렸습니다
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
                            <div id="category">업체</div>
                            <div id="faqTitle">
                                아이디, 비밀번호를 잊어버렸습니다
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
                            <div id="category">업체</div>
                            <div id="faqTitle">
                                아이디, 비밀번호를 잊어버렸습니다
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
                            <div id="category">업체</div>
                            <div id="faqTitle">
                                아이디, 비밀번호를 잊어버렸습니다
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
			
		</div>
	</div>
	<br><br><br><br><br><br><br>
	<div id="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>	
	<script>
		$(function(){
			// Head.jsp 내의 요소, #title의 문구를 변경한다.
			$('#title').text("FAQ");
			//$('#menu3-detail').find('li').eq(1).click();
            $('#menu3').css("background-color","whitesmoke");
            $('#menu3').css("color","rgb(221,45,45)");

			//답변 펼침효과
			$(".list").click(function(){
				$(this).parent().siblings("ul").children(".content").slideUp();
				$(this).next().slideToggle();
			})
			

		})
	</script>
</body>
</html>