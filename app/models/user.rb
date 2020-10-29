class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true
    validates :username, uniqueness: true
    validates :username, :password, presence: true

    # validates :title, presence: true;
end
