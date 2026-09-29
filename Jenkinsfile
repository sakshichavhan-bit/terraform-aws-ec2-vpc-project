pipeline {
    agent any

    stages {
        // stage('clean Work Space') {
        //     steps {
        //         cleanWs()
        //     }
        // }

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/GauravGote/terraform-project.git'
            }
        }
        //The terraform init command initializes a working directory containing configuration files and installs plugins for required providers.
        stage ('Initializes') {
            steps {
                sh "terraform init " 
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
        stage ('Destroy') {
            steps {
                sh "terraform destroy"
            }
        }
    }
}
