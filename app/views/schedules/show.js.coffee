$("#ShowSched").modal "show"
$("#ShowSched").html "<%= escape_javascript( render(:partial => 'show'))%>"