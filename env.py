import os
from dotenv import load_dotenv
load_dotenv()
user = os.environ.get('SWITCHUSER')
print(user)

new_user = os.environ.get('CISCOUSER')
print(new_user)
