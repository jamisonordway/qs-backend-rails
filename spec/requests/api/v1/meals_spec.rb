require 'rails_helper'

describe "Meal API" do
  before :each do
    @meal_1 = Meal.create!(name: 'Breakfast')
    @food_1 = @meal_1.foods.create!(name: 'Pancakes', calories: 500)
    @food_2 = @meal_1.foods.create!(name: 'syrup', calories: 100)

    @meal_2 = Meal.create!(name: 'Second Breakfast')
    @food_3 = @meal_2.foods.create!(name: 'Ice Cream', calories: 500)
  end
  it 'can return a list of meals' do
    # binding.pry
    expected = [
    {
      id: @meal_1.id,
      name: @meal_1.name,
      foods: [@food_1, @food_2]
    },
    {
      id: @meal_2.id,
      name: @meal_2.name,
      foods: [@food_3]
    }
  ]

    get '/api/v1/meals'
    expect(response).to be_successful

    meals = JSON.parse(response.body)

    expect(meals.count).to eq(2)

    expect(response.body).to eq(expected.to_json)

  end
  it 'can return the associated foods for a single meal' do
    expected = {
      id: @meal_1.id,
      name: @meal_1.name,
      foods: [@food_1, @food_2]
    }

    get "/api/v1/meals/#{@meal_1.id}/foods"
    expect(response).to be_successful
    expect(response.body).to eq(expected.to_json)
  end
end