class City < ApplicationRecord
  belongs_to :country
  belongs_to :state
  has_many :reviews
  has_many :users, through: :reviews
end
