# README

This application is the back-end calorie tracker API which serves up data for a JavaScript front-end, which you can find here.

This API has been deployed to Heroku.


### Food Endpoints

`GET /api/v1/foods`
Returns all foods in the database

`GET /api/v1/foods/:id`
Returns a single food by ID

`POST /api/v1/foods`
Creates a new food

`DELETE /api/v1/foods/:id`
Deletes a food 

`PATCH /api/v1/foods/:id`
Updates a food

### Meal Endpoints

`GET /api/v1/meals`
Returns all meals (and foods) in the database

`GET /api/v1/meals/:meal_id/foods`
Returns all of the foods for a single meal by meal_id

`POST /api/v1/meals/:meal_id/foods/:id`
Adds a specified food to a specified meal

`DELETE /api/v1/meals/:meal_id/foods/:id `
Removes a specified mood from a specified meal
