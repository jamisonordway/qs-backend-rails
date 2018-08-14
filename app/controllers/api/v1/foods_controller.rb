class Api::V1::FoodsController < ApplicationController

  def index
    render json: Food.all
  end

  def show 
    food = Food.find_by_id(params[:id])
    if food.nil?
      render json: { message: "This food was not found."}, status: 404
    else
      render json: food
    end
  end

  def create
    food = Food.new(food_params)
    if food.save
      render json: food
    else
      render json: { message: "This food could not be saved. Please try again"}, status: 400
    end
  end


  private

  def food_params
    params.require(:food).permit(:name, :calories)
  end
end