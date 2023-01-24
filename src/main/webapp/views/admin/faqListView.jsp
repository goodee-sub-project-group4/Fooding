<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
       
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
        /* margin-top: -60px; 내려가있어서 위로 올려줌 */
    }
    #menubar {
        width: 200px;
        height: 100%;
        z-index: 1000;
        position: absolute;
    }

    
    /* ↓↓↓ 컨텐츠용 스타일 */
    form{
        margin: 30px;
    }

    table td, table th {
        margin:auto;
        text-align: center;
        line-height: 25px;     
    }

    .right{
        float: right;
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
        width: 100px;
        height: 33px;
    }

    /*삭제 버튼*/
    #deleteNotice{
        float: right;    
        font-size: 15px;
        width: 70px;
        height: 33px;
    }
    /*등록 버튼*/
    #insertNotice{
        float: right;
        font-size: 15px;
        margin-right: 5px;
        width: 70px;
        height: 33px;
    }

    /*페이징바*/
    .pagination a{
        color:rgb(221,45,45);
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
        margin-left: -30px;
    }
    .list>div>div{
        display: inline-block; 
    }

    .content {
        position: relative;
        padding-left: 70px; padding-bottom: 30px;
        text-align: left;
        white-space: pre-line;
        border-bottom: 1px solid rgb(244, 244, 244);
        display: none;
        margin-left: -30px;
    } 
    
    #checkbox{
        width: 70px;
        text-align: center;
    }
    #number{
        width: 70px;
        text-align: center;
    }
    #category{
        width: 150px;
        text-align: center;
    }
    #faqTitle{
        width: 300px;
    }
    
    
    
