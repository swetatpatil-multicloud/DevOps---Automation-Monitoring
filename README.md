# DevOps---Automation-Monitoring

## MERN Stack Deployment on AWS using Terraform + Ansible

### Project Overview

This project demonstrates a complete **end-to-end deployment of a MERN (MongoDB, Express, React, Node.js) application on AWS** using:

- Terraform → Infrastructure provisioning (IaC)
- Ansible → Configuration management & deployment automation
- AWS EC2 → Hosting backend & frontend
- MongoDB Atlas → Database service

---

## Architecture Diagram

            +----------------------+
            |     GitHub Repo     |
            |  (TravelMemory App) |
            +----------+----------+
                       |
                       v
            +----------------------+
            |     Terraform       |
            | Infrastructure as   |
            | Code (AWS VPC, EC2) |
            +----------+----------+
                       |
                       v
    +--------------------------------------+
    |            AWS Cloud (VPC)           |
    |                                      |
    |  +------------------------------+    |
    |  |        EC2 Instance          |    |
    |  | ubuntu@13.201.60.91         |    |
    |  |------------------------------|    |
    |  | Node.js Backend (Express)   |    |
    |  | React Frontend (Build/Serve)|    |
    |  +--------------+---------------+    |
    |                 |                    |
    |                 v                    |
    |     MongoDB Atlas (Cloud DB)        |
    |     travelmemory database           |
    +--------------------------------------+

### Tech Stack

- AWS EC2
- Terraform
- Ansible
- Node.js (Express)
- React.js
- MongoDB Atlas
- Ubuntu 24.04

---

## Project Structure

MERN-AWS-Assignment/
│
├── Terraform/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
│
├── Ansible/
│ ├── ansible.cfg
│ ├── inventory.ini
│ ├── deploy.yml
│ ├── webserver.yml
│ └── mongodb.yml
│
├── TravelMemory App/
│ ├── backend/
│ └── frontend/


---

## Deployment Steps

### Terraform Deployment

terraform init
terraform apply

Creates:

VPC
Subnets (Public & Private)
Internet Gateway
Security Groups
EC2 instances (Web + DB)

### Ansible Configuration

ansible-playbook -i inventory.ini deploy.yml

This:

Installs Node.js
Clones GitHub repository
Configures backend environment
Sets MongoDB Atlas connection
Prepares frontend & backend

### Application Startup

Backend: node index.js
Frontend: npm start

### Application Access

<img width="838" height="152" alt="image" src="https://github.com/user-attachments/assets/31cdd412-7d65-47d1-9cb3-7b6d23208bb6" />

### Environment Variables

PORT=5000
MONGO_URI=mongodb+srv://<username>:<password>@cluster.mongodb.net/travelmemory

### Features

Fully automated infrastructure provisioning
Automated deployment using Ansible
Scalable AWS architecture
Cloud-hosted MongoDB Atlas integration
REST API backend
React frontend UI

### Key Learning Outcomes

Infrastructure as Code (Terraform)
Configuration Management (Ansible)
AWS Networking (VPC, Subnet, SG, IGW)
MERN full-stack deployment
Cloud architecture design

### Status

✔ Terraform: COMPLETE
✔ Ansible: COMPLETE
✔ Backend: RUNNING
✔ Frontend: RUNNING
✔ Database: CONNECTED

### Conclusion

This project demonstrates a complete real-world DevOps pipeline:

Terraform → Infrastructure → Ansible → Deployment → AWS Hosted MERN App

### Please note, I have created one specific folder for screenshots in which I have added all the required screenshots
