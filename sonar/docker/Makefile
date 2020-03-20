export AWS_PROFILE=dev
export KUBECONFIG=~/.kube/config-eks-dev

SERVER_IMAGE=840205991060.dkr.ecr.eu-central-1.amazonaws.com/dev/sonar:1.0.0

all:
	@docker build -t $(SERVER_IMAGE) .

push:
	@eval 'aws ecr get-login' && docker push 840205991060.dkr.ecr.eu-central-1.amazonaws.com/dev/sonar:1.0.0
