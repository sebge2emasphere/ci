export AWS_PROFILE=dev
export KUBECONFIG=~/.kube/config-eks-dev

all:
	@docker build -t 840205991060.dkr.ecr.eu-central-1.amazonaws.com/dev/mail-relay:1.0.0 .

push:
	$$(aws ecr get-login --no-include-email)
	docker push 840205991060.dkr.ecr.eu-central-1.amazonaws.com/dev/mail-relay:1.0.0
