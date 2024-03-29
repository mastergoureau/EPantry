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
            "INSERT INTO User_Roles (user_ID, role_ID) VALUES (%s,%s)", (data['username'],3))
        conn.commit()
        session['username'] = data['username']
        return {'message': 'User created successfully', 'username': data['username']}, 201
    except Exception as e:
        conn.rollback()
        return {'Error': str(e)}, 500
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

@app.route('/pantry/<user>', methods=['GET', 'POST'])
def display_pantry(user):
    return

if __name__ == '__main__':
    app.run(debug=True)