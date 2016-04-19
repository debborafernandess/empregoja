class Company < ActiveRecord::Base
  has_many :jobs
  validates :name, :location, :mail, :phone, presence: true



  def premium?
    if jobs.count >= 5
      true
    else
      false
    end
  end
end
