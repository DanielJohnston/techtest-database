# Tech Test - Database server

Tech test from Makers Academy - database server accessed through localhost:4000

The brief is as follows:

> Write a program that runs a server that is accessible on http://localhost:4000/. When your server receives a request on http://localhost:4000/set?somekey=somevalue it should store the passed key and value in memory. When it receives a request on http://localhost:4000/get?key=somekey it should return the value stored at somekey. Store the data in memory, not in a database, but bear in mind that you will later need to add a database to this code.

Following completion of this brief, the next stage is:

> Implement persistent storage in a database

## Installation

* Download this repo to a machine with a working Ruby install. I've verified the software works with Windows Subsytem for Linux (i.e. Ubuntu), and it should work on macOS.
* To be confirmed: you will also need a PostgreSQL database server, and will need to set up the database, connection and permissions.
* In Linux / WSL, the bcrypt gem has dependencies that Bundle can't install. Install them using `sudo apt-get install libgmp-dev build-essential` prior to running `bundle`.
* In Linux / WSL again, DataMapper relies on libpq-dev and whichever version of postgresql-server-dev matches to your installed version of PostgreSQL, so you'll also need to run `sudo apt-get install  libpq-dev postgresql-server-dev-9.5` or similar if you don't have them already.
* Install the bundle gem if necessary, then run `bundle` to install the appropriate gems. If you don't want test infrastructure, use `--without test development`.
* To test if PostgreSQL is running, try `psql`. If it can't connect, run `sudo service postgresql restart` to see if that resolves the issue.
* The initial database creation is not in place currently, so you'll need to `CREATE DATABASE keystore_db_test;` within psql to get rspec working, and the same with `development` and `production` respectively. Migrations appear to be working, as does database_cleaner, so the test database is cleaned between tests.
* Run `rspec` in the project root to run the Capybara and RSpec tests which confirm everything is working.
* Run `ruby app.rb` in the project root to start the server on http://localhost:4000/. Running `rackup` starts a generic server with the wrong port, so don't do that.

## Technologies and development notes

A simple web application DSL seems appropriate, so I'm using Sinatra with Ruby:

* For testing, Capybara and RSpec provide feature and unit tests.
* Persistence is via DataMapper and PostgreSQL.
* I've added a homepage and submission form to the spec, in order to make feature testing more straightforward. If this converts into a pure API later, I can remove this again.
* It's worth noting that, to meet the brief, it's necessary to change the model using a GET request, which isn't normally best practice.

Depending on time, CI might be worth looking at as well.

## User stories

- [x] As a user, so that I can access the server for storing data, I want http://localhost:4000/ to show me a page

- [x] As a user, so that I can see how to store data, I want http://localhost:4000/ to show me a form to store data

- [x] As a user, so that I can keep information, I would like to pass it to a server and get confirmation of storage

- [x] As a user, to be able to store in a manner following the specified behaviour, I would like the web submission to use http://localhost:4000/set?somekey=somevalue as the request for storing data

- [x] As a user, so that I can see how to retrieve data, I want http://localhost:4000/ to show me a form to retrieve data

- [x] As a user, to be able to retrieve data in a manner following the specified behaviour, I would like the web submission to use http://localhost:4000/get?key=somekey as the request for retrieving data

- [x] As a user, so that I can retrieve information I've stored, I would like to pass information to a server and then retrieve it later

- [x] As a different user, so that I can retrieve information someone else has stored, I would like to start a new session and retrieve previously stored information using a key that's been shared with me

- [x] As a user, so that I can retrieve information even if the program or computer are reset, I would like to retrieve data that has been stored using a persistent database

- [ ] As a user, so that I understand that I've given a non-existent key, I would like an error message if I enter a key that has no attached value in the database

- [ ] As a security-conscious user, so that my data is kept safe, I would like the software to reject inputs that would allow attackers to carry out unwanted actions

- [ ] As a server admin, so that I can use the application with minimal setup, I would like a database to be created automatically on first running the application, or a rake task for deployment

- [ ] As a web browser user, so that I can navigate more quickly, I would like to see navigation buttons after setting or getting values, provided I'm in the web interface

- [ ] As a user, so that I understand I can't overwrite an existing key-value pair, I would like creating a new record with the same key to show a friendly error message
