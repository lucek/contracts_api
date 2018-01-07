require 'rails_helper'

describe ContractDatesValidator, type: :model do
  let(:contract) { create :contract }

  context 'ends_on is not greater than starts_on' do
    it 'is invalid' do
      today              = Date.today
      contract.starts_on = today + 10.days
      contract.ends_on   = today

      contract.valid?
      expect(contract.errors[:ends_on]).to match_array("Contract's end date must not be greater than start date")
    end
  end
end
