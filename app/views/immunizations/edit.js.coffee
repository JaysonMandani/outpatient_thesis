$("#ImmuneEditRecord").modal "show"
$("#ImmuneEditRecord").html "<%= escape_javascript(render(:partial => "edit_form")) %>"