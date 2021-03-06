class City < ApplicationRecord
  validates :name, presence: true

  belongs_to :country
  
  has_many :reviews
  has_many :users, through: :reviews

  accepts_nested_attributes_for :country



  scope :search, -> (query) { query ? City.where("name LIKE ?", "%#{query}%") : City.all }
  scope :most_reviewed_city, -> { City.joins(:reviews).group("cities.id").order('COUNT(reviews.id) DESC').limit(1)}
  

  def city_state_country
    "#{self.name},  #{country.name}"
  end

  def average_city_rating
    if self.reviews.count(:rating) == 0
      "Be the first to rate this city!"
    else
      self.reviews.average(:rating).to_f.round(1) #TODO convert to glyphies stars in view
    end
  end

  def city_review_count
    self.reviews.count(:id)
  end


end
