#!/bin/bash

# Define o nome do grupo de segurança
security_group_name="executiva-local"

# Cria o grupo de segurança
echo "Criando o grupo de segurança..."
group_id=$(aws ec2 create-security-group --group-name "$security_group_name" --description "Grupo de segurança para acesso à porta 80" --output text)
echo "Grupo de segurança criado com sucesso! ID do grupo: $group_id"

# Autoriza o tráfego na porta 80
echo "Autorizando o tráfego na porta 80..."
aws ec2 authorize-security-group-ingress --group-id "$group_id" --protocol tcp --port 80 --cidr 0.0.0.0/0
echo "Tráfego na porta 80 autorizado!"

echo "Grupo de segurança criado e configurado com sucesso."
