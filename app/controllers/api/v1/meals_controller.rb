class Api::V1::MealsController < ApplicationController

  def index
    render json: Meal.all
  end

  def show
    meal = Meal.find(params[:meal_id])
    if meal.save 
      render json: meal
    else 
      render json: { error: "This meal could not be found. Please try again" }, status: 404
    end
  end

end