pdf.text "Hello World"

pdf.move_down(30)

patient_records = @orthodontic.map do |patient_record|
	[
		patient_record.id
	]
end