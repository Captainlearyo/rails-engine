class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.all)
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id].to_i))
  end

  def create
    item = Item.new(item_params)
    item.save
    render json: ItemSerializer.new(item), status: :created
  end

  def update
    item = Item.find_by(id: params[:id])
    if item.nil?
      head :not_found
    else
      if item.update(item_params)
        render json: ItemSerializer.new(item)
      else
        head :not_found
      end
    end
  end

  def destroy
    render json: ItemSerializer.new(Item.delete(params[:id]))
  end

  def find_all
    name = params[:name]
    items = Item.where("LOWER(name) LIKE LOWER(?)", "%#{name}%").order(name: :asc)
    if items.any?
      render json: ItemSerializer.new(items)
    else
      render json: {data:[]}
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
  end
end