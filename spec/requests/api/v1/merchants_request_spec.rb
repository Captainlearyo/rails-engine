require 'rails_helper'

describe "Merchants API" do
  it "sends a list of Merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)
  end

  it "can get one merchant by its id" do
    merchant = create(:merchant) 
    id = merchant.id
  

    get "/api/v1/merchants/#{id}"
  
    merchant_response = JSON.parse(response.body, symbolize_names: true)
  
    expect(response).to be_successful
  
    expect(merchant_response).to have_key(:data)

    expect(merchant_response[:data]).to have_key(:id)
    expect(merchant[:id]).to eq(id)

    expect(merchant_response[:data]).to have_key(:attributes)

    expect(merchant_response[:data][:attributes]).to have_key(:name)
    expect(merchant_response[:data][:attributes][:name]).to be_a(String)
  
  end

  it "can create a new merchant" do
    merchant_params = ({
                    title: 'Murder on the Orient Express',
                    author: 'Agatha Christie',
                    genre: 'mystery',
                    summary: 'Filled with suspense.',
                    number_sold: 432
                  })
    headers = {"CONTENT_TYPE" => "application/json"}
  
    # We include this header to make sure that these params are passed as JSON rather than as plain text
    post "/api/v1/merchants", headers: headers, params: JSON.generate(merchant: merchant_params)
    created_merchant = Merchant.last
  
    expect(response).to be_successful
    expect(created_merchant.name).to eq(merchant_params[:name])
  end
end