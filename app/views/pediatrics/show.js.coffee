$("#PediaShowRecord").modal "show"
$("#PediaShowRecord").html "<%= escape_javascript( render(:partial => 'show'))%>"