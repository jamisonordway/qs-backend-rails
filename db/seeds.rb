# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
foods = [Food.create(name: 'Pizza', calories: 400),
         Food.create(name: 'Oatmeal', calories: 100),
         Food.create(name: 'Grilled Cheese', calories: 200)]

meals = [Meal.create(name: 'Breakfast'), 
         Meal.create(name: 'Lunch'),
         Meal.create(name: 'Dinner'),
         Meal.create(name: 'Snacks')]

meal_food_1 = MealFood.create(food_id: 1, meal_id: 2)
meal_food_2 = MealFood.create(food_id: 2, meal_id: 1)
meal_food_3 = MealFood.create(food_id: 3, meal_id: 3)