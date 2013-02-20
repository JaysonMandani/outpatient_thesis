$("#EditOrthoExam").modal "show"
$("#EditOrthoExam").html "<%= escape_javascript(render(:partial => "edit_form")) %>"