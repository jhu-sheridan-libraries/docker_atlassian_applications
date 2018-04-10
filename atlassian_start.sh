#!/bin/bash

#Ensure environment is clean (does not delete the data, just the containers)
docker-compose -p atlassian rm -f -s 

# Start crowd first, it's required by others
docker-compose -p atlassian up -d crowd
sleep 10

#Then start confluence and jira, order does not matter
docker-compose -p atlassian up -d confluence jira
sleep 20

#Finally, start nginx proxy
docker-compose -p atlassian up -d nginx
