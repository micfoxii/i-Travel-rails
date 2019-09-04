class User < ApplicationRecord
    has_many :reviews
    has_many :cities, through: :reviews
end
