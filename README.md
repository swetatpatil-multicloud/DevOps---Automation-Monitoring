# DevOps---Automation-Monitoring

### First, understand what we're actually building

The assignment wants us to deploy a MERN application.

MERN =

M = MongoDB (Database)
E = Express.js (Backend API)
R = React.js (Frontend UI)
N = Node.js (Runtime)

The project repository is:

TravelMemory GitHub Repository

User Browser
      |
      v
React Frontend
      |
      v
Express Backend
      |
      v
MongoDB Database

AWS will provide servers.

Terraform will create AWS infrastructure automatically.

Ansible will install software automatically.

-----------------------------------------------------------------------------------------------------------------------------------------------------------

### Let's understand what we're going to create.

The assignment requires:

AWS Cloud
│
├── VPC
│
├── Public Subnet
│      │
│      └── EC2 Web Server
│
├── Private Subnet
│      │
│      └── EC2 Database Server
│
├── Internet Gateway
│
└── NAT Gateway

Think of it as:

Internet
    |
    |
Web Server (Public)
    |
    |
Database Server (Private)

Users can reach the web server.

Nobody can directly reach the database server.

This is considered good security practice.

==============================================================================================================

## Phase 2.1 – Create Terraform Project Files

Go to: cd ~/Desktop/HeroVired/MERN-AWS-Assignment/terraform

Create These Files

Inside terraform/

Create:

terraform/
│
├── provider.tf
├── variables.tf
├── vpc.tf
├── ec2.tf
├── security_groups.tf
├── outputs.tf
└── terraform.tfvars

## Through VS code

### File 1: provider.tf

Open provider.tf

Paste:

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

### File 2: variables.tf

Paste:

variable "aws_region" {
  default = "ap-south-1"
}

variable "project_name" {
  default = "travelmemory"
}

### File 3: terraform.tfvars

Paste:

aws_region = "ap-south-1"

### What These Files Mean

provider.tf > Tells Terraform: "Use AWS as cloud provider."
variables.tf > Stores reusable values. > Instead of writing: ap-south-1, 20 times we store it once.
terraform.tfvars > Actual values for variables.

### Verify AWS Region

For this project I am using: Asia Pacific (Mumbai)
ap-south-1
because I am in India and Free Tier resources are available for me to use.

### What We'll Create First

Before launching servers, we need a network.

Think of AWS like a city.

Before building houses (EC2 servers), we need:

City (VPC)
│
├── Public Area
│
└── Private Area

In AWS terms:

VPC
│
├── Public Subnet
│
└── Private Subnet

### Step 7: Open vpc.tf

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "travelmemory-vpc"
  }
}

### What This Means

Don't memorize this. Just understand:

10.0.0.0/16

is the private network range.

Think of it like:

TravelMemory Colony

inside AWS.

Everything we create later will live inside this VPC.

### Step 8: Validate Terraform Code

After saving vpc.tf, run:

## What you’ve successfully achieved:

Terraform created AWS infrastructure (VPC, subnets, EC2, SGs)
EC2 instance is running in a public subnet
SSH access configured correctly with key permissions fixed
Ansible configured the server (Node.js + app setup)
Backend is running on port 5000 and connected to MongoDB Atlas
React frontend is running on port 3000
Security Group correctly opened for required ports
Browser successfully reached http://13.201.60.91:3000

So your MERN stack is now deployed on AWS and accessible publicly.

## Final status

Your deployment is now:

AWS + Terraform + Ansible + MERN = SUCCESSFUL FULL STACK DEPLOYMENT

<img width="1073" height="552" alt="image" src="https://github.com/user-attachments/assets/5fce05c2-b104-498f-8911-80fe66a22cec" />
<img width="1022" height="310" alt="image" src="https://github.com/user-attachments/assets/1c54b7a7-164e-4f33-a3e6-0bf13f4d283a" />







<img width="940" height="205" alt="image" src="https://github.com/user-attachments/assets/8030cfa6-46ac-4d12-90ab-700a000219b9" />

Deploying a MERN Application on AWS (Terraform + Ansible)

<img width="940" height="912" alt="image" src="https://github.com/user-attachments/assets/f6816c55-00d4-433b-8354-f3cfc0b68a4c" />

<img width="940" height="359" alt="image" src="https://github.com/user-attachments/assets/7adde4e0-8b73-4164-9c19-e03cd3e25b23" />

VPC created :

<img width="940" height="486" alt="image" src="https://github.com/user-attachments/assets/3e347c00-6f48-4505-8fb7-a57fa7384c3a" />

<img width="940" height="908" alt="image" src="https://github.com/user-attachments/assets/2417975f-b20a-42e4-9706-d17ec23b9bd2" />

