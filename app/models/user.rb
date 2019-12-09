class User < ApplicationRecord
    has_many :reports
    has_secure_password
    validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
end
