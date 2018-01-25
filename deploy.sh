#!/usr/bin/env bash

AWS_DEFAULT_REGION=ap-northeast-1
AWS_ECS_TASKDEF_NAME=stock-task
AWS_ECS_CONTAINER_NAME=stock-container
AWS_ECS_CLUSTER_NAME=stock-cluster
AWS_ECS_SERVICE_NAME=stock-service
AWS_ECR_REP_NAME=stock
AWS_LOGS_GROUP=stock-log-group

# Create Task Definition
make_task_def(){
    task_template='[
        {
            "name": "%s",
            "image": "%s.dkr.ecr.%s.amazonaws.com/%s:%s",
            "essential": true,
            "memory": 200,
            "cpu": 10,
            "portMappings": [
                {
                    "containerPort": 8080,
                    "hostPort": 0
                }
            ],
            "logConfiguration": {
                "logDriver": "awslogs",
                "options": {
                    "awslogs-group": "%s",
                    "awslogs-region": "%s"
                }
            }
        }
    ]'

    task_def=$(printf "$task_template" $AWS_ECS_CONTAINER_NAME $AWS_ACCOUNT_ID $AWS_DEFAULT_REGION $AWS_ECR_REP_NAME $CIRCLE_SHA1 $AWS_LOGS_GROUP $AWS_DEFAULT_REGION)
}

# more bash-friendly output for jq
JQ="jq --raw-output --exit-status"

configure_aws_cli(){
	aws --version
	aws configure set default.region ${AWS_DEFAULT_REGION}
	aws configure set default.output json
}

deploy_cluster() {
    make_task_def
    register_definition
    echo "will update-service Revision: $revision"
    if [[ $(aws ecs update-service --cluster ${AWS_ECS_CLUSTER_NAME} --service ${AWS_ECS_SERVICE_NAME} --task-definition $revision | \
                   $JQ '.service.taskDefinition') != $revision ]]; then
        echo "Error updating service."
        return 1
    fi
    return 0
}


push_ecr_image(){
    eval $(aws ecr get-login --no-include-email --region ${AWS_DEFAULT_REGION})
    docker push $AWS_ACCOUNT_ID.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${AWS_ECR_REP_NAME}:$CIRCLE_SHA1
}

register_definition() {
    if revision=$(aws ecs register-task-definition --container-definitions "$task_def" --family ${AWS_ECS_TASKDEF_NAME} | $JQ '.taskDefinition.taskDefinitionArn'); then
        echo "Revision: $revision"
    else
        echo "Failed to register task definition"
        return 1
    fi
}

configure_aws_cli
push_ecr_image
deploy_cluster
