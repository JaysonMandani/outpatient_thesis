$("#EditPediaExam").modal "show"
$("#EditPediaExam").html "<%= escape_javascript(render(:partial => "edit_form")) %>"