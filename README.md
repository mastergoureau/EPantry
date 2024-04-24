
# Leftover
Leftover is way to digitally keep track of what ingredients you have availabe while simoultaneously viewing different receipes that tailors to what the user has available. This not only offers a conveinent way to keep track of what a user may have available when not in the house, but also helps prevent wasting food, and meal prepping, as well as what to purchase when grocery shopping.  

## Authors

- Dylan Goureau - [@mastergoureau](https://github.com/mastergoureau)
  - Front end and Backend functionality (User, Recipe View)
- Brady Henderson - [@bradyhendu](https://github.com/bradyhendu)
  - Front end and and Backend Functionality (Login, Register, and Homepage) 
- Madeline Bramson - [@madelinebramson](https://github.com/madelinebramson)
  - Front end and Backend functionality (Chef)
- Ryan Ly - [@kaosu01](https://github.com/kaosu01)
  - Front End and Backend functionality (Admin and cleanup)
- Nolan O'Rourke - [@nolanorourke](https://github.com/nolanorourke)
  - Database creation and initialization (PostgreSQL)

## Features

- Fullscreen mode
- Cross platform
- Functional database
- Desktop view
- Login / Logout functionality
- User input storage
- Role Based Access


## Run Locally

Clone the project

```bash
  git clone https://github.com/mastergoureau/EPantry.git
```

Go to the project directory

```bash
  cd EPantry
```
```bash
  cd COP4521
```
```bash
  cd Leftover
```

Install dependencies

```bash
  npm install i
```
Install PostgreSQL Database with these [Instructions](https://www.w3schools.com/postgresql/postgresql_install.php)
and create an account
> [!Important]
> Ensure that you remember your password, you will have to use these values to access your database and in the next step


## Usage
First, navigate to the database folder (```Epantry/COP4521/leftover/database/database.ini```), and change the database.ini value in password to the password you use for PostgreSQL


Next, run the development server:
```bash
python3 server.py
```

Next populate the database
```bash
python3 setup.py
```

Finally, run the server
```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

## Interface
### Supported Colors
The primary color is `#396643`, the secondary is `#919e8e`, and accent is `#C0C0C0` 
The text color is `#0f1310`
The background color is `#ffffff`

## Layout
### Home Page
* Where the initial drop in point is for the program, where the user will start when they click on the link

### Register Page
* Where the user will register their account, takes in first and last name, username, email, and password
* They can also say here if they are registering as a chef or as a regular user
* Provides link to login page if users doesnt have account

### Login Page
* Returning users can log in to their accounts here
* Provides link to register page if user doesnt have account

### User Home Page / Dashboard
* Displays all food availabe in the database, allows a user to add it to their pantry, then generates avilable receipes based on what is available in the recipes table.

### Chef Page
* Has a dashboard as well, also has the ability to add recipes to the site
* On the recipe adding page, a chef is able to add ingredients and steps to their recipes
* Once added, the recipe is instantly available for all users

### Reipe Page
* The recipe page lists all ingredients at the top, and all steps below it
* It also displays the name of the author of the recipe

### Admin Page
* Admin page has the user dashboard as well, they are also able to revoke chef proviliges, and add food items to the database

## Included Libraries
* flask_cors
* flask
  * Flask
  *  redirect
  *  jsonify
  *  request
  *  session
* config
* flask_jwt_extended
* hashlib
* datetime
* psycopg2
* configparser
* react
  * react-select
* next

## Other Resources
* Tailwind
* PostreSQL
* NextJS
* React





