class Analytic < ActiveRecord::Base
  # attr_accessible :title, :body
  scope :summaries
  scope :scheduled
end
