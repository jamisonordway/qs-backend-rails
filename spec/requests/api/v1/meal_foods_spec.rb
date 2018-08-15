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
    expect(response.status).to eq(201)
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
  it 'can delete specified food from the specified meal' do
    meal_foods = MealFood.create!(meal: @meal_1, food: @food_1)

    delete "/api/v1/meals/#{@meal_1.id}/foods/#{@food_1.id}"

    expect(response).to be_successful
    meal = Meal.find(@meal_1.id)

    expect(meal.foods).to eq([])
  end
  it 'removes the MealFood record which connects the specified meal and food' do
    meal_food = MealFood.create!(meal: @meal_1, food: @food_1)

    delete "/api/v1/meals/#{@meal_1.id}/foods/#{@food_1.id}"
    expect { MealFood.find(meal_food.id) }.to raise_exception(ActiveRecord::RecordNotFound)
  end
  it 'returns a 404 if the food is not found' do
    meal_food = MealFood.create!(meal: @meal_1, food: @food_1)

    delete "/api/v1/meals/#{@meal_1.id}/foods/#{@food_1.id + 1}"
    expect(response.status).to eq(404)
    expect(response.body).to eq({ error: 'This meal could not be found. Please try again'}.to_json)
  end
  it 'returns a 404 if the meal is not found' do
    meal_food = MealFood.create!(meal: @meal_1, food: @food_1)

    delete "/api/v1/meals/#{@meal_1.id + 1}/foods/#{@food_1.id}"
    expect(response.status).to eq(404)
    expect(response.body).to eq({ error: 'This food could not be found. Please try again'}.to_json)
  end
end