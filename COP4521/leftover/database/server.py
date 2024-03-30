from flask import Flask, request, redirect, session,jsonify
from flask_cors import CORS
import psycopg2
from config import config
from flask_jwt_extended import JWTManager


app = Flask(__name__)
CORS(app, supports_credentials=True, origins=["http://localhost:3000"])
app.secret_key = 'This_is_cool!' # Change this to a real secret key

def get_db_connection():
    params = config()
    return psycopg2.connect(**params)



def get_user_info(username):
    conn = get_db_connection()
    cur = conn.cursor()
    try:
        cur.execute("SELECT username, first_name, last_name, email_address FROM Users WHERE username = %s", (username,))
        user = cur.fetchone()
        if user:
            user_info = {
                'username': user[0],
                'firstName': user[1],
                'lastName': user[2],
                'email': user[3]
            }
            return user_info
        else:
            return None  # User not found
    except Exception as e:
        print(f"Error fetching user info: {e}")
        return None
    finally:
        cur.close()
        conn.close()
@app.route('/foods', methods=['GET'])
def get_foods():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT * FROM Foods")
    foods = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify([{'food_name': food[0], 'food_type': food[1]} for food in foods])
@app.route('/pantry/items', methods=['GET'])
def get_pantry_items():
    if 'username' not in session:
        return jsonify({'error': 'Unauthorized'}), 401

    username = session['username']
    conn = get_db_connection()
    cur = conn.cursor()
    try:
        cur.execute("""
            SELECT pf.food_name 
            FROM Pantry_Food pf 
            JOIN Pantry p ON pf.pantry_id = p.pantry_id 
            WHERE p.ownername = %s
        """, (username,))
        items = [{'food_name': item[0]} for item in cur.fetchall()]
        return jsonify(items)
    except Exception as e:
        print(f"Error fetching pantry items: {e}")
        return jsonify({'error': 'Internal Server Error'}), 500
    finally:
        cur.close()
        conn.close()
@app.route('/recipes', methods=['GET'])
def get_recipes():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT * FROM Recipes")
    recipes = cur.fetchall()
    cur.close()
    conn.close()
    return jsonify(recipes)

@app.route('/pantry/add', methods=['POST'])
def add_to_pantry():
    if 'username' not in session:
        return jsonify({'error': 'Unauthorized'}), 401
    
    username = session['username']
    data = request.json
    food_name = data['food_name']
    
    try:
        conn = get_db_connection()
        cur = conn.cursor()
        
        # Get the pantry_id for the current user
        cur.execute("SELECT pantry_id FROM Pantry WHERE ownername = %s", (username,))
        pantry_id = cur.fetchone()[0]
        
        # Insert into Pantry_Food. Make sure Pantry_Food can reference Pantry and Foods correctly
        cur.execute("INSERT INTO Pantry_Food (pantry_id, food_name) VALUES (%s, %s)", (pantry_id, food_name))
        
        conn.commit()
        return jsonify({'message': f'{food_name} added to pantry'}), 200
    except Exception as e:
        conn.rollback()
        return jsonify({'error': str(e)}), 500
    finally:
        cur.close()
        conn.close()
@app.route('/pantry/remove', methods=['POST'])
def remove_from_pantry():
    if 'username' not in session:
        return jsonify({'error': 'Unauthorized'}), 401

    username = session['username']
    data = request.json
    food_name = data['food_name']

    try:
        conn = get_db_connection()
        cur = conn.cursor()
        
        # Get the pantry_id for the current user
        cur.execute("SELECT pantry_id FROM Pantry WHERE ownername = %s", (username,))
        pantry_id_result = cur.fetchone()
        if pantry_id_result:
            pantry_id = pantry_id_result[0]

            # Remove the food item from the user's pantry
            cur.execute("DELETE FROM Pantry_Food WHERE pantry_id = %s AND food_name = %s", 
                        (pantry_id, food_name))
            conn.commit()
            return jsonify({'message': f'{food_name} removed from pantry'}), 200
        else:
            return jsonify({'error': 'Pantry not found'}), 404
    except Exception as e:
        conn.rollback()
        return jsonify({'error': str(e)}), 500
    finally:
        cur.close()
        conn.close()
def get_user_info(username):
    conn = get_db_connection()
    cur = conn.cursor()
    try:
        # Assuming you have a table named 'Users' with the columns 'username', 'first_name', 'last_name', and 'email_address'
        cur.execute("SELECT username, first_name, last_name, email_address FROM Users WHERE username = %s", (username,))
        user = cur.fetchone()
        if user:
            # Convert the tuple returned from fetchone() into a dictionary
            user_info = {
                'username': user[0],
                'firstName': user[1],
                'lastName': user[2],
                'email': user[3]
            }
            return user_info
        else:
            return None  # User not found
    except Exception as e:
        print(f"Error fetching user info: {e}")
        return None
    finally:
        cur.close()
        conn.close()
