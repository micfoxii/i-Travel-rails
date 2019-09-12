class City < ApplicationRecord
  # belongs_to :state
  belongs_to :country
  
  has_many :reviews
  has_many :users, through: :reviews

  scope :search, -> (query, country) { query ? country.cities.where("name LIKE ?", "%#{query}%") : country.cities}

  def city_state_country
    "#{self.name},  #{country.name}" # TODO ADD #{state.name}, IF COUNTRY US
  end

  def average_city_rating
    if self.reviews.count(:rating) == 0
      "Be the first to rate this city!"
    else
      self.reviews.average(:rating).to_f.round(1) #TODO convert to glyphies stars in view
    end
  end


end
