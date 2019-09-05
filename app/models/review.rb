class Review < ApplicationRecord
  belongs_to :user
  belongs_to :city
  belongs_to :state
  belongs_to :country

  accepts_nested_attributes_for :city, :state, :country
end
