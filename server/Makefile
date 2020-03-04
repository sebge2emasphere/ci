all:
	@docker build -t 840205991060.dkr.ecr.eu-central-1.amazonaws.com/emasphere/ema-jenkins:1.0.0 .

clean:
	@docker-compose down

start:
	@docker-compose up --force-recreate --build
