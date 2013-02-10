$("#OrthoEditRecord").modal "show"
$("#OrthoEditRecord").html "<%= escape_javascript( render(:partial => 'orthodontics/form'))%>"