#!/bin/bash

repository_url=$1

# Build the Docker image locally
docker build -t helloo-world:latest .

# Authenticate Docker to your ECR registry
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $repository_url

# Tag the Docker image
docker tag helloo-world:latest $repository_url:latest

# Push the Docker image to ECR
docker push $repository_url:latest
