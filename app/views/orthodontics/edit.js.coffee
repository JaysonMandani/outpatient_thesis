$("#OrthoEditRecord").modal "show"
$("#OrthoEditRecord").html "<%= escape_javascript( render(:partial => 'form'))%>"
$(".datepicker").datepicker
  autoSize: true
  onSelect: (dateText, inst) ->
    $(this).parent("form").submit()
