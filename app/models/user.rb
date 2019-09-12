class User < ApplicationRecord
    has_many :reviews
    has_many :cities, through: :reviews

    validates :email, uniqueness: true, presence: true
    validates :name, presence: true
    has_secure_password
    
    # Take email to create username handle
    # def get_email
    #     self.email.gsub(/\@.*/, "")
    # end
    
    
end
