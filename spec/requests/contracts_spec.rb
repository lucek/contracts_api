require 'rails_helper'

RSpec.describe 'Contracts API', type: :request do
  let(:user)        { create(:user) }
  let!(:contracts)  { create_list(:contract, 10, user: user) }
  let(:contract_id) { contracts.first.id }
  let(:headers)     { valid_headers }

  # GET /contracts
  describe 'GET /contracts' do
    before { get '/contracts', params: {}, headers: headers }

    it 'returns contracts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # GET /contracts/:id
  describe 'GET /contracts/:id' do
    before { get "/contracts/#{contract_id}", params: {}, headers: headers }

    context 'when the record exists' do
      it 'returns the contract' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(contract_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:contract_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match("Sorry, record not found.")
      end
    end
  end

  # POST /contracts
  describe 'POST /contracts' do
    let(:valid_attributes) do
      {
        vendor: 'XXX',
        starts_on: Date.today,
        ends_on: Date.today + 10.days,
        price: 10
      }.to_json
    end

    context 'when the request is valid' do
      before { post '/contracts', params: valid_attributes, headers: headers }

      it 'creates a contract' do
        expect(json['vendor']).to eq('XXX')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/contracts', params: {}, headers: headers }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("Validation failed: Vendor can't be blank, Starts on can't be blank, Ends on can't be blank")
      end
    end
  end

  # DELETE /contracts/:id
  describe 'DELETE /contracts/:id' do
    before { delete "/contracts/#{contract_id}", params: {}, headers: headers }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
