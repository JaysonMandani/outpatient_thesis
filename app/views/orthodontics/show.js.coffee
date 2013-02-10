$("#OrthoShowRecord").modal "show"
$("#OrthoShowRecord").html "<%= escape_javascript( render(:partial => 'show'))%>"