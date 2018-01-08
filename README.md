
# Contracts API code challenge

Simple API application for handling contracts data. Application uses all standard and default rails config.

Test dependencies:

```
  'rspec-rails'
  'factory_bot_rails'
  'shoulda-matchers'
  'faker'
  'database_cleaner'
```

## Setup

* Clone this repository
* Install gems

    ```
    $ bundle install
    ```

* Migrate the database

    ```
    $ rails db:migrate
    ```

* Run the application

    ```
    $ bundle exec rails s
    ```

* Running the test suite

   ```
   rspec spec
   ```

## Usage
**Authentication**

Every request, except signup, needs ```Authorization``` header with individual token returned after user creation.

**Create user**

Creates a new user.

```
POST /signup
```

|Accepted attriburtes| example | required |
|--|--|--|
| full_name | **Han Solo**    | true |
| email     | **foo@bar.com** | true |
| password  | **pa55word**    | true |

Success status code: ```201 created```

Success message example:

```
{
    "message": "Account created successfully",
    "auth_token": "[TOKEN]"
}
```

Error message example:

```
{
    "message": "Validation failed: Email has already been taken"
}
```

**List contracts**

Lists contracts for currently authenticated user.

```
GET /contracts
```

Success status code: ```200 OK```

Success message example:

```
[
	{
	    "id": 1,
	    "vendor": "vendor",
	    "price": 20,
	    "starts_on": "2017-01-08T00:00:00.000Z",
	    "ends_on": "2018-01-07T00:00:00.000Z",
	    "user_id": 6,
	    "created_at": "2018-01-07T23:41:31.687Z",
	    "updated_at": "2018-01-07T23:41:31.687Z"
	}
]
```

**Create contract**

Creates a new contract for the currently authenticated user.

```
POST /contracts
```

|Accepted attriburtes| example | required |
|--|--|--|
| vendor    | **Vodafone**   | true  |
| starts_on | **01.01.2018** | true  |
| ends_on   | **01.01.2019** | true  |
| price     | 20             | false |

Success status code: ```201 created```

Success message example:

```
{
    "id": 6,
    "vendor": "vodafone",
    "price": 20,
    "starts_on": "2017-01-08T00:00:00.000Z",
    "ends_on": "2018-01-07T00:00:00.000Z",
    "user_id": 6,
    "created_at": "2018-01-08T22:48:19.103Z",
    "updated_at": "2018-01-08T22:48:19.103Z"
}
```

Error message example:

```
{
    "message": "Validation failed: Vendor can't be blank"
}
```

**Get contract**

Get information about user's contract.

```
GET /contracts/:id
```

Success status code: ```200 OK```

Success message example:

```
{
    "id": 1,
    "vendor": "vendor",
    "price": 20,
    "starts_on": "2017-01-08T00:00:00.000Z",
    "ends_on": "2018-01-07T00:00:00.000Z",
    "user_id": 6,
    "created_at": "2018-01-07T23:41:31.687Z",
    "updated_at": "2018-01-07T23:41:31.687Z"
}
```

**Delete contract**

Delete information about user's contract.

```
DELETE /contracts/:id
```

Success status code: ```204 No content```
