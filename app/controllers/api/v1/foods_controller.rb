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

end