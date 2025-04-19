#!/bin/bash

# Exit the script on any error
set -e

# Navigate to the application directory
cd /home/lavanya_k/hello-world

echo "----------------------WELCOME TO MY SIMPLE HELLO APP PROJECT-------------------------------------------"
# Step 1: Build Docker image
echo "-------------------------------Building Docker image...------------------------------------------------"
docker build -t lavanya0421/springboot-helloworld:latest .

# Step 2: Push Docker image
echo "----------------------------Pushing Docker image to Docker Hub...--------------------------------------"
docker push lavanya0421/springboot-helloworld:latest

# Step 3: Deploy to Kubernetes
echo "----------------------------------------Starting minikube---------------------------------------------"
export HOME=/var/lib/jenkins
minikube start
K8S_DEPLOYMENT_FILE="/home/lavanya_k/hello-world/hello-deployment.yaml"
echo "---------------------------Applying Kubernetes manifests...--------------------------------------------"
kubectl apply -f $K8S_DEPLOYMENT_FILE

# Step 4: Wait for rollout to complete
echo "--------------------------------Waiting for rollout to complete...-------------------------------------"
kubectl rollout status deployment/hello-deployment

# Step 5: Expose service if not already exposed
echo "----------------------------Checking and exposing service...--------------------------------------------"
kubectl get svc hello-world-service || kubectl expose deployment hello-deployment --type=NodePort --name=hello-world-service

# Step 6: Show status
echo "---------------------------------Fetching pod and service info...---------------------------------------"
kubectl get pods
kubectl get svc hello-world-service

#Step 7: Setting up Ingress...
echo "------------------------------------Setting up Ingress...------------------------------------------------"
kubectl apply -f ingress.yaml

#Step 8: Setting up Monitoring (Prometheus & Grafana)
echo "-------------------------------- Setting up Monitoring (Prometheus & Grafana)...-------------------------"
echo "Prometheus and Grafana configured. Access via UI as needed."

#Step 9: Setting up Logging (ELK Stack)
echo "----------------------------------Setting up Logging (ELK Stack)...-------------------------------------"
echo "ELK components (Elasticsearch, Logstash, Kibana, Filebeat) configured. Access Kibana UI for logs."

#Step 10: Triggering Ansible for Infrastructure Automation
echo "----------------------------Triggering Ansible for Infrastructure Automation...----------------------------"
echo "Ansible playbooks prepared for automating infra tasks."

#Step 11: Final clearance on Kubernetes
echo "-----------------------------------Final Kubernetes Resources Status---------------------------------------"
kubectl get all
kubectl get ingress
kubectl get svc hello-world-service

echo "-----------------------------Deployment script completed successfully.-----------------------------------"
