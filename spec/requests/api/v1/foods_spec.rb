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
    food_1 = create(:food)
    get "/api/v1/foods/#{food_1.id}"

    expect(response).to be_successful
    food_1_result = JSON.parse(response.body)
    
    expect(food_1.id).to eq(food_1_result["id"])

    food_2 = create(:food)
    get "/api/v1/foods/#{food_2.id}"
    
    expect(response).to be_successful
    food_2_result = JSON.parse(response.body)

    expect(food_2.id).to eq(food_2_result["id"])
    expect(food_2.id).to_not eq(food_1_result["id"])
  end
  it 'can return a 404 if the food is not found' do
    get '/api/v1/foods/5'
    food_result = JSON.parse(response.body)

    expect(response.status).to eq(404)
  end
  it 'can create a new food with valid params' do
    food_params = {food: {:name => "Mac and Cheese", :calories => 800}}
    post '/api/v1/foods/', params: food_params

    expect(response).to be_successful
    expect(Food.count).to eq(1)
  end
end