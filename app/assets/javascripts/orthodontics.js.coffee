# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery.ajaxSetup beforeSend: (xhr) ->
  xhr.setRequestHeader "Accept", "text/javascript"

$(document).ready ->
  $("#user-edit form").submit ->
    $.post $(this).attr("action"), $(this).serialize(), null, "script"
    false
