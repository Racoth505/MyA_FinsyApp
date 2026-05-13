pipeline {
    agent any

    triggers {
        githubPush()
    }

    stages {
        stage('Deploy Application') {
            steps {
                sh '''
                ssh -o StrictHostKeyChecking=no ubuntu@54.152.73.129 << 'EOF'

                cd ~/MyA_FinsyApp

                git pull origin main

                cd Backend
                docker build -t finsy-backend:latest .

                cd ../frontend
                docker build -t finsy-frontend:latest .

                cd ~/MyA_FinsyStructure
                git pull origin main

                export APP_PUBLIC_IP=54.152.73.129
                export DB_PRIVATE_IP=172.31.44.216

                docker-compose down
                docker-compose up -d

                docker ps

EOF
'''
            }
        }
    }
}
