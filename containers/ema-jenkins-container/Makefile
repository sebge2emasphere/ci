all:
	@docker build -t 840205991060.dkr.ecr.eu-central-1.amazonaws.com/dev/jenkins-container:1.0.0 .

test:
	@docker run -it 840205991060.dkr.ecr.eu-central-1.amazonaws.com/dev/jenkins-container:1.0.0 sh

push:
	@docker push 840205991060.dkr.ecr.eu-central-1.amazonaws.com/dev/jenkins-container:1.0.0
