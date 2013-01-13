class PatientDrawer 
	def self.ortho(orthodontic)
		pdf = PDF::Writer.new
		orthodontics.each do |orthodontic|
			pdf.text orthodontic.name
		end
	pdf.render
	end
end