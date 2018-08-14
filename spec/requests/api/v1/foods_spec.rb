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
  it 'returns 400 status code if food is not successfully created' do
    no_calories = {food: {name: "bowl of air"}}
    post '/api/v1/foods', params: no_calories

    expect(response.status).to eq(400)
    expect(Food.count).to eq(0)

    no_name = {food: {calories: 300}}
    post '/api/v1/foods', params: no_name
    
    expect(response.status).to eq(400)
    expect(Food.count).to eq(0)
  end
  it 'can update a food' do
    food = create(:food)
    food_params = {food: {name: "Taco Palenque Tacos", calories: 8000}}
    patch "/api/v1/foods/#{food.id}", params: food_params
    
    expect(response).to be_successful

    updated_food = Food.last

    expect(updated_food.id).to eq(food.id)
    expect(updated_food.name).to eq("Taco Palenque Tacos")
    expect(updated_food.calories).to eq(8000)
    expect(updated_food.name).to_not eq(food.name)
  end
  it 'returns a 400 error if food cannot be updated' do
    food = create(:food)
    bad_food_params = {food: {blah: 'ok'}}
    patch "/api/v1/foods/#{food.id - 1}", params: bad_food_params
    # binding.pry
    expect(response.status).to eq(400)

    updated_food = Food.last
    
    expect(updated_food.id).to eq(food.id)
    expect(updated_food.name).to eq(food.name)
  end
  it 'can delete a food and return a 204' do
    food = create(:food)
    expect(Food.count).to eq(1)

    delete "/api/v1/foods/#{food.id}"
    
    expect(response).to eq(204)
    expect(Food.count).to eq(0)
  end
  it 'returns a 404 status code if food cannot be deleted' do
    delete '/api/v1/foods/5'

    expect(response.status).to eq(404)
    expect(Food.count).to eq(0)
  end
end