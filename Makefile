all:
	@docker build -t sebge2/jenkins .

clean:
	@docker-compose down

start:
	@docker-compose up --force-recreate --build
