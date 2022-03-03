#!/bin/bash

# Stop all containers
docker-compose stop

# Down and remove volumes
docker-compose down --volumes 

sudo rm -rf config/ logs/ data/