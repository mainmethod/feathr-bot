# Feathr Bot
Support engineer chat bot for Feathr
See in action [here](https://feathr-web-3giubdgjdq-uc.a.run.app/)

## Running
```
make test
```
```
make up
```

## API Docs
```
/api/swagger.yml
```

## Overview
The general architecture is two containerized services: a React frontend, and Flask REST API which also communicates with OpeanAI's API. 
The app is currently built and deployed using GCP triggers, and also contains a workflow to build and push the docker images to docker hub.