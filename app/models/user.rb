class User < ApplicationRecord
  has_secure_password

  has_many              :contracts
  validates_presence_of :full_name, :email, :password_digest
end
