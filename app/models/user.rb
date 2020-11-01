class User < ApplicationRecord
    # has_secure_password
    has_many :books
    validates :email, uniqueness: true
    validates :username, uniqueness: true
    validates :username, :password, presence: true

    # validates :title, presence: true;
end
