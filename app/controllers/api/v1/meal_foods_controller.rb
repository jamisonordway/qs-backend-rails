class Api::V1::MealFoodsController < ApplicationController

  def create
    begin
      meal = Meal.find(params[:meal_id])
      food = Food.find(params[:id])
      MealFood.create!(meal: meal, food: food)
      render json: { message: "#{food.name} has been added to #{meal.name}"}, status: 201
    rescue => error
      if error.to_s.include?('Meal')
        render json: { error: 'This meal could not be found. Please try again'}, status: 404
      else
        render json: { error: 'This food could not be found. Please try again'}, status: 404
      end
    end
  end

end