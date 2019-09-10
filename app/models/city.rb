class City < ApplicationRecord
  belongs_to :state
  belongs_to :country
  
  has_many :reviews
  has_many :users, through: :reviews

  def city_state_country
    "#{self.name},  #{country.name}" # TODO ADD #{state.name}, IF COUNTRY US
  end

end
