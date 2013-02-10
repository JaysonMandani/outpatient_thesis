$("#PediaEditRecord").modal "show"
$("#PediaEditRecord").html "<%= escape_javascript( render(:partial => 'form'))%>"