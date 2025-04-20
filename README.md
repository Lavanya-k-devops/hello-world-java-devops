# My First Spring Boot DevOps Project

This is a simple **Hello World** application built using **Spring Boot** and deployed using **DevOps tools**. The project includes continuous integration and continuous deployment (CI/CD) pipelines, monitoring, logging, and infrastructure automation with **Jenkins**, **Docker**, **Kubernetes**, **Prometheus**, **Grafana**, **ELK**, and **Ansible**.

## Table of Contents

- [Project Overview](#project-overview)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Build and Deployment Pipeline](#build-and-deployment-pipeline)
- [Monitoring and Logging](#monitoring-and-logging)
- [Infrastructure Automation](#infrastructure-automation)
- [Conclusion](#conclusion)

## Project Overview

This project demonstrates the implementation of DevOps practices using a **Hello World** Spring Boot application. It covers the full lifecycle from code development to deployment with monitoring and logging integrated.

### Features:
- **CI/CD pipeline** using **Jenkins**.
- **Docker** containerization for the Spring Boot app.
- **Kubernetes** deployment and service management.
- **Prometheus** and **Grafana** for monitoring.
- **ELK stack** (Elasticsearch, Logstash, Kibana) for logging.
- **Infrastructure automation** using **Ansible**.

## Prerequisites

Before running this project, ensure you have the following installed:

- **Docker**: To build and push Docker images.
- **Kubernetes**: For container orchestration.
- **Helm**: To manage Kubernetes applications.
- **Jenkins**: For setting up the CI/CD pipeline.
- **Prometheus and Grafana**: For monitoring the deployment.
- **ELK Stack**: For log management and visualization.
- **Ansible**: For infrastructure automation.
- **GitHub Account**: To trigger Jenkins builds via webhooks.

## Getting Started

### 1. Unzip the sprinboot app into project directory
unzip hello-world
cd hello-world
Once we placed into directory, we have to perform maven install and do the run the maven to expose our project
./mvnw spring-boot:run
![Maven succeed in terminal](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/maven%20built%20successfully.png)
![Maven exposed](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/mavan%20browser%20result.png)


### 2. Build Docker Image
Build the Docker image for the Spring Boot application:
docker build -t lavanya0421/springboot-helloworld:latest .

![Docker built for our project](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/docker%20built.png)
![Docker images](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/docker%20images.png)
![Docker ps](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/docker%20ps.png)
![Docker exposed on local host](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/Docker%20browser%20output.png)

### 3. Deploy to Kubernetes
Deploy the application to a Kubernetes cluster by applying the deployment file:
kubectl apply -f hello-deployment.yaml
![Minikube start](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/minikube%20start.png)
This will create the Kubernetes deployment and expose it as a service.
![DEPLOYMENT, PODS and SVC](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/minukube%20deployment%20pods%20and%20svc.png)

### 4. Jenkins Setup for CI/CD
Set up Jenkins and create a **Freestyle Project** to automate the build and deployment process. We can build the job using shellscript and also we can view the logs and monitor the jobs
- On each push to the repository, Jenkins will:
  1. Clone the repository.
  2. Build the Docker image.
  3. Push the image to **Docker Hub**.
  4. Deploy the image to a Kubernetes cluster using `kubectl`.
![Jenkins dashboard](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/Jenkins%20dashboard.png)
![Jenkins Job](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/Jenkins%20job%20page.png)
![Console Output for our job](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/Jenkins%20build%20job%20console%20output.png)

### 5. Monitoring and Logging
Monitoring tools I have used - Prometheus and Grafana
After the application is deployed, you can monitor it using **Prometheus** and **Grafana**, and view logs using the **ELK stack**.
- Automate the monitoring and alerting process.
- **Prometheus** is used for gathering metrics about the deployed application.
![Prometheus](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/prometheus.png)
![Prometheus UI](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/prometheus%20UI.png)

- **Grafana** visualizes the metrics and provides dashboards.
![Grafana](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/Grafana.png)
![Grafana UI dashboard](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/Grafana%20Dashboard.png)
![Grafana view](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/Grafana%20UI.png)

### Ingress setup
Ingress enabled to our project and it is created with local id
![Ingress Setup](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/ingress.png)

### ELK Stack:
- **Elasticsearch** stores logs generated by the Spring Boot application.
- **Logstash** processes and ships logs to Elasticsearch.
- **Kibana** provides a UI to search and view the logs.
![ELK setup](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/elk%20status.png)

## Infrastructure Automation
- Use **Ansible** to automate the setup of your infrastructure, including Kubernetes cluster setup and the deployment of the application.
![Ansible Output](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/ansible%20playbook.png)

### Jenkins on Github Pipeline:
- **Jenkins** is configured to listen for changes in the GitHub repository.
- On each push to the repository, Jenkins will:
  1. Clone the repository.
  2. Build the Docker image.
  3. Push the image to **Docker Hub**.
  4. Deploy the image to a Kubernetes cluster using `kubectl`.
 
You can check the **Jenkins Job Console Output** for detailed build steps.

![Github Webhook settings page](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/Github%20webhook%20settings.png)
![Github webhook response-200](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/github%20webhook%20status%20200.png)
![Jenkins triggers job](https://github.com/Lavanya-k-devops/hello-world-java-devops/blob/master/screenshots/Github%20webhook%20triggers%20jenkins%20job%20automatically.png)

## Conclusion

This project showcases a full-fledged DevOps setup, including:
- Code integration and deployment with Jenkins.
- Docker for containerization.
- Kubernetes for orchestration.
- Monitoring with Prometheus & Grafana.
- Logging with the ELK stack.
- Automation with Ansible.

## Future Improvements

- Add HTTPS using **Ingress** and **Let's Encrypt**.
- Enhance security by adding **Trivy** for container scanning in the CI/CD pipeline.

**Thank you for using this project!**  
Feel free to contribute or suggest improvements.  
Happy Coding! 🎉


