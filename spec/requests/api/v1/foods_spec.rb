require 'rails_helper'

describe 'Foods API' do
  it 'can return a list of foods' do
    foods = create_list(:food, 10)
    get '/api/v1/foods'
    expect(response).to be_successful
    food_data = JSON.parse(response.body)

    expect(food_data.count).to eq(foods.count)
  end
  it 'can return a single food by id' do
    food = create(:food)
    get "/api/v1/foods/#{food.id}"

    expect(response).to be_successful
    food_result = JSON.parse(response.body)
    
    expect(food.id).to eq(food_result["id"])
  end
end