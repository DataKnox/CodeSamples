docker build -t datanox/api:latest .
docker-compose down
docker-compose up -d
sleep 10
pytest --verbose ./tests/test_flask.py
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)