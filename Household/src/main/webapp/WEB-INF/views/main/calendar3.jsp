<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<title>풀캘린더</title>
<link href='/household/resources/fullcalendar/core/main.css' rel='stylesheet' />
<link href='/household/resources/fullcalendar/daygrid/main.css' rel='stylesheet' />

<script src='/household/resources/fullcalendar/core/main.js'></script>
<script src='/household/resources/fullcalendar/daygrid/main.js'></script>
<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'dayGrid' ],
      defaultView: 'dayGridMonth'
    });

    calendar.render();
  });


  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new Calendar(calendarEl, {
      plugins: [ dayGridPlugin ],
      defaultView: 'dayGridMonth'
    });

    calendar.render();
  });
</script>
<link href='/household/resources/fullcalendar/core/main.css' rel='stylesheet' />
<link href='/household/resources/fullcalendar/daygrid/main.css' rel='stylesheet' />
<body>
    <div id="calendar"></div>
</body>
</html>
