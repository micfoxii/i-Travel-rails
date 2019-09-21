class Review < ApplicationRecord
  validates :title, presence: true, length: {minimum: 10, maximum: 30}
  validates :content, presence: true, length: {minimum: 30}
  validates :rating, presence: true
  

  belongs_to :user
  belongs_to :city
 

  scope :most_recent, -> {order("created_at desc")}
  scope :top_rated, -> {order("rating desc")}
  
  
  accepts_nested_attributes_for :city
  
  private

  def date_written
    self.created_at.strftime("%m/%d/%Y at %I:%M%p")
  end

end
