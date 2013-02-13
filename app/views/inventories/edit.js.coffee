$("#EditInventory").modal "show"
$("#EditInventory").html "<%= escape_javascript( render(:partial => 'form'))%>"
$(".datepicker").datepicker()