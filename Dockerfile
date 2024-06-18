# syntax=docker/dockerfile:1

# FROM node:18-alpine
# #FROM ubuntu:latest
# WORKDIR /app
# COPY . .
# #RUN apt-get update && apt-get install -y sudo
# RUN yarn install --production
# CMD ["node", "src/index.js"]
# EXPOSE 8080

FROM python:3.9-slim-buster
# Set working directory within the container
WORKDIR /app
# Copy your Python source code
COPY . .
# Create a virtual environment (optional)
# RUN python -m venv venv
# WORKDIR /app/venv/bin/activate  # Activate virtual environment (if created)
# Expose port (if your application listens on a specific port)
EXPOSE 8080
# Specify the command to run your script
CMD [ "python", "test.py" ]  