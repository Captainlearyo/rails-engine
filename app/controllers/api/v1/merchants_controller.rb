 class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.all)
  end

  def show
    begin
      render json: MerchantSerializer.new(Merchant.find(params[:id]))
    rescue ActiveRecord::RecordNotFound => e
      render json: ErrorSerializer.new(ErrorMessage.new(e.message, 404))
      .serialize_json, status: 404
    end
  end

  # def show
  #   merchant = Merchant.find_by(id: params[:id])
    
  #   if merchant
  #     render json: MerchantSerializer.new(merchant)
  #   else
  #     head :not_found
  #   end
  # end

  def find
    name = params[:name]
    merchants = Merchant.where("LOWER(name) LIKE LOWER(?)", "%#{name}%").order(name: :asc)
    if merchants.any?
      render json: MerchantSerializer.new(merchants.first)
    else
      render json: {data:{ errors: 'Merchant not found' }}, status: :not_found
    end
  end

  def create
    render json: MerchantSerializer.new(Merchant.create(merchant_params))
  end
  
  private
  
    def merchant_params
      params.require(:merchant).permit(:name)
    end
end