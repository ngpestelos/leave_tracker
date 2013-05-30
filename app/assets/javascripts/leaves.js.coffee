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
      date.setDate(date.getDate() + 1) #monkey-patching, default behavior of datepicker displays date a day before (idk why)
      $("#new_leave #date").datepicker('update', date)
      $(".modal-header > h3").text("Add leave")
    eventClick: (event) ->
      $("#new_leave").hide()
      if(event.allow_click)
        $('#leave_modal').modal()
        $('#hr_leave_modal').modal()
        $("#edit_leave").show()
        $("#remove_leave").show()
        leave_path = "/leaves/#{event.id}"
        $("#edit_leave_form").attr("action", leave_path)
        event.start.setDate(event.start.getDate() + 1) #monkey-patching, default behavior of datepicker displays date a day before (idk why)
        $("#edit_leave #date").datepicker('update', event.start)
        if(event.is_approved == null)
          $("#edit_leave h4").text("Status: Unapproved")
          $("#approve_leave h4").text("Status: Unapproved")
        else
          $("#approve_leave h4").text("Status: Approved") 
          $("#edit_leave h4").text("Status: Approved")
        $(".modal-header > h3").text("Edit leave")
        $("#edit_leave #leave_type").val(event.leave_type_id)
        $("#remove_leave_form").attr("action", leave_path)
      else
        $("#new_leave").hide()
        $("#edit_leave").hide()
        $("#remove_leave").hide()
  })
