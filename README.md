# EECS341 Final Project

Kennan LeJeune, David Blincoe, Ellis Saupe, and Sam Jenkins

## Overview:

RecipIO is a recipe sharing and discussion forum written using Angular 7 (frontend), Node.js, and Express.js (backend). Users are able to create accounts, upload recipes, write comments, and vote on recipes and comments. Users can additionally search for recipes based on recipe ingredients, tags, name, description, or author. The website displays recipes sorted by user vote ratings. All API endpoints are supported on the server side with stored procedures within the required MySQL database.

## Project Requirements

### CRUD requirements

- Create: rows are created whenever a new user account is created or when a new recipe is uploaded
- Read: Whenever the page displays a recipe or comment, it will be reading that information from the database
- Update: Users can edit both comments and recipes, which will update the corresponding row in the database
- Delete: Users can delete comments or recipes, which delete the corresponding row in the database, as well as the voting information tied to those entries 

### Aggregate Query requirements:

- Used to count the number of likes a recipe or comment has, as well as displaying cumulative ratings. 
- Search function uses aggregate query in order to determine which recipes match user input

### Beyond Requirements:

- Prevented SQL injection by escaping input parameters
- Used stored procedures to standardize and streamline queries
- Used views to cache expensive procedures from aggregate queries discussed above
- Material Design UI for better user experience

## Team Member Contributions:

- David and Kennan - Developed Material Design UI and an API server using Node.js and Express.js to host both the back end API and front end components from the same port.
- Ellis and Sam - created database structure and configuration.  Wrote stored procedures to be called by the API


## Lessons & Challenges

- Passing strings to stored procedures requires manually adding quotation wrapping in order to correctly execute the query, or else the stored procedure fails silently. Debugging this was...unpleasant. 
- We found that good API design is crucial. Without careful thought, certain endpoints can overlap with each other, making for a confusing experience when debugging.
- We learned how to create and use stored procedures, and quickly realized how they are useful when constructing an API. By providing an abstracted layer, we were able to completely change the function of our application by modifying a stored procedure without ever touching the client side codebase.
- Learned how to create a temporary table and how to parse a delimited string in SQL for more complex queries

## Deployment

### Prerequisites

This project requires nodejs, npm, and the Angular command line tools. These can be installed on linux systems with 

```bash
sudo apt install npm
sudo npm install @angular/cli -g
```

From the project directory, run the following to install the dependencies and build the project. 

```bash
npm install
ng build
```

The build artifacts are stored in /dist.  To deploy the application, run 

```bash
node server.js
```

from the root project directory. The application can be accessed at `localhost:33201`.

