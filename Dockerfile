# Use the official Python 3.7 image from the Docker Hub
FROM python:3.7

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Make port 81 available to the world outside this container
EXPOSE 81

# Run app.py when the container launches
CMD python ./app