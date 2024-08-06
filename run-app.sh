#!/bin/bash
minikube start

eval $(minikube docker-env)

docker build -t backend-container:20240805 ./app/backend/

docker build -t frontend-container:20240805 ./app/frontend/

kubectl apply -f k8s/persistent-volume-claim.yml
kubectl apply -f k8s/app-config.yml
kubectl apply -f k8s/mysql-secret.yml
kubectl apply -f k8s/mysql-deployment.yml
kubectl apply -f k8s/mysql-service.yml
kubectl apply -f k8s/redis-deployment.yml
kubectl apply -f k8s/redis-service.yml
kubectl apply -f k8s/backend-deployment.yml
kubectl apply -f k8s/backend-service.yml
kubectl apply -f k8s/frontend-deployment.yml
kubectl apply -f k8s/frontend-service.yml

sleep 120

minikube service frontend --url

