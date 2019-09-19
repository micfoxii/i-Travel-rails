class Country < ApplicationRecord
    #validation did not work when referencing id in nested table
    validates :name, presence: true, uniqueness: true
    
    has_many :cities
    has_many :reviews, through: :cities

    scope :sorted, -> {order("countries.name ASC")}
    
end
