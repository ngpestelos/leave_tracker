# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#calendar').fullCalendar({
    events:[{title  : 'event1', start  : '2013-05-24'}],
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
