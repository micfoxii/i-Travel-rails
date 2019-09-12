class Review < ApplicationRecord
  belongs_to :user
  belongs_to :city
  # has_one :state, through: :city
  # has_one :country, through: :state

  validates_length_of :title, minimum: 5, maximum: 30, allow_blank: false
  validates_length_of :content, minimum: 30, allow_blank: false
  # validates :rating, :presence true

  accepts_nested_attributes_for :city

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
      country.cities << city if city != "" && country != "" #&& state != ""
      country.save if country != ""
      # state.save if state != ""
      self.city_id = city.id
    end
  end

end
