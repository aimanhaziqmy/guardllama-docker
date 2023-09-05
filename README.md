# guardllama-docker

## GuardLlama installation using Dockerfile.
GuardLlama official docs : `https://guardllama.net/`

## Build the Docker Image 
command
```
docker build -t guardllama-image .
```

## Run the container
command
```
docker run -p 443:443 -p 80:80 --name guardllama-container guardllama-image
```
