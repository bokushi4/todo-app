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
	cd app/todo-backend/ \
	&& chalice deploy --stage dev

delete_dev:
	cd app/todo-backend/ \
	&& chalice delete --stage dev

deploy_prod:
	cd app/todo-backend/ \
	&& chalice deploy --stage prod

delete_prod:
	cd app/todo-backend/ \
	&& chalice delete --stage prod

create_table_local:
	cd app/dynamodb/ \
	&& aws dynamodb create-table --cli-input-json file://schema.json --endpoint-url http://localhost:8000

init_db_local:
	cd app/dynamodb/ \
	&& aws dynamodb batch-write-item --request-items file://initial-data.json --endpoint-url http://localhost:8000

db_scan_local:
	aws dynamodb scan --table-name Todos --endpoint-url http://localhost:8000

create_table_prod:
	cd app/dynamodb/ \
	&& aws dynamodb create-table --cli-input-json file://schema.json

init_db_prod:
	cd app/dynamodb/ \
	&& aws dynamodb batch-write-item --request-items file://initial-data.json

db_scan_prod:
	aws dynamodb scan --table-name Todos
