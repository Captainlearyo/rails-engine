require 'rails_helper'

describe "Items API" do
  # it "sends a list of items" do
  #   create_list(:item, 3)

  #   get '/api/v1/items'

  #   expect(response).to be_successful

  #   items = JSON.parse(response.body)
  # end

  # it "can get one item by its id" do
  #   item = create(:item) 
  #   id = item.id
  

  #   get "/api/v1/items/#{id}"
  
  #   item_response = JSON.parse(response.body, symbolize_names: true)
  
  #   expect(response).to be_successful
  
  #   expect(item_response).to have_key(:data)

  #   expect(item_response[:data]).to have_key(:id)
  #   expect(item[:id]).to eq(id)

  #   expect(item_response[:data]).to have_key(:attributes)

  #   expect(item_response[:data][:attributes]).to have_key(:name)
  #   expect(item_response[:data][:attributes][:name]).to be_a(String)
  
  # end

  # it "can create a new item" do
  #   item_params = ({
  #                   title: 'Murder on the Orient Express',
  #                   author: 'Agatha Christie',
  #                   genre: 'mystery',
  #                   summary: 'Filled with suspense.',
  #                   number_sold: 432
  #                 })
  #   headers = {"CONTENT_TYPE" => "application/json"}
  
  #   # We include this header to make sure that these params are passed as JSON rather than as plain text
  #   post "/api/v1/items", headers: headers, params: JSON.generate(item: item_params)
  #   created_item = Item.last
  
  #   expect(response).to be_successful
  #   expect(created_item.name).to eq(item_params[:name])
  # end
end