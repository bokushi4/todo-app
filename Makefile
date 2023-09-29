setup:
	docker-compose up -d --build

backend:
	docker-compose exec backend /bin/bash

frontend:
	docker-compose exec frontend /bin/bash

deploy_local:
	cd app/todo-backend/ \
	&& chalice local --stage dev --port 8080

deploy_dev:
	chalice deploy --stage dev

delete_dev:
	chalice delete --stage dev