<img width="940" height="833" alt="image" src="https://github.com/user-attachments/assets/b65d6e78-b8b2-4b5e-9031-240474b67c08" />

<img width="940" height="1039" alt="image" src="https://github.com/user-attachments/assets/d3cc6ddb-4666-4704-95b7-31607a33bb7f" />

<img width="940" height="917" alt="image" src="https://github.com/user-attachments/assets/3f867b00-e209-438b-a198-58151b564a51" />

<img width="940" height="945" alt="image" src="https://github.com/user-attachments/assets/a8c94d07-93f1-4218-a735-d09d578c68a7" />
<img width="940" height="870" alt="image" src="https://github.com/user-attachments/assets/1daca031-0603-46bf-9686-5ba29ebf968b" />
<img width="940" height="1022" alt="image" src="https://github.com/user-attachments/assets/616de8a7-d3d3-406c-b238-35f6b7e1c5dd" />
Subnets:

<img width="940" height="272" alt="image" src="https://github.com/user-attachments/assets/e9799c8f-d34c-4a1e-b949-57862ee6c033" />

<img width="940" height="242" alt="image" src="https://github.com/user-attachments/assets/09368c76-b53d-4cd3-b3eb-26b2e87c966c" />

<img width="940" height="398" alt="image" src="https://github.com/user-attachments/assets/2f837b1f-9dbc-4b5c-982a-0326a6be1059" />

NAT gateway:

<img width="940" height="277" alt="image" src="https://github.com/user-attachments/assets/0b275924-187c-421c-8581-79f24f4918af" />

EC2 instances created:

<img width="940" height="137" alt="image" src="https://github.com/user-attachments/assets/720016f8-3a85-4483-a1b3-c8f49db34cc3" />
<img width="897" height="78" alt="image" src="https://github.com/user-attachments/assets/becfda67-279c-4f9e-99ac-09893e27e2a9" />
<img width="940" height="194" alt="image" src="https://github.com/user-attachments/assets/321448c7-3dc5-4679-ba94-6564e2ae0de6" />
<img width="940" height="531" alt="image" src="https://github.com/user-attachments/assets/b103806a-ae5d-4ae6-aeba-8bf724871aec" />
Frontend:

<img width="940" height="513" alt="image" src="https://github.com/user-attachments/assets/374dbd20-e31b-4ab9-8ed5-669009543a30" />
<img width="940" height="399" alt="image" src="https://github.com/user-attachments/assets/44fd13cf-776f-4c29-9f6c-11dd41fcc98f" />

<img width="940" height="459" alt="image" src="https://github.com/user-attachments/assets/bb5d1fb5-43fc-4e3e-b4ce-9930845aa81d" />

<img width="940" height="484" alt="image" src="https://github.com/user-attachments/assets/5a2c2519-bd30-40ff-bf7a-60a6b3d268d0" />
<img width="940" height="782" alt="image" src="https://github.com/user-attachments/assets/91542310-d57e-4a6b-a18e-2f9a64e3f0f2" />
<img width="731" height="194" alt="image" src="https://github.com/user-attachments/assets/e579ba6f-7f88-4f00-9e30-77af27380a26" />


<img width="705" height="178" alt="image" src="https://github.com/user-attachments/assets/3963b594-7878-46cb-adaa-0fa06a3c18e0" />

<img width="940" height="205" alt="image" src="https://github.com/user-attachments/assets/b77b8212-068b-4c1e-a04f-22b31ef54f99" />
<img width="940" height="106" alt="image" src="https://github.com/user-attachments/assets/ad4ca5f9-2a56-4a2e-8c6e-9178937d5b16" />

<img width="940" height="208" alt="image" src="https://github.com/user-attachments/assets/fbd081ed-fbf1-4702-bafa-d8891c13b70f" />

<img width="940" height="162" alt="image" src="https://github.com/user-attachments/assets/f4dc1c97-6b13-4bc0-b0a3-15cc42d883cb" />


<img width="940" height="228" alt="image" src="https://github.com/user-attachments/assets/8ee569b6-6296-4d8e-94b2-072fed82e619" />
<img width="921" height="159" alt="image" src="https://github.com/user-attachments/assets/84d1a462-58a6-464d-9255-392cd3aa5d05" />

<img width="751" height="94" alt="image" src="https://github.com/user-attachments/assets/3b297588-aec6-49cf-ae12-34ec3b1bc091" />

<img width="940" height="222" alt="image" src="https://github.com/user-attachments/assets/3cb0d2ab-cfd3-437d-9322-fea694392c2f" />

<img width="940" height="416" alt="image" src="https://github.com/user-attachments/assets/b74556b1-83e6-4016-9a65-8018db58b682" />


![Uploading image.png…]()

