# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('#receipt_shopping_date').datepicker(dateFormat: 'yy-mm-dd')
  $.datepicker.setDefaults($.datepicker.regional['PL']);
