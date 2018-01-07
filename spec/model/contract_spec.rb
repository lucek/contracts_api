require 'rails_helper'

RSpec.describe Contract, type: :model do
  it { should belong_to(:user) }
  it { should validate_presence_of(:vendor) }
  it { should validate_presence_of(:starts_on) }
  it { should validate_presence_of(:ends_on) }
end
