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
https://github.com/Mahonmr/
```
##DATABASE Instrunctions

Database was created using mysql

Step 1 start mysql server

```
mysql.server start
```

```
CREATE DATABASE shoe_tracker;
```

Step 2 sign in to mysql

```
mysql -u root -p <enter>
asks for password which is root
```

Step 3 create database and verify it is there

```
CREATE database shoe_tracker;
show databases;
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
