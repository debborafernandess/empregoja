class Job < ActiveRecord::Base
  belongs_to :company

  validates :company, :title, :description, :location, :category, presence: true
end
