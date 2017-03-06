# Tech Test - Database server

Tech test from Makers Academy - database server accessed through localhost:4000

The brief is as follows:
```
Write a program that runs a server that is accessible on http://localhost:4000/. When your server receives a request on http://localhost:4000/set?somekey=somevalue it should store the passed key and value in memory. When it receives a request on http://localhost:4000/get?key=somekey it should return the value stored at somekey. Store the data in memory, not in a database, but bear in mind that you will later need to add a database to this code.
```

## Technologies

A simple web application DSL seems appropriate, so I'm using Sinatra with Ruby. For testing, Capybara and RSpec provide feature and unit tests. Depending on time, CI might be worth looking at as well. As there's no persistent storage in the brief at present and session-based storage doesn't match the brief, I'm using variables scoped on the class to avoid global variables.

## User stories

[ ] As a user, so that I can access the server for storing data, I want http://localhost:4000/ to show me a page

[ ] As a user, so that I can see how to store data, I want http://localhost:4000/ to show me a form to store data

[ ] As a user, so that I can keep information, I would like to pass it to a server and get confirmation of storage

[ ] As a user, so that I can see how to retrieve data, I want http://localhost:4000/ to show me a form to retrieve data

[ ] As a user, so that I can retrieve information I've stored, I would like to pass information to a server and then retrieve it later

[ ] As a different user, so that I can retrieve information someone else has stored, I would like to start a new session and retrieve previously stored information using a key that's been shared with me