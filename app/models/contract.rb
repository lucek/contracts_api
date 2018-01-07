class Contract < ApplicationRecord
  belongs_to            :user
  validates_presence_of :vendor, :starts_on, :ends_on
end
