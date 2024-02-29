import psycopg2
#from config file we want to import config function
from config import config

def connect():
    connection = None
    try:
        params = config()
        print('Connecting to the database...')
        connection = psycopg2.connect(**params)
        #double asterics work with dictionaries, we are saying we want to extract 
            #everything inside of the parames, inside those two parenthesees and
            #to conenct using the psychopg2 module

        #create a cursor
        cur = connection.cursor()
        print('PostgreSQL databse version: ')
        cur.execute('SELECT version()')
        db_version = cur.fetchone()
        print(db_version)

        with open('create.sql', 'r') as databasefile:
            commands = databasefile.read().split(';')

            for command in commands:
                try:
                    if not command.strip() or command.strip().startswith('--'):
                        continue
                    cur.execute(command)
                except Exeception as E:
                    print("Error executing command: %s", command)
                    print("Error message: ", E)

            connection.commit()
            cur.close()
            connection.close()
        # #Users
        # cur.execute('CREATE TABLE Users(\
        #             username SERIAL PRIMARY KEY,\
        #             first_name VARCHAR(255) NOT NULL,\
        #             last_name VARCHAR(255) NOT NULL,\
        #             email_address VARCHAR(255) NOT NULL,\
        #             user_password VARCHAR(255) NOT NULL);')
        # print("Created Users Table...")

        # #Food
        # cur.execute("CREATE TABLE Foods(\
        #             food_name VARCHAR(255) NOT NULL,\
        #             food_type VARCHAR(255) NOT NULL);")
        # print("Created Foods Table...")

        # #Ingreidients
        # cur.execute("CREATE TABLE Ingredients(\
        #             ing_name VARCHAR(255) NOT NULL,\
        #             quantity FLOAT(40,2) NOT NULL,\
        #             measurement varchar(8) NULL\
        #             FOREIGN KEY (food_name) REFERENCES Food(food_name));")
        # print("Created Ingredients Table...")

        # #Recipes
        # cur.execute("CREATE TABLE Recipes(\
        #             recipe_id SERIAL PRIMARY KEY,\
        #             recipe_name VARCHAR(255),\
        #             time_added DATE NOT NULL);")
        # print("Created Recipes Table...")

        # cur.close()
    except(Exception, psycopg2.DatabaseError) as dberror:
        print(dberror)
    finally:
        if connection is not None:
            connection.close()
            print('Database connection terminated')

if __name__ == "__main__":
    connect()
