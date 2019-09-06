class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    
    has_many :portfolios
    has_many :stocks, through: :portfolios
end
