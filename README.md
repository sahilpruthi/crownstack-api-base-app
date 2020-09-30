# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 
		2.6.1
* Rails version 
		5.1.7		
* Database Used
	Postgresql

* Steps to Start and Test the applciations
	- bundle install -> to download gem dependencies
	- rake db:create -> to create database in your system
	- rake db:migrate -> to run migrations and create tables in the enviornment database 
	- rake db:seed	-> to create default required data.
	- rails s -> start server 
	
* API's to Test the application	
  - Sign up -
  localhost:3000/api/v1/registrations :POST
  requried parameters -> users: {email, password} -> by default one user is getting created 
  	email: "sahil@crownstack.com", password: "password" you can use this for login or can create one for youself

  - Login -	
  localhost:3000/api/v1/sessions :POST
  requried parameters -> email, password
  return token of the user which has to be send in every request for this user

  - Products Listing - 
  localhost:3000/api/v1/products :GET
  requred token attributes in Headers to authenticate user 
  If user authonicated then this will return all the products else return an message that please login first

  - Add Product to Card -
  localhost:3000/api/v1/products/add_to_cart :POST
  requred token attributes in Headers to authenticate user  and also product_id in form body
  If user authonicated then this will return all the products else return an message that please login first






 

