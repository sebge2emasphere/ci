export AWS_PROFILE=dev
export KUBECONFIG=~/.kube/config-eks-dev

SERVER_IMAGE=840205991060.dkr.ecr.eu-central-1.amazonaws.com/dev/jenkins-server:1.0.0

all:
	@docker build -t $(SERVER_IMAGE) .

push:
	$$(aws ecr get-login --no-include-email)
	docker push 840205991060.dkr.ecr.eu-central-1.amazonaws.com/dev/jenkins-server:1.0.0
