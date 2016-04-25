class Job < ActiveRecord::Base
  DAYS_TO_BE_RECENT = 5.days
  belongs_to :company
  belongs_to :category

  scope :expired, -> { where("created_at < #{90.days.ago}")}

  validates :title, :category, :description, :location, presence: true

  def recent?
    Time.zone.now < (created_at + DAYS_TO_BE_RECENT)
  end

  def expired?
    created_at < 90.days.ago
  end
end
