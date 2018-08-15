require 'rails_helper'

RSpec.describe "Meal foods api" do

  before :each do 
    @meal_1 = Meal.create!(name: 'Breakfast')
    @food_1 = Food.create!(name: 'Migas', calories: 400)
  end

  it 'can add the specified food to the specified meal' do
    post "/api/v1/meals/#{@meal_1.id}/foods/#{@food_1.id}"

    expect(response).to be_successful
    meal = Meal.find(@meal_1.id)
    expect(meal.foods).to eq([@food_1])
  end
  it 'can save a new record in the MealFoods table' do
    post "/api/v1/meals/#{@meal_1.id}/foods/#{@food_1.id}"
    expect(MealFood.last.meal_id).to eq(@meal_1.id)
    expect(MealFood.last.food_id).to eq(@food_1.id)
  end
  it 'returns a 404 error if meal is not found' do
    post "/api/v1/meals/#{@meal_1.id + 1}/foods/#{@food_1.id}"

    expect(response.status).to eq(404)
    expect(response.body).to eq({ error: 'This meal could not be found. Please try again' }.to_json)
  end
  it 'returns a 404 error if the food is not found' do
    post "/api/v1/meals/#{@meal_1.id}/foods/#{@food_1.id + 1}"

    expect(response.status).to eq(404)
    expect(response.body).to eq({ error: 'This food could not be found. Please try again' }.to_json)
  end
end