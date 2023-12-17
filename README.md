# LAMBDA-COM-API-GATEWAY

## DESCRIÇÃO
Este é um projeto de exemplo que demonstra como criar uma função Lambda na AWS usando Python e como expor essa função por meio do API Gateway. O projeto consiste em uma função Lambda simples que responde com uma mensagem "Hello from Lambda!".

## Estrutura da ponderada.
lambda_function.py: Contém o código da função Lambda.
deploy.sh: Script de implantação para criar ou atualizar a função Lambda e a API Gateway.

## Pré-requisitos
Certifique-se de ter a AWS CLI instalada e configurada com as credenciais apropriadas.
Substitua <sua-região>, <seu-ID-da-conta>, e <seu ARN do IAM Role> pelos valores corretos no script deploy.sh.

## Como Usar
Clone este repositório:

git clone https://github.com/seu-usuario/seu-repositorio.git
cd seu-repositorio
Execute o script de implantação para criar ou atualizar a função Lambda e a API Gateway:

## EM SEGUIDA, 
./deploy.sh
Após a execução bem-sucedida do script, a função Lambda e a API Gateway estarão prontas para uso.

## Testando a Função Lambda
Você pode testar a função Lambda recém-criada usando a ferramenta de teste integrada no Console da AWS Lambda ou usando ferramentas como o aws cli. Exemplo usando o aws cli:


aws lambda invoke --function-name MyLambdaFunction output.txt
cat output.txt
A saída esperada deve ser a mensagem "Hello from Lambda!".

## Limpeza
Se desejar remover os recursos criados, você pode usar a AWS CLI para excluir a função Lambda e a API Gateway:

aws lambda delete-function --function-name MyLambdaFunction
aws apigateway delete-rest-api --rest-api-id <seu-API-ID>

