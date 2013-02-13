module OrthodonticsHelper
	# def ortho_chart_series(start_time)
	# 	ortho_by_day = Orthodontic.where(:created_at => start_time.beginning_of_day..Time.zone.now.end_of_day).
	# 					group("created_at").
	# 					select("created_at == date, count(full_name) as full_name")
	# 	(start_time.to_date..Date.today).map do |date|
	# 		ortho = ortho_by_day.detect { |ortho| ortho.created_at.to_date == date }
	# 		ortho && ortho.full_name.to_f || 0
	# 	end.inspect
	# end
end
