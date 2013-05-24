# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#calendar').fullCalendar({
    events:[{title  : 'event1', start  : '2010-01-01'}],
    dayClick: (date) ->
      console.log(date)
  })
