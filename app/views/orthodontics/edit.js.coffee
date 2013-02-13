$("#OrthoEditRecord").modal "show"
$("#OrthoEditRecord").html "<%= escape_javascript( render(:partial => 'form'))%>"
$(".datepicker").datepicker()