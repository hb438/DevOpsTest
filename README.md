# DevOpsTest


The php-fpm app is deployed in AWS ECS cluster and is scalable and immutable.

Initial steps is to push the docker images of nginx, php-fpm, postgres and redis onto the AWS ECR repository and the applcation is deployed in ECS cluster using the task definition.

`docker login - pass the cred for aws ecr repo`

`docker build <name of container i.e nginx,php-fpm,postgres,redis> .`

`docker push <name of container i.e nginx,php-fpm,postgres,redis>: latest`

Infra Configuration:

AWS credentials are exported locally to deploy the infra.

The infra consists of ALB, ASG, ECS Cluster, VPC and is deployed using terraform templates.

`terraform init` - To initialise the infra

`terraform plan`

`terraform apply`

Alternate way to deploy:

The app can also be deployed in K8's cluster where individual services will be deployed in pods and exposed using services and Ingress controller.

There can also be CI pipeline that can be implemented using jenkins where a new version of app can be pushed to aws ECR repo and then new pods with replcia sets is deployed/updated.

The security aspects can be tightend by deploying app wihtin the private subnet and passing traffic through the ALB.

Pending bit is assigning the DNS to a relevent container.