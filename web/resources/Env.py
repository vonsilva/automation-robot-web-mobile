import psycopg2
import os
from dotenv import load_dotenv

load_dotenv()

BASE_URL= os.getenv('BASE_URL')