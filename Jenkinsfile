pipeline {
    agent any

    triggers {
        githubPush()
    }

    stages {

        stage('Deploy Application') {
            steps {
                sh '''
ssh ubuntu@98.83.23.187

cd ~/MyA_FinsyApp

git pull

cd Backend
docker build -t finsy-backend:latest .

cd ../frontend
docker build -t finsy-frontend:latest .

export APP_PUBLIC_IP=98.83.23.187
export DB_PRIVATE_IP=localhost

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
