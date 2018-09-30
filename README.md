# Overview
Project (learning purpose) to implement workflow object. 

# Specs
```
User Model
  is valid with username, password and password_confirmation
  is invalid without username
  is invalid without password
  is invalid with password_confirmation does't match

Authentication API
  User login
    when credentials valid
      return's token
    when credentials invalid
      return's error response

Dashboard API
  User visit dashboard page
    when auth header valid
      return success response
    when auth header empty
      return error response
    when auth header not include 'Bearer' text
      return error response
    when auth header have invalid format
      return error response
    when auth header have token that can't decoded
      return error response
```

## Usage 

### Workflow object
```ruby
# Login Features
@workflow = LoginWorkflow.new(username: "pquest", password: "secret")

@workflow.allow? # => true / false

@workflow.token # => "t0k4n" / nil 

@workflow.user # => <user> / nil

@workflow.error # => "Sorry, you're credentials is invalid" / nil

#  Dashboard Features
@workflow = DashboardWorkflow.new(auth_header: "Bearer your_token_here")

@workflow.allow? # => true / false

@workflow.user # => <user> / nil

@workflow.error # => "An error messages" / nil 
``` 

### Service Object
```ruby
# Token Service 
TokenService.encode(user_id: 1) # => "eyJhbGciOiJub25lIn0.eyJ1c2VyX2lkIjoxfQ." 

TokenService.decode("eyJhbGciOiJub25lIn0.eyJ1c2VyX2lkIjoxfQ.") # => payload / nil

TokenService.user("eyJhbGciOiJub25lIn0.eyJ1c2VyX2lkIjoxfQ.") # =>  <user> / nil

# AuthHederService 
auth_header = AuthHeaderService.new(auth_header: "Bearer eyJhbGciOiJub25lIn0.eyJ1c2VyX2lkIjoxfQ.")

auth_header.valid? # => true / false

auth_header.token # => eyJhbGciOiJub25lIn0.eyJ1c2VyX2lkIjoxfQ. 
```

## License
Copyright 2018 Philip Lambok
