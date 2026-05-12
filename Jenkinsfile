pipeline {
    agent any

    triggers {
        githubPush()
    }

    stages {

        stage('Deploy Application') {
            steps {
                sh '''
ssh ubuntu@54.160.175.193 << 'EOF'

cd ~/MyA_FinsyApp

git pull

cd Backend
docker build -t finsy-backend:latest .

cd ../frontend
docker build -t finsy-frontend:latest .

export APP_PUBLIC_IP=54.160.175.193
export DB_PRIVATE_IP=172.31.44.216

cd ~/MyA_FinsyStructure

docker-compose down
docker-compose up -d

docker ps

EOF
'''
            }
        }
    }
}
