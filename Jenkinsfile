pipeline {
    agent any

    triggers {
        githubPush()
    }

    stages {
        stage('Deploy Application') {
            steps {
                sh '''
                ssh -o StrictHostKeyChecking=no ubuntu@32.197.127.241 << 'EOF'

                cd ~/MyA_FinsyApp

                git pull origin main

                cd Backend
                docker build -t finsy-backend:latest .

                cd ../frontend
                docker build --build-arg VITE_API_BASE_URL=http://32.197.127.241:5000 -t finsy-frontend:latest .

                cd ~/MyA_FinsyStructure
                git pull origin main

                export APP_PUBLIC_IP=32.197.127.241
                export DB_PRIVATE_IP=172.31.44.216
                export VITE_API_BASE_URL=http://32.197.127.241:5000

                docker-compose down
                docker-compose up -d

                docker ps

EOF
'''
            }
        }
    }
}
