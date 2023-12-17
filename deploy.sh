#!/bin/bash

# Defina o nome da função Lambda e o nome da API Gateway
LAMBDA_FUNCTION_NAME="MyLambdaFunction"
API_NAME="MyApiGateway"

# Crie o pacote zip da função Lambda
zip -r lambda_function.zip lambda_function.py

# Crie ou atualize a função Lambda
aws lambda create-function \
    --function-name $LAMBDA_FUNCTION_NAME \
    --runtime python3.8 \
    --role <seu ARN do IAM Role> \
    --handler lambda_function.lambda_handler \
    --zip-file fileb://lambda_function.zip

# Crie ou atualize a API Gateway
API_ID=$(aws apigateway create-rest-api --name $API_NAME --query 'id' --output text)
aws apigateway create-resource --rest-api-id $API_ID --path-part {proxy+} --query 'id' --output text

# Obtenha o ID do recurso criado
RESOURCE_ID=$(aws apigateway get-resources --rest-api-id $API_ID --query 'items[0].id' --output text)

# Crie o método POST no recurso
aws apigateway put-method \
    --rest-api-id $API_ID \
    --resource-id $RESOURCE_ID \
    --http-method POST \
    --authorization-type NONE \
    --no-api-key-required

# Crie a integração entre a função Lambda e a API Gateway
aws apigateway put-integration \
    --rest-api-id $API_ID \
    --resource-id $RESOURCE_ID \
    --http-method POST \
    --type AWS_PROXY \
    --integration-http-method POST \
    --uri arn:aws:apigateway:<sua-região>:lambda:path/2015-03-31/functions/arn:aws:lambda:<sua-região>:<seu-ID-da-conta>:function:$LAMBDA_FUNCTION_NAME/invocations

# Deploy da API Gateway
aws apigateway create-deployment \
    --rest-api-id $API_ID \
    --stage-name prod
