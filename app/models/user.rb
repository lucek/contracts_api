class User < ApplicationRecord
  has_secure_password

  has_many                :contracts, dependent: :destroy
  validates_presence_of   :full_name, :email, :password_digest
  validates_uniqueness_of :email
end
