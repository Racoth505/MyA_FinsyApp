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
                set -e

                cd ~/MyA_FinsyApp
                git pull origin main

                cd Backend
                docker build --no-cache -t finsy-backend:latest .

                cd ../frontend
                docker build --no-cache -t finsy-frontend:latest .

                cd ~/MyA_FinsyStructure
                git pull origin main

                export APP_PUBLIC_IP=32.197.127.241
                export DB_PRIVATE_IP=172.31.44.216

                docker-compose down
                docker-compose up -d
                docker compose up -d --force-recreate
                docker ps

EOF
'''
            }
        }
    }
}
