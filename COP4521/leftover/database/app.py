import os
import psycopg2
from flask import Flask, render_template

app = Flake(__name__)

def get_db_connection():
    connection = None
    params = config()
    print('Connecting to the database...')
    connection = psycopg2.connect(**params)
    return connection

@app.route()