@app.route('/recipes/available', methods=['GET'])
def get_available_recipes():
    if 'username' not in session:
        return jsonify({'error': 'Unauthorized'}), 401
    
    username = session['username']
    conn = get_db_connection()
    cur = conn.cursor()
    
    try:
        cur.execute("""
        SELECT r.recipe_id, r.recipe_name
        FROM Recipes r
        WHERE NOT EXISTS (
            SELECT 1
            FROM Recipe_Ingredients ri
            WHERE ri.recipe_id = r.recipe_id
            AND NOT EXISTS (
                SELECT 1
                FROM Pantry_Food pf
                INNER JOIN Pantry p ON pf.pantry_id = p.pantry_id
                WHERE p.ownername = %s AND pf.food_name = ri.ing_name
            )
        )

        """, (username,))
        
        recipes = [{'recipe_id': row[0], 'recipe_name': row[1]} for row in cur.fetchall()]
        return jsonify(recipes)
    except Exception as e:
        print(f"Error fetching available recipes: {e}")
        return jsonify({'error': 'Internal Server Error'}), 500
    finally:
        cur.close()
        conn.close()
@app.route('/select_recipe/<int:recipe_id>', methods=['POST'])
def select_recipe(recipe_id):
    print("Selecting recipe ID:", recipe_id)  # Debug print
    if 'username' in session:
        session['selected_recipe_id'] = recipe_id
        print("Recipe selected successfully, ID stored in session:", session['selected_recipe_id'])  # Confirm success
        return jsonify({'success': True}), 200
    else:
        print("Failed to select recipe, no username in session")  # Identify failure
        return jsonify({'error': 'Unauthorized'}), 401
@app.route('/recipe', methods=['GET'])
def get_recipe_details():
    if 'username' not in session or 'selected_recipe_id' not in session:
        return jsonify({'error': 'No recipe selected or unauthorized'}), 401

    recipe_id = session['selected_recipe_id']
    conn = get_db_connection()
    cur = conn.cursor()

    try:
        # Fetch recipe details along with the author's name
        cur.execute("""
        SELECT r.recipe_name, u.first_name, u.last_name, r.time_added
        FROM Recipes r
        JOIN Users u ON r.author = u.username
        WHERE r.recipe_id = %s
        """, (recipe_id,))
        recipe = cur.fetchone()

        # Fetch ingredients for the selected recipe
        cur.execute("""
        SELECT ing_name, quantity, measurement
        FROM Recipe_Ingredients
        WHERE recipe_id = %s
        """, (recipe_id,))
        ingredients = cur.fetchall()

        # Fetch steps for the selected recipe
        cur.execute("""
        SELECT step_number, step_description
        FROM Steps
        WHERE recipe_id = %s
        ORDER BY step_number
        """, (recipe_id,))
        steps = cur.fetchall()

        recipe_details = {
            'recipe_name': recipe[0],
            'author': f"{recipe[1]} {recipe[2]}",
            'time_added': recipe[3],
            'ingredients': [{'food_name': ing[0], 'quantity': ing[1], 'measurement': ing[2]} for ing in ingredients],
            'steps': [{'step_number': step[0], 'description': step[1]} for step in steps]
        }

        return jsonify(recipe_details)

    except Exception as e:
        print(f"Error fetching recipe details: {e}")
        return jsonify({'error': 'Internal Server Error'}), 500

    finally:
        cur.close()
        conn.close()







# This is our pages for which we need the users to stay on
@app.route('/login', methods=['POST'])
def login_user():
    conn = get_db_connection()
    cur = conn.cursor()
    # Extract form data from the request
    data = request.json
    try:
        # Check if the username exists
        cur.execute("SELECT * FROM Users WHERE username = %s", (data['username'],))
        existing_user = cur.fetchone()
        print(data)
        if existing_user:
            # Check if the password is correct
            if existing_user[4] == data['password']:
                session['username'] = data['username']
                return {'message': 'Login successful', 'username': data['username']}, 200
            else:
                return {'message': 'Incorrect password'}, 401  # Unauthorized
        else:
            return {'message': 'User not found'}, 404  # Not Found
    except Exception as e:
        return {'message': 'Internal Server Error', 'error': str(e)}, 500  # Internal Server Error
    finally:
        cur.close()
        conn.close()
@app.route('/register', methods=['POST'])
def register_user():
    conn = get_db_connection()
    cur = conn.cursor()
    # Extract form data from the request
    data = request.json
    try:
        cur.execute(
            "INSERT INTO Users (username, email_address, first_name, last_name, user_password) VALUES (%s, %s, %s, %s, %s)",
            (data['username'], data['email'], data['firstName'], data['lastName'], data['password']))
        cur.execute(
            "INSERT INTO User_Roles (user_id, role_id) VALUES (%s,%s)", (data['username'],3))
        cur.execute(
            "INSERT INTO Pantry (ownername) VALUES (%s)",
            (data['username'],)
        )
        conn.commit()
        session['username'] = data['username']
        return {'message': 'User created successfully', 'username': data['username']}, 201
    except Exception as e:
        conn.rollback()
        return {'Error': str(e)}, 500
    finally:
        cur.close()
        conn.close()
@app.route('/user', methods=['GET'])
def welcome_user():  # Removed the username parameter
    # First, check if the user is logged in by looking in the session.
    if 'username' not in session:
        return jsonify({'error': 'Unauthorized'}), 401

    username = session['username']  # Correctly fetch the username from the session

    # Fetch the user-specific information.
    user_info = get_user_info(username)
    
    if user_info:
        return jsonify(user_info)
    else:
        return jsonify({'error': 'User not found'}), 404
if __name__ == '__main__':
    app.run(debug=True)