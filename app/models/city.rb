class City < ApplicationRecord
  belongs_to :country
  belongs_to :state
  has_many :reviews
  has_many :users, through: :reviews

  def city_attributes=(attributes)
    if attributes[:city] != ""
      city = City.find_or_create_by(name: attributes[:city])
    if attributes[:country] != ""
      country = Country.find_or_create_by(name: attributes[:country])
    # if attributes[:state] != ""
    #   state = State.find_or_create_by(name: attributes[:state])
    else
      country = Country.find_by(id: attributes[:country_id])
      # state = State.find_by(id: attributes[:state_id])
    end
    country.cities << city if city != "" && country != ""
    country.save if country != ""
    # state.cities << city if city != "" && state != ""
    # state.save if state != ""
    self.city_id = city.id
  end
end
end
end
