#Shoe Store App

###By: Mike Mahoney

The shoe store app will let a user add, update, delete and list shoe stores.
It will also let a user add shoe brands in the application.  Users will
add shoe brands to a store to show where they are sold.  There will be an
option to see all of the brands a store sells on the individual store page.
Shoe brands and Store names will be capitalized.  Validation stops
records from being saved if shoe name is blank and/or store name is
left blank.

##Installation

Install shoe app by cloning this repository:
```
https://github.com/Mahonmr/code_review_shoe_store_app.git
```
##DATABASE Instrunctions

Database was created using mysql

Step 1 start mysql server

```
mysql.server start
```

Step 2 create database

```
rake db:create
then go to mysql prompt and type "show databases;" to verify new db is there
```

Step 3 sign in to mysql and verify database is there

```
mysql -u root -p <enter>
asks for password which is root
then go to mysql prompt and type "show databases;" to verify new db is there
```

Step 4 run migration to build the tables

```
rake db:migrate
rake db:test:prepare
```

Step 5 fire up app and get to work
```
ruby app.rb
```


##License

MIT License, Copyright 2015 Epicodus
