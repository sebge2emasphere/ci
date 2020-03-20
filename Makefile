all:
	make -C ./jenkins/docker
	make -C ./sonar/docker

apply:
	kubectl apply -f ./k8s/ -f ./k8s/local

setup:
	kubectl apply -f k8s/namespace.yaml
	kubectl delete secret com.emasphere.dev.ecr --namespace ci 2>/dev/null; true
	kubectl create secret docker-registry com.emasphere.dev.ecr --docker-username=AWS --docker-password=$(shell export AWS_PROFILE=dev && export KUBECONFIG=~/.kube/config-eks-dev && aws ecr get-login --no-include-email | sed -e 's/docker login \-u AWS -p \(.*\) https\:\/\/840205991060.dkr.ecr.eu-central-1.amazonaws.com/\1/') --docker-server=840205991060.dkr.ecr.eu-central-1.amazonaws.com --namespace ci
	kubectl apply -f ./k8s/local -f ./k8s
