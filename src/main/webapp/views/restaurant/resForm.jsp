<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
    /* 가로 규격 */
    .wrap{width: 1200px; margin: auto; margin-top: 50px; margin-bottom: 100px;}

    /*content*/
    .content{
        border: 4px solid crimson;
        width: 1200px;
        box-sizing: border-box;
        margin: auto;
    }

    #content-padding{
        margin: auto;
        padding: 5px;
        box-sizing: border-box;
    }
    #content-padding>img{
        margin: auto;
        display: block;
    }

    .inputForm{
        width: 200px;
        margin:auto;
   
    }
    
    .ss{
        color:red; 
    }
    
</style>
</head>
<body>
    <div class="wrap">
        <div class="content">
            <div id="content-padding">

				<br><br><br>
                <img src="/Fooding/resources/images/logo.png" width="300px">
				<br><br><br><br><br>
				
				
                <form name="form" action="<%= contextPath %>/resForm.res" method="post" enctype="multipart/form-data">

                    <div class="inputForm">
                        대표자명 <span style="color:red;">*</span> <br>
                        <input type="text" name="ceo" id="ceo" required> <br>
                        <span id="ceoHelper" class="ss"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        상호명 <span style="color:red;">*</span>  <br>
                        <input type="text" name="resName" id="resName" required> <br> 
                        <span id="resNameHelper" class="ss"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        사업자등록번호 <span style="color:red;">*</span>  <br>
                        <input type="text" name="permitNo" id="permitNo" required> <br> 
                        <span id="permitNoHelper" class="ss"></span>
                    </div>
                    <br><br>

                    <div>
                        
                    </div>
                    <div class="inputForm">
                        주소 <span style="color:red;">*</span>  <br>
                        <input type="text" name="address" id="address" required> <br> 
                        <span id="addressHelper" class="ss"></span>
                    </div>
                    <br><br>

					
                    <div class="inputForm">
                        상세주소 <span style="color:red;">*</span>  <br>
                        <input type="text" name="dAddress" id="dAddress" required> <br> 
                        <span id="dAddressHelper" class="ss"></span>
                    </div>
                    <br><br>
                    
                    
                    <div class="inputForm">
                     
		                <!-- 지역 카테고리 시작(퍼옴)-->
		                <script language='javascript'>
		                
		                        var cnt = new Array();
		                        cnt[0] = new Array('전체');
		                        cnt[1] = new Array('전체','강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');
		                        cnt[2] = new Array('전체','강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');
		                        cnt[3] = new Array('전체','남구','달서구','동구','북구','서구','수성구','중구','달성군');
		                        cnt[4] = new Array('전체','계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');
		                        cnt[5] = new Array('전체','광산구','남구','동구','북구','서구');
		                        cnt[6] = new Array('전체','대덕구','동구','서구','유성구','중구');
		                        cnt[7] = new Array('전체','남구','동구','북구','중구','울주군');
		                        cnt[8] = new Array('전체','고양시','과천시','광명시','구리시','군포시','남양주시','동두천시','부천시','성남시','수원시','시흥시','안산시','안양시','오산시','의왕시','의정부시','평택시','하남시','가평군','광주시','김포시','안성시','양주군','양평군','여주군','연천군','용인시','이천군','파주시','포천시','화성시');
		                        cnt[9] = new Array('전체','강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','황성군');
		                        cnt[10] = new Array('전체','제천시','청주시','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');
		                        cnt[11] = new Array('전체','공주시','보령시','서산시','아산시','천안시','금산군','논산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');
		                        cnt[12] = new Array('전체','군산시','김제시','남원시','익산시','전주시','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');
		                        cnt[13] = new Array('전체','광양시','나주시','목포시','순천시','여수시','여천시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','여천군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');
		                        cnt[14] = new Array('전체','경산시','경주시','구미시','김천시','문겅시','상주시','안동시','영주시','영천시','포항시','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');
		                        cnt[15] = new Array('전체','거제시','김해시','마산시','밀양시','사천시','울산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','양산시','의령군','창녕군','하동군','함안군','함양군','합천군');
		                        cnt[16] = new Array('전체','서귀포시','제주시','남제주군','북제주군');
		
		                        function change(add) {
		                            sel=document.form.county
		                            /* 옵션메뉴삭제 */
		                            for (i=sel.length-1; i>=0; i--){
		                                sel.options[i] = null
		                            }
		
		                            /* 옵션박스추가 */
		                            for (i=0; i < cnt[add].length;i++){                     
		                                sel.options[i] = new Option(cnt[add][i], cnt[add][i]);
		                            }         
		                        }
		                    
		                </script>
		                
		                    시/도 <span style="color:red;">*</span>
                            <br>
		                 
		                    <select name='city' onchange="change(this.selectedIndex);" class=input style="width:190px;">
		                        <option value='전체'>전체</option>
		                        <option value='서울특별시'>서울특별시</option>
		                        <option value='부산광역시'>부산광역시</option>
		                        <option value='대구광역시'>대구광역시</option>
		                        <option value='인천광역시'>인천광역시</option>
		                        <option value='광주광역시'>광주광역시</option>
		                        <option value='대전광역시'>대전광역시</option>
		                        <option value='울산광역시'>울산광역시</option>
		                        <option value='경기도'>경기도</option>
		                        <option value='강원도'>강원도</option>
		                        <option value='충청북도'>충청북도</option>
		                        <option value='충청남도'>충청남도</option>
		                        <option value='전라북도'>전라북도</option>
		                        <option value='전라남도'>전라남도</option>
		                        <option value='경상북도'>경상북도</option>
		                        <option value='경상남도'>경상남도</option>
		                        <option value='제주도'>제주도</option>
		                    </select>   
		                    <div style="height: 40px"></div>
		                    구/군 <span style="color:red;">*</span>
                            <br>
		                    <select name='county'  class=select style="width:190px;">
		                        <option value=''>전체</option>
		                    </select>
                    
                    </div>
                    <br><br>
                    
                    <div class="inputForm">
                        전화번호 <span style="color:red;">*</span>  <br>
                        <input type="text" name="phone" id="phone" required> <br> 
               
                        <span id="phoneHelper" class="ss"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        휴대폰번호 <span style="color:red;">*</span>  <br>
                        <input type="text" name="cellphone" id="cellphone" required> <br> 
                        <span id="cellHelper" class="ss"></span>
                    </div>
                    <br><br>

                    <div class="inputForm">
                        이메일 <span style="color:red;">*</span>  <br>
                        <input type="email" name="email" id="email" required> <br> 
                        <span id="emailHelper" class="ss"></span>
                    </div>
                    <br><br>


                    <div class="inputForm">
                        사업체유형 (업종) <span style="color:red;">*</span>  <br>

                        <select name="foodCt" id="foodCt" style="width:190px;">
                            <option value="western">양식</option>
                            <option value="japanese">일식</option>
                            <option value="chinese">중식</option>
                            <option value="chicken">분식류/치킨</option>
                            <option value="asia">아시아/퓨전</option>
                            <option value="buffet">뷔페/레스토랑</option>
                            <option value="bar">술집</option>
                            <option value="cafe">카페</option>
                        </select>
                    </div> 
                    <br><br>

                    <div class="inputForm">
                        주차여부 <span style="color:red;">*</span>  <br>
                        <input type="radio" name="parking" id="Y" value="Y" checked> <label for="Y">가능</label>
                        <input type="radio" name="parking" id="N" value="N"> <label for="N">불가능</label>
                    </div>
                    <br><br>

					
                    <div class="inputForm">
                        업체사진등록 <span style="color:red;">*</span>  <br> 
                        <input type="file" name="rImg" id="rImg" required> <br> 
                    </div>
                    <br><br>
					 	
                    
                    <br><br>
                    <p><button type="submit" class="btn btn-danger btn-block" style="margin:auto; width:400px;" >업체등록요청</button></p>
                    <br><br>
                </form>
            </div>
        </div>

        

        <script>

        
            // (1) 대표자명, 상호명, 사업자등록번호, 주소, 상세주소, 전화번호, 휴대폰번호, 이메일 입력 칸에 

            // 아무것도 입력하지 않았을 때 "필수정보입니다."가 뜨도록 !!
            

            // (2) 유효성체크를 위한 regExp 전역변수 선언 

            let regExp; 

            //업체등록요청 버튼을 누르지 않아도 입력칸에서 focusout 이벤트가 발생하는 순간, 바로바로 유효성체크가 이뤄지도록) 

            // 유효성체크할 목록: 대표자명, 사업자등록번호, 전화번호, 휴대폰번호
            
            $(function(){

                // 1) 대표자명 아무것도 입력 안 했을 때 
                // 대표자명에서 커서가 이동할 때 
                $("#ceo").focusout(function(){
                    // 대표자명 값이 null 값이라면 
                    if($("#ceo").val() == "" || $("#ceo").val() == null){
                        $("#ceoHelper").html("필수정보입니다."); 
                    }else{
                        // 대표자명 값이 null 값이 아니라면 --> 유효성체크(한글로 2글자 이상)
                        regExp = /^[가-힣]{2,}$/;
                        if(!regExp.test($("#ceo").val())){
                            $("#ceoHelper").html("한글로 2글자 이상의 이름을 입력해주세요");
                        }else{
                            $("#ceoHelper").html(""); 
                        }
                    }
                })


                // 2) 상호명 아무것도 입력 안 했을 때 
                // 상호명에서 커서가 이동할 때 
                $("#resName").focusout(function(){
                    // 상호명 값이 null 값이라면 
                    if($("#resName").val() == "" || $("#resName").val() == null){
                        $("#resNameHelper").html("필수정보입니다."); 
                    }else{
                        $("#resNameHelper").html(""); 
                    }
                })

                // 3) 사업자등록번호 아무것도 입력 안 했을 때 
                // 사업자등록번호에서 커서가 이동할 때 
                $("#permitNo").focusout(function(){
                    // 사업자등록번호 값이 null 값이라면 
                    if($("#permitNo").val() == "" || $("#permitNo").val() == null){
                        $("#permitNoHelper").html("필수정보입니다."); 
                    }else{
                        // 사업자등록번호 null 값이 아니라면 -->유효성체크(xxx-xx-xxxxx 형식) 
                        regExp = /^\d{3}-\d{2}-\d{5}/;
                        if(!regExp.test($("#permitNo").val())){
                            $("#permitNoHelper").html("xxx-xx-xxxxx 형식으로 입력해주세요!");
                        }else{
                            $("#permitNoHelper").html(""); 
                        }

                    }
                })


                // 4) 주소 아무것도 입력 안 했을 때 
                // 주소에서 커서가 이동할 때 
                $("#address").focusout(function(){
                    // 주소 값이 null이라면
                    if($("#address").val() == "" || $("#address").val() == null){
                        $("#addressHelper").html("필수정보입니다.");
                    }else{
                        $("#addressHelper").html(""); 
                    }
                })

               
                // 5) 상세주소 아무것도 입력 안 했을 때 
                // 상세주소에서 커서가 이동할 때 
                $("#dAddress").focusout(function(){
                    // 상세주소 값이 null 이라면 
                    if($("#dAddress").val() == "" || $("#dAddress").val() == null){
                        $("#dAddressHelper").html("필수정보입니다."); 
                    }else{
                       $("#dAddressHelper").html(""); 
                    }
                })
               

                // 6) 전화번호 아무것도 입력 안 했을 때 
                // 전화번호에서 커서가 이동할 때 
                $("#phone").focusout(function(){ 
                    // 전화번호 값이 null 이라면 
                    if($("#phone").val() == "" || $("#phone").val() == null){
                        $("#phoneHelper").html("필수정보입니다."); 
                    }else{ 
                        // 전화번호 값이 null 값이 아니라면 --> 유효성체크(0xx-xxx-xxxx 형식 또는 0x-xxx-xxxx 형식)) 
                        regExp = /^0\d{1,2}-\d{3}-\d{4}$/;
                        if(!regExp.test($("#phone").val())){
                            $("#phoneHelper").html("0xx-xxx-xxxx 형식으로 입력해주세요!"); 
                        }else{
                            $("#phoneHelper").html(""); 
                        }

                    }
                })


                // 7) 휴대폰번호 아무것도 입력 안 했을 때
                // 휴대폰번호에서 커서가 이동할 때 
                $("#cellPhone").focusout(function(){
                    // 휴대폰번호 값이 null이라면 
                    if($("#cellPhone").val() == "" || $("#cellPhone").val() == null){
                        $("#cellHelper").html("필수정보입니다."); 
                    }else{
                        // 휴대폰번호 값이 null 값이 아니라면 --> 유효성체크(0xx-xxxx-xxxx 형식)
                        regExp = /^0\d{2}-\d{4}-\d{4}$/;
                        if(!regExp.test($("#cellPhone").val())){
                            $("#cellHelper").html("0xx-xxxx-xxxx 형식으로 입력해주세요!"); 
                        }else{
                            $("#cellHelper").html(""); 
                        }
                    }
                })


                // 8) 이메일 아무것도 입력 안 했을 때 
                // 이메일에서 커서가 이동할 때 
                $("#email").focusout(function(){
                    // 이메일 값이 null이라면
                    if($("#email").val() == "" || $("#email").val() == null){
                        $("#emailHelper").html("필수정보입니다."); 
                    }else{
                        $("#emailHelper").html(""); 
                    }
                })
 
            })

   
        </script>

        <div id="footer">
        </div>
    </div>
</body>
</html>