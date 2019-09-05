class Country < ApplicationRecord
    has_many :cities
    has_many :states
    has_many :reviews, through: :cities
end
