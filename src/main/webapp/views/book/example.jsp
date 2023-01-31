<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.0/index.global.min.js"></script>
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
</body>
</html>