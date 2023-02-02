<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.0/index.global.min.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
      <!-- 결제 API -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
          var calendarEl = document.getElementById('calendar');
          var calendar = new FullCalendar.Calendar(calendarEl, {
            aspectRatio: 0.8,
            initialView: 'dayGridMonth'
          });
          calendar.render();
        });
      </script>
</head>
<body>
    <div id='calendar' style="width: 340px;"></div>
    <button onclick="payment();">결제</button>


    <script>
      var IMP = window.IMP; 
     IMP.init("imp44408883"); 
     function payment() {
       // IMP.request_pay(param, callback) 결제창 호출
       IMP.request_pay({ // param
           pg: "html5_inicis",
           pay_method: "card",
           merchant_uid: "ORD20180131-0000011",
           name: "노르웨이 회전 의자",
           amount: 64900,
           buyer_email: "gildong@gmail.com",
           buyer_name: "홍길동",
           buyer_tel: "010-4242-4242",
           buyer_addr: "서울특별시 강남구 신사동",
           buyer_postcode: "01181"
       }, function (rsp) { // callback
           if (rsp.success) {
             //   ...,
               // 결제 성공 시 로직,
             //   ...
           } else {
             //   ...,
               // 결제 실패 시 로직,
             //   ...
           }
       });
     }
   </script>
</body>
</html>