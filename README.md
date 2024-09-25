# Docker Basics and Example: Flask Web App

Docker is like a box that contains everything an app needs (application and its dependecies in to a standardized unit called "Container") to run properly, making it work the same way on any computer (irrespective of the OS).
Docker is mainly used to automate the management of the application and for deployment.

## Key Concepts of Docker
### Container
A lightweight, standalone, and executable package that includes everything needed to run an application. Containers are isolated from each other and the host system, meaning they run independently without interference.

### Docker Image
A Docker image is the blueprint for creating containers. It contains the application and all its dependencies. Images are composed of layers, making them efficient by reusing components.

### Layers
Layers in Docker images are like ingredients in a burger (bun, patty, cheese). Docker reuses parts of an image and only adds new layers when necessary, speeding up the process and saving resources.

### Dockerfile
A Dockerfile is a text file containing a set of instructions for building a Docker image. It defines the base image to use, the files to copy, and the commands to run inside the container.

### Docker Hub
A public registry similar to GitHub, but instead of repositories containing code, Docker Hub stores Docker images. You can search, pull, and push images to and from Docker Hub.

## Common Docker Commands

Here are some essential Docker commands you'll use frequently:

### Pull an image from Docker Hub:
```
docker pull <image_name>
# for eg:
docker pull ubuntu
```
### Run a container from an image:
'''
docker run <image_name>
# for eg:
docker run ubuntu
'''

### List all Docker images stored locally:
'''
docker image ls
'''
### List all running Docker containers:
'''
docker ps
'''

### List all containers (including stopped containers):
'''
docker ps -a
'''

### Build a Docker image from a Dockerfile:
'''
docker build -t <directory_name>/<image_name>:<version>

# for eg:
docker build -t myapp/myimage:0.0.1 .
'''

### Run a Docker image as a container:

'''
docker run <image_name>:<version>
# for eg:
docker run myapp/myimage:0.0.1
'''

### Stop a running container:
'''
docker stop <container_id or container_name>
'''

### Delete a stopped container:
'''
docker rm <container_id or container_name>
'''

## Now, let's create a simple Flask web app and Dockerize it!

step 1: Create a new python file (index.py) for your Flask app:
write the following code in the index.py file:
'''from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=81)
'''

Step 2: Create a new file requirements.txt and add the following dependencies:
'''
flask
'''
Note - We only need flask for this simple app.

Step 3: Create a new file Dockerfile and add the following instructions:
'''# Use the official Python 3.7 image from Docker Hub
FROM python:3.7

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Expose port 81 to the world outside the container
EXPOSE 81

# Run index.py when the container launches
CMD ["python", "./index.py"]
'''

Step 4: Build the Docker image using the Dockerfile:
'''
docker build -t <your_dockerhub_username>/my-flask-app:0.0.1 .

eg:
docker build -t mohitchoithwani/my-flask-app:0.0.1 .
'''
This creates a Docker image named my-flask-app with version 0.0.1.

Step 5: Run the Docker image as a container:
'''
docker container run -d -p 81:81 <your_dockerhub_username>/my-flask-app:0.0.1
'''
This binds the container's port 81 to the local machine's port 81. Once the container is running, you should be able to access the app via http://localhost:81.

