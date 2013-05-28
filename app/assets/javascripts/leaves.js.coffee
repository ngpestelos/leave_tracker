# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.launch_calendar = (events) ->
  $('#calendar').fullCalendar({
    header: {
      left: null,
      center: 'title',
    },
    height: 800,
    events: events,
    dayClick: (date) ->
      $('#leave_modal').modal()
      $("#edit_leave").hide()
      $("#remove_leave").hide()
      $("#new_leave").show()
      $("#new_leave #date").val(date)
      $(".modal-header > h3").text(date)
    eventClick: (event) ->
      $("#new_leave").hide()
      if(event.allow_click)
        $('#leave_modal').modal()
        $("#edit_leave").show()
        $("#remove_leave").show()
        leave_path = "/leaves/#{event.id}"
        $("#edit_leave_form").attr("action", leave_path)
        $("#edit_leave #date").val(event.start)
        $(".modal-header > h3").text(event.start)
        $("#edit_leave #leave_type").val(event.leave_type)
        $("#remove_leave_form").attr("action", leave_path)
      else
        $("#new_leave").hide()
        $("#edit_leave").hide()
        $("#remove_leave").hide()
  })
