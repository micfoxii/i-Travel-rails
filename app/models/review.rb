class Review < ApplicationRecord
  validates :title, presence: true, length: {minimum: 10, maximum: 30}
  validates :content, presence: true, length: {mimimum: 30, maximum: 300}

  belongs_to :user
  belongs_to :city
 

  scope :most_recent, -> {order("created_at desc")}
  scope :top_rated, -> {where("rating >=4").order("rating desc")}
  
  
  accepts_nested_attributes_for :city
  

end
