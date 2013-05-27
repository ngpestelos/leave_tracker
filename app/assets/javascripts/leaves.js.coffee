# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.launch_calendar = (events) ->
  $('#calendar').fullCalendar({
    events: events,
    dayClick: (date) ->
      $.ajax(
        {
          type: "POST",
        url: "/leaves/",
        data: {leave_type: 1, date: date},
        success: (data) ->
          $('#calendar').fullCalendar('addEventSource', data)
          $('#calendar').fullCalendar('rerenderEvents')
        }
      )
  })
