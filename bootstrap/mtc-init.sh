#!/bin/bash

STACK_NAME="mtc-labs"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_FILE="$SCRIPT_DIR/lab-cfn.yaml"

function check_aws_region() {
    if [ -z "$AWS_DEFAULT_REGION" ]; then
        echo "ERROR: AWS_DEFAULT_REGION is not set."
        echo "Please set your AWS region by running: export AWS_DEFAULT_REGION=<your-region>"
        echo "Example: export AWS_DEFAULT_REGION=us-east-1"
        exit 1
    else
        echo "Using AWS region: $AWS_DEFAULT_REGION"
    fi
}

function confirm_action() {
    read -p "Are you sure you want to proceed? (y/N): " CONFIRM
    if [[ "$CONFIRM" != "y" ]]; then
        echo "Action canceled."
        exit 1
    fi
}

function deploy_stack() {
    check_aws_region
    echo "Deploying stack: $STACK_NAME..."
    aws cloudformation deploy --stack-name "$STACK_NAME" --template-file "$TEMPLATE_FILE"
    echo "Stack deployment initiated. Streaming updates..."
    aws cloudformation describe-stack-events --stack-name "$STACK_NAME" --query "StackEvents[].[Timestamp,ResourceStatus,ResourceType,LogicalResourceId]" --output table --no-paginate
    echo "Deployment complete."
}

function destroy_stack() {
    check_aws_region
    echo "Deleting stack: $STACK_NAME..."
    aws cloudformation delete-stack --stack-name "$STACK_NAME"
    echo "Waiting for stack deletion to complete..."
    aws cloudformation wait stack-delete-complete --stack-name "$STACK_NAME"
    echo "Stack deleted successfully."
}

# Set less to quit if output fits on one screen and not clear screen on exit
export PAGER="less -FX"

case "$1" in
    --deploy)
        echo "You are about to deploy the stack."
        echo "NOTE: Some commands may produce paginated output. If this happens, press 'q' to exit the paginated view."
        confirm_action
        deploy_stack
        ;;
    --destroy)
        echo "You are about to delete the stack."
        echo "NOTE: Some commands may produce paginated output. If this happens, press 'q' to exit the paginated view."
        confirm_action
        destroy_stack
        ;;
    *)
        echo "Usage: $0 --init | --destroy"
        exit 1
        ;;
esac
