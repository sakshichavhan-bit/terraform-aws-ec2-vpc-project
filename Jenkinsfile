pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/sakshichavhan-bit/terraform-aws-ec2-vpc-project.git'
            }
        }
        //The terraform init command initializes a working directory containing configuration files and installs plugins for required providers.
        stage ('Initializes') {
            steps {
                sh "terraform init " 
            }
        }The terraform fmt commands formate the all code and validate command do the validate terraform code
        //
         stage ('Formate and Validate') {
            steps {
                sh "terraform fmt"
                sh "terraform validate"
            }
        }
        //The terraform plan command creates an execution plan, which lets you preview the changes that Terraform plans to make to your infrastructure.
        stage ('Plan') {
            steps {
                sh "terraform plan"
            }
        }
           stage ('Apply') {
              steps {
                   sh "terraform apply -auto-approve"
                 
              }
       }
    }
}
