class Api::V1::Items::MerchantsController < ApplicationController
  def show
    item = Item.find_by(id: params[:item_id])
    
    if item.nil?
      head :not_found
    else
      merchant = Merchant.find_by(id: item.merchant_id)
      if merchant
        render json: MerchantSerializer.new(merchant)
      else
        head :not_found
      end
    end
  end
end