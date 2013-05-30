# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $("a.editable_number").editable({
    type: 'number',
    ajaxOptions: {
      type: 'put'
    },
    url: window.location 
  })
  $(".btn.launch_modal").click(
    ->
     $("#add_leave_type_modal").modal() 
  )
