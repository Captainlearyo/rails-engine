class Api::V1::Merchants::ItemsController < ApplicationController
  def index
    merchant = Merchant.find_by(id: params[:merchant_id])
    if merchant.nil?
      render json: { errors: 'Merchant not found' }, status: :not_found
    else
      render json: ItemSerializer.new(merchant.items)
    end
  end
  

end