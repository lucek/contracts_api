class ContractsController < ApplicationController
  before_action :get_contract, only: [:show, :destroy]

  def index
    @contracts = @current_user.contracts.all
    json_response(@contracts)
  end

  def create
    @contract = @current_user.contracts.create!(contract_params)
    json_response(@contract, :created)
  end

  def show
    json_response(@contract)
  end

  def destroy
    @contract.destroy
  end

  private

  def contract_params
    params.permit(
      :vendor,
      :starts_on,
      :ends_on,
      :price
    )
  end

  def get_contract
    @contract = @current_user.contracts.find(params[:id])
  end
end
