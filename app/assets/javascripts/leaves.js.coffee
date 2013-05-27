# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.launch_calendar = (events) ->
  $('#calendar').fullCalendar({
    events: events,
    dayClick: (date) ->
      $("#remove_leave").hide()
      $("#new_leave").show()
      $("#date").val(date)
    eventClick: (event) ->
      $("#new_leave").hide()
      $("#remove_leave").show()
      $("#remove_leave_form").attr("action", "/leaves/#{event.id}")
  })
