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
      render status: 400, json: {}
    end
  end

  def update
    food = Food.find_by_id(params[:id])
    if food.nil?
      render json: { message: "This food could not be found. Please try again"}, status: 400
    else 
      food.update(food_params)
      if !food.save
        render json: { message: "This food could not be saved. Please try again"}, status: 400
      end
    end
  end

  def destroy
    food = Food.find_by_id(params[:id])
    if food.nil?
      render json: { message: "This food could not be found. Please try again"}, status: 404
    else
      food.destroy and return 204
    end
  end

  private

  def food_params
    params.permit(:name, :calories)
  end

 # working on a refactor, but currently, this breaks the 400 response on line 32

  # def messages
  #   {not_found: "This food could not be found.", not_saved: "This food could not be saved."}
  # end

  # def codes
  #   {not_found: 404, not_saved: 400}
  # end
end