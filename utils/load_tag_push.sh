#!/bin/sh
docker load -i $1
docker tag $2 $3
docker push $3
docker rmi $2
docker rmi $3
rm $1
