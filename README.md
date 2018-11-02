# README

This application is the back-end calorie tracker API which serves up data for a JavaScript front end, which you can find [here](https://github.com/jamisonordway/qs-frontend-starter).

This API has been deployed to [Heroku](https://qs-rails-backend.herokuapp.com/).


### Food Endpoints

`GET /api/v1/foods`
Returns all foods in the database

Example output:

```
[
  {
    "id":2,
    "name":"Pizza",
    "calories":400
  },
  
  {
    "id":3,
    "name":"Oatmeal",
    "calories":100
  },
 
  {
    "id":4,
    "name":"Grilled Cheese",
    "calories":200
  }
]
```

`GET /api/v1/foods/:id`
Returns a single food by ID

Example output:

```
{
    "id": 2,
    "name": "Pizza",
    "calories": 400
}
```

`POST /api/v1/foods`
Creates a new food

Example output:

```
{
    "id": 5,
    "name": "sandwich",
    "calories": 400
}
```

`DELETE /api/v1/foods/:id`
Deletes a food 

Example output:

`DELETE /api/v1/foods/6`

```
[
    {
        "id": 2,
        "name": "Pizza",
        "calories": 400
    },
    {
        "id": 3,
        "name": "Oatmeal",
        "calories": 100
    },
    {
        "id": 4,
        "name": "Grilled Cheese",
        "calories": 200
    },
    {
        "id": 5,
        "name": "sandwich",
        "calories": 400
    }
]
```

### Meal Endpoints

`GET /api/v1/meals`
Returns all meals (and foods) in the database

Example output:

```
[
    {
        "id": 1,
        "name": "Breakfast",
        "foods": [
            {
                "id": 2,
                "name": "Pizza",
                "calories": 400
            }
        ]
    },
    {
        "id": 2,
        "name": "Lunch",
        "foods": []
    },
    {
        "id": 3,
        "name": "Dinner",
        "foods": [
            {
                "id": 3,
                "name": "Oatmeal",
                "calories": 100
            }
        ]
    },
    {
        "id": 4,
        "name": "Snacks",
        "foods": []
    }
]
```

`GET /api/v1/meals/:meal_id/foods`
Returns all of the foods for a single meal by meal_id

Example output:

```
{
    "id": 1,
    "name": "Breakfast",
    "foods": [
        {
            "id": 2,
            "name": "Pizza",
            "calories": 400
        }
    ]
}
```

`POST /api/v1/meals/:meal_id/foods/:id`
Adds a specified food to a specified meal

Example output:

``POST /api/v1/meals/1/foods/2``

```
{
    "message": "Pizza has been added to Breakfast"
}
```

`DELETE /api/v1/meals/:meal_id/foods/:id `
Removes a specified mood from a specified meal

Example output:

`DELETE /api/v1/meals/1/foods/2 `

```
{
    "message": "Pizza has been removed from Breakfast"
}
```

### Contributing

To interact with the front end locally, clone down the [front end repository](https://github.com/jamisonordway/qs-frontend-starter) and follow instructions for setup.

Next, fork and clone this repo. To setup and run the rails server:

run `bundle install` to install dependencies.

run `rake db:{migrate,seed}` for database migrations.

run `rails s` and use `localhost:3000` as a base url for the above endpoints.
