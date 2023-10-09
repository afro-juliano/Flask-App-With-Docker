# Flask-App-With-Docker
This is a flask app dockerized, for training purposes and you should do as following to deploy
this app.

# 2 - Tier Flask Web Application
It will be on two containers they will run our to-do app.

* Container 1: Contains frontend and backend.
* Container 2: Contains the database that will be running - MySQL, in this case.

Our file structure will be:

Flask-App-With-Docker (Project folder/directory name)
  - app.py (backend)
  - Dockerfile
  - docker-compose.yml
  - pyproject.toml (Contains all the dependencies)
  - templates (directory for the frontend)
  - index.html (Basic frontend, cause I don't really know how to do this things)

# Now you should git clone this repo with:
```
git clone https://github.com/afro-juliano/Flask-App-With-Docker.git
```
