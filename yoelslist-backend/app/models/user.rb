class User < ApplicationRecord

    has_secure_password

    validates :email, :password_digest, uniqueness: { case_sensitive: false }
    has_many :posts, dependent: :destroy

end
