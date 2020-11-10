from dotenv import load_dotenv
import os


load_dotenv()

username = os.environ.get('USERNAME_NET')
password = os.environ.get('PASSWORD')

print(username)
print(password)
