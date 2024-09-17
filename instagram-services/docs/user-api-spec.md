# user api spec

## register User
endpoint : Post /v1/api/users
Request Body : 
```json
{
  "username": "rinrin",
  "password": "secret",
  "name": "Rinrin"
}
```

Response body success :
```json
{
 "data": "Successfully created account"
}
```

Response body error :
```json
{
  "error": "failed create account"
}
```

## Login User
endpoint : Post /v1/api/auth/login
Request Body :
```json
{
  "username": "testing1",
  "password": "secret"
}
```

Response body success :
```json
{
 "data": {
   "token": "Token",
   "expiredAt": 24062024
 }
}
```

Response body error :
```json
{
  "error": "username or password wrong"
}
```


## get User
endpoint : Get /v1/api/users/current //saat ini

Request Header :
- x-api-token : 'token' (mandatory)

Response body success :
```json
{
 "data": {
   "username": "username1",
   "name": "Rinrin"
 }
}
```

Response body error :
```json
{

  "error": "unauthorized"
}
```
