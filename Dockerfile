# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the calculator app to the container
COPY calculator.py .

# Install Flask
RUN pip install Flask

# Expose the port the app runs on
EXPOSE 5000

# Command to run the application
CMD ["python", "calculator.py"]