all:
	@docker build -t 840205991060.dkr.ecr.eu-central-1.amazonaws.com/dev/postgres:11.4 .

test:
	@docker run -it 840205991060.dkr.ecr.eu-central-1.amazonaws.com/dev/postgres:11.4 sh

push:
	@docker push 840205991060.dkr.ecr.eu-central-1.amazonaws.com/dev/postgres:11.4
