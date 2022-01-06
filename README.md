# Docker Vapor Development

A dockerized Vapor development environment.

## Building the image

    docker build -t vapor .

## Running a sandbox

    docker run --rm -it --name vapor -v $PWD/sandbox:/root/sandbox -p 8080:8080 vapor

## Creating project

    vapor new hello-data --fluent.db sqlite --leaf --no-commit
    cd hello-data
    rm -rf .dockerignore .git .gitignore Dockerfile docker-compose.yml Sources/App/Controllers/.gitkeep

## Serving the project

    cd hello-data
    vapor run migrate
    vapor run serve -H 0.0.0.0

Alternatively `swift run` can be used.

## Testing the API

We can use cURL to check that everything is working.

    curl http://localhost:8080/todos
    curl -X POST http://host.docker.internal:8080/todos/ -H "Content-Type: application/json" \
        -d '{"title": "Write a tutorial"}'
    # {"title":"Write a tutorial","id":"060FD15C-7EB8-498D-8C3A-E7E1214583CB"}

### Docker version of cURL

    docker run --rm -it curl http://host.docker.internal:8080/todos
