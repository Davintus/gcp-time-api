# GCP Kubernetes API  

## Overview  

This repository contains code to create a simple API that returns the current time, deployed on Google Kubernetes Engine (GKE) using Terraform and CI/CD through GitHub Actions.  

## Project Structure  

- `api/`: Contains the source code for the Flask API and Dockerfile.  
- `terraform/`: Contains the Terraform configuration files for GCP infrastructure setup.  
- `.github/`: Contains the GitHub Actions CI/CD workflows to automate deployment.  
- `README.md`: This documentation file.  

## Variables  

This project uses several variables defined in Terraform to configure resources. Key variables include:  

- `project_id`: Your Google Cloud project ID.  
- `credentials_file`: Path to the Google service account key file for authentication.  
- `api_image_name`: The name of the Docker image used by the API service.  

## Storage of Sensitive Information  

### Use of GitHub Secrets  

For security, sensitive information such as the Google Cloud service account key and project ID should be stored in GitHub Secrets, which can be referenced in the GitHub Actions workflow. Here's how to set them up:  

1. Go to your GitHub repository.  
2. Click on `Settings`.  
3. In the left sidebar, click on `Secrets and variables` > `Actions`.  
4. Click on `New repository secret`.  
5. Add the following secrets:  
   - `GCP_PROJECT_ID`: Your GCP project ID.  
   - `GCP_SERVICE_ACCOUNT_KEY`: The JSON content of your Google service account key.  
   
### Local Development  

For local development, you can create a `.env` file to store environment variables, and utilize a tool like `direnv` or `dotenv` to load them. Additionally, ensure that sensitive information is added to `.gitignore` to prevent it from being committed to your version control.  

## Deployment  

To deploy the application:  

1. Ensure that you have the necessary service account with appropriate roles in Google Cloud.  
2. Clone the repository and navigate to the project directory:  
   ```bash  
   git clone https://github.com/davintus/gcp-time-api.git  
   cd gcp-time-api