$("#EditSched").modal "show"
$("#EditSched").html "<%= escape_javascript( render(:partial => 'form'))%>"
$(".datepicker").datepicker()