class PediaExamination < ActiveRecord::Base
  attr_accessible :pediatric_id, :examination_date, :weight, :height, :history_physical_exams, :physicians_instructions
end
