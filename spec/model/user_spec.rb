require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:contracts).dependent(:destroy) }
  it { should validate_presence_of(:full_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
end
