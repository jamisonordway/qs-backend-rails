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
end