</style>
</head>
<body>
	<%@ include file="adminHead.jsp" %>
	<div id="outer2">
		<div id="menubar">
			<%@ include file="adminMenubar.jsp" %>
		</div>
		<div id="content" class="container">

			<!-- 컨텐츠 작성부 -->

            <br><br>
            <form action="">
                
                <!--카테고리-->
                <select id="select">
                    <option value="">회원</option>
                    <option value="">예약/결제</option>
                    <option value="">적립금</option>
                </select>


                <div class="right">
                    <!--회원/업체-->
                    <input type="radio" id="member" name="selectNotice" value="M" checked>
                    <label for="member">회원</label>&nbsp&nbsp
                    <input type="radio" id="restaurant" name="selectNotice" value="R">
                    <label for="restaurant">업체</label>
                    &nbsp&nbsp&nbsp&nbsp

                    <!--등록 삭제-->
                    <button type="button" class="btn btn-outline-danger btn-sm" id="deleteNotice">삭제</button>
                    <a class="btn btn-danger btn-sm" id="insertNotice">등록</a>
                    <br> <br>
                </div>

                <table class="table">
                    <tr style="border-bottom: 2px solid rgb(223, 223, 223); height: 50px;">
                        <th width="70px"><input type="checkbox"></th>
                        <th width="80px">번호</th>
                        <th width="150px">카테고리</th>
                        <th>제목</th>
                    </tr>
                    
                </table>


                <ul>
                    <div class="list">
                        <div>
                            <div id="checkbox"><input type="checkbox"></div>
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
                        <div align="center">
                            <a href="" class="btn btn-danger">수정하기</a>
                        </div>
                    </div>
                </ul>
                <ul>
                    <div class="list">
                        <div>
                            <div id="checkbox"><input type="checkbox"></div>
                            <div id="number">1</div>
                            <div id="category">회원</div>
                            <div id="faqTitle">
                                <div>아이디, 비밀번호를 잊어버렸습니다</div>
                            </div>
                        </div>
                    </div>
                    <div class="content">
                        <div>
                            ■ 아이디, 비밀번호 찾기 안내

                            - 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송 됩니다.

                            [로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]
                        </div>
                    </div>
                </ul>
                <ul>
                    <div class="list">
                        <div>
                            <div id="checkbox"><input type="checkbox"></div>
                            <div id="number">1</div>
                            <div id="category">회원</div>
                            <div id="faqTitle">
                                <div>아이디, 비밀번호를 잊어버렸습니다</div>
                            </div>
                        </div>
                    </div>
                    <div class="content">
                        <div>
                            ■ 아이디, 비밀번호 찾기 안내

                            - 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송 됩니다.

                            [로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]
                        </div>
                    </div>
                </ul>
                <ul>
                    <div class="list">
                        <div>
                            <div id="checkbox"><input type="checkbox"></div>
                            <div id="number">1</div>
                            <div id="category">회원</div>
                            <div id="faqTitle">
                                <div>아이디, 비밀번호를 잊어버렸습니다</div>
                            </div>
                        </div>
                    </div>
                    <div class="content">
                        <div>
                            ■ 아이디, 비밀번호 찾기 안내

                            - 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송 됩니다.

                            [로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]
                        </div>
                    </div>
                </ul>
                <ul>
                    <div class="list">
                        <div>
                            <div id="checkbox"><input type="checkbox"></div>
                            <div id="number">1</div>
                            <div id="category">회원</div>
                            <div id="faqTitle">
                                <div>아이디, 비밀번호를 잊어버렸습니다</div>
                            </div>
                        </div>
                    </div>
                    <div class="content">
                        <div>
                            ■ 아이디, 비밀번호 찾기 안내

                            - 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송 됩니다.

                            [로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]
                        </div>
                    </div>
                </ul>
                <ul>
                    <div class="list">
                        <div>
                            <div id="checkbox"><input type="checkbox"></div>
                            <div id="number">1</div>
                            <div id="category">회원</div>
                            <div id="faqTitle">
                                <div>아이디, 비밀번호를 잊어버렸습니다</div>
                            </div>
                        </div>
                    </div>
                    <div class="content">
                        <div>
                            ■ 아이디, 비밀번호 찾기 안내

                            - 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송 됩니다.

                            [로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]
                        </div>
                    </div>
                </ul>
                <ul>
                    <div class="list">
                        <div>
                            <div id="checkbox"><input type="checkbox"></div>
                            <div id="number">1</div>
                            <div id="category">회원</div>
                            <div id="faqTitle">
                                <div>아이디, 비밀번호를 잊어버렸습니다</div>
                            </div>
                        </div>
                    </div>
                    <div class="content">
                        <div>
                            ■ 아이디, 비밀번호 찾기 안내

                            - 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송 됩니다.

                            [로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]
                        </div>
                    </div>
                </ul>
                <ul>
                    <div class="list">
                        <div>
                            <div id="checkbox"><input type="checkbox"></div>
                            <div id="number">1</div>
                            <div id="category">회원</div>
                            <div id="faqTitle">
                                <div>아이디, 비밀번호를 잊어버렸습니다</div>
                            </div>
                        </div>
                    </div>
                    <div class="content">
                        <div>
                            ■ 아이디, 비밀번호 찾기 안내

                            - 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송 됩니다.

                            [로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]
                        </div>
                    </div>
                </ul>
                <ul>
                    <div class="list">
                        <div>
                            <div id="checkbox"><input type="checkbox"></div>
                            <div id="number">1</div>
                            <div id="category">회원</div>
                            <div id="faqTitle">
                                <div>아이디, 비밀번호를 잊어버렸습니다</div>
                            </div>
                        </div>
                    </div>
                    <div class="content">
                        <div>
                            ■ 아이디, 비밀번호 찾기 안내

                            - 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송 됩니다.

                            [로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]
                        </div>
                    </div>
                </ul>
                <ul>
                    <div class="list">
                        <div>
                            <div id="checkbox"><input type="checkbox"></div>
                            <div id="number">1</div>
                            <div id="category">회원</div>
                            <div id="faqTitle">
                                <div>아이디, 비밀번호를 잊어버렸습니다</div>
                            </div>
                        </div>
                    </div>
                    <div class="content">
                        <div>
                            ■ 아이디, 비밀번호 찾기 안내

                            - 하기 경로를 통해 아이디 및 비밀번호 찾기가 가능하며, 임시 비밀번호의 경우 회원가입 시 등록한 이메일 주소로 발송 됩니다.

                            [로그인] > 화면 아래 [아이디 찾기] [비밀번호 찾기]
                        </div>
                    </div>
                </ul>
                



            </form>
            
            
            <!--페이징바-->
            <ul class="pagination justify-content-center" style="margin:20px 0">
                <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">4</a></li>
                <li class="page-item"><a class="page-link" href="#">5</a></li>
                <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
            </ul> 
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