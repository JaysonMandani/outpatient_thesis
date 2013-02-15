$("#OrthoEditRecord").modal "show"
$("#OrthoEditRecord").html "<%= escape_javascript( render(:partial => 'form'))%>"
# $("body").on "click", "input.datepicker", (event) ->
#   $(this).datepicker(
#     showOn: "focus"
#     yearRange: "1900:+0"
#     changeMonth: true
#     changeYear: true
#   ).focus()
# $(".datepicker").datepicker()
$("#datepicker").live "click", ->
  $(this).datepicker $.datepicker.regional["en"]