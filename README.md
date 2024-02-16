# ignite-intern-task

## Creating The Kind Cluster using Bash
```bash
bash kind.sh
```

### Create The Hello_World Express


#### Build the Dockerfile


on the Terminal in the Dockerfile directory Run :

docker build -t my-app:1.1 .

check the created image

docker image ls

start the image created

docker run my-app:1.1

docker tag my-app:1.1 <YOUR_DOCKERHUB_NAME>/myapp:1.1

push to Docker hub registry: docker push <YOUR_DOCKERHUB_NAME>/myapp:1.1


## Create a terraform file to deploy container on the kind-kubernetes

```bash
terraform init
terraform plan
terraform apply
```