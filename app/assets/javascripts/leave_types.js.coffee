# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $("#add_leave_type").click(
    ->
      $("#add_leave_type_modal").modal()
  )
