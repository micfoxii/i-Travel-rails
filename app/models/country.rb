class Country < ApplicationRecord
    # has_many :states
    has_many :cities
    has_many :reviews, through: :cities

    # default_scope {order(created_at: :desc)}
    # scope :ordered_by_name, -> {order(name: :asc)}

    scope :sorted, -> {order("countries.name ASC")}
end
