# $("#flash_notice").html "#{escape_javascript raw(flash_display)}"
# $("#flash_notice").show
$("#OrthoEditRecord").modal "show"
$("#OrthoEditRecord").html "<%= escape_javascript(render(:partial => "form")) %>"
$(".datepicker").datepicker "update"
$(".datepicker").datepicker "remove"
$(".datepicker").datepicker
  format: "yyyy-mm-dd"