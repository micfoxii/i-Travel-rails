class Review < ApplicationRecord
  belongs_to :user
  belongs_to :city
 
  # validates_length_of :title, minimum: 5, maximum: 30, allow_blank: false
  # validates_length_of :content, minimum: 30, allow_blank: false
  # validates :rating, :presence true

  scope :most_recent, -> {order("created_at desc")}
  
  
  accepts_nested_attributes_for :city
  

end
