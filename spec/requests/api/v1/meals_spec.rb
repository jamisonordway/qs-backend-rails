require 'rails_helper'

describe "API" do
  it 'can return a list of meals' do
    food_1 = Food.create(name: 'bread', calories: 100)
    food_2 = Food.create(name: 'yogurt', calories: 200)
    food_3 = Food.create(name: 'fruit cup', calories: 150)
    foods = [food_1, food_2, food_3]
    Meal.create(name: "Breakfast")
    Meal.create(name: "Second Breakfast")
    Meal.create(name: "Elevensies")
    Meal.create(name: "Lunch")
    Meal.create(name: "Dinner")
    Meal.create(name: "Supper")

    Meal.all.each do |m|
      2.times do
        m.meal_foods.create(food_id: foods.sample.id)
        # binding.pry
      end
    end

    get '/api/v1/meals'
    expect(response).to be_successful

    meals = JSON.parse(response.body)

    expect(meals.count).to eq(6)
    binding.pry
    expect(meals[0]["foods"].count).to eq(2)
    expect(meals[1]["foods"].count).to eq(2)
    expect(meals[2]["foods"].count).to eq(2)
    expect(meals[3]["foods"].count).to eq(2)
    expect(meals[4]["foods"].count).to eq(2)
    expect(meals[5]["foods"].count).to eq(2)
  end
  it 'can return the associated foods for a single meal' do
    food = create(:food)
    meal = Meal.create(name: "Second Breakfast")

    3.times do 
      meal.meal_foods.create(food_id: food.id)
    end

    get "api/v1/meals/#{meal.id}"
    expect(response).to be_successful
    
    result = JSON.parse(response.body)

    expect(result["foods"].count).to eq(3)
  end
end