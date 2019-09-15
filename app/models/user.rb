class User < ApplicationRecord
    has_many :reviews
    has_many :cities, through: :reviews

    validates :email, uniqueness: true, presence: true
    validates :name, presence: true
    has_secure_password
    

    def self.find_or_create_by_facebook_omniauth(auth)
        user = User.find_by(email: auth['info']['email'])

        if user.nil?
            user = User.create(email: auth['info']['email'], name: auth['info']['name'], password: SecureRandom.hex, uid: auth['iuid'])
        elsif user.uid.nil?
            user.update(uid: auth['uid'])
            user
        end
        user
    end
    # Take email to create username handle
    # def get_email
    #     self.email.gsub(/\@.*/, "")
    # end
    
    
end
