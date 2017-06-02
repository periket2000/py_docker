PROJECT_DIR=/usr/local/pyenv
GIT_REPO=https://github.com/periket2000/rest_api_demo.git
# SRC_DIR is relative to the git clone dir (rest_api_demo -> rest_api_demo) in this case
# PROJECT_DIR/rest_api_demo +
#                           |
#                           +-> requirements.txt
#                           +-> README.md
#                           +-> rest_api_demo +
#                                             |
#                                             +-> app.py
#                                             +-> ...
SRC_DIR=rest_api_demo
APP_FILE=app.py

# YOU CAN REMOVE BELOW VALUES
# APPLICATION ENVIRONMENT (SAMPLE ENVIRONMENT VARS SUPPOSED TO BE USED BY GIT_REPO APPLICATION)
DB_USER=pygauth
DB_PASS=password
DB_HOST=192.168.250.100
DB_PORT=3306
DB_NAME=py-gauth
REDIS_HOST=192.168.250.100
REDIS_PORT=6379
REDIS_TOKEN_TIME=3600
