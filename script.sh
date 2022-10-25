#!/bin/bash

echo "Criando as imagens..."

docker build -t pedro-camara/pacifista-backend:1.0 backend/.
docker build -t pedro-camara/pacifista-database:1.0 database/.

echo "Realizando o push das imagens"

docker push pedro-camara/pacifista-backend:1.0
docker push pedro-camara/pacifista-database:1.0

echo "Criando serviços no cluster k8's"

kubectl apply -f ./services.yml

echo "Criando o deploy no cluster k8's"

kubectl aplly -f ./deploy.yml