class Studio < ApplicationRecord
  has_many :movies

  def actor_by_age_still_working
    Actor.joins(:movies).order(age: :desc).where(currently_working: true)
  end

end
