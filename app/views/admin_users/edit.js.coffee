$("#EditUser").modal "show"
$("#EditUser").html "<%= escape_javascript( render(:partial => 'form'))%>"
$(".datepicker").datepicker()