setup:
	docker-compose up -d --build

backend:
	docker-compose exec backend /bin/bash

frontend:
	docker-compose exec frontend /bin/bash

dynamodb_local:
	docker-compose exec dynamodb_local 

deploy_local:
	cd app/todo-backend/ \
	&& chalice local --stage dev --port 8080

deploy_dev:
	chalice deploy --stage dev

delete_dev:
	chalice delete --stage dev

create_table:
	cd app/dynamodb/ \
	&& aws dynamodb create-table --cli-input-json file://schema.json --endpoint-url http://localhost:8000

init_db:
	cd app/dynamodb/ \
	&& aws dynamodb batch-write-item --request-items file://initial-data.json --endpoint-url http://localhost:8000

db_scan:
	aws dynamodb scan --table-name Todos --endpoint-url http://localhost:8000
