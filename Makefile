.PHONY: build rebuild ls run ps curl exec select help
.DEFAULT_GOAL := select

build: ## Build docker image
		docker image build -t ctn-cicd-hdon .
build-prod: ## Build docker image for prod
		docker image build -t 786832920677.dkr.ecr.ap-northeast-1.amazonaws.com/ctn-cicd-hdon-repo:0.0.1 .
docker-login: ## Docker login from AWS Cloud9
		aws ecr get-login-password | docker login --username AWS --password-stdin 786832920677.dkr.ecr.ap-northeast-1.amazonaws.com
push-prod: ## push to ECR docker image for prod
		docker push 786832920677.dkr.ecr.ap-northeast-1.amazonaws.com/ctn-cicd-hdon-repo:0.0.1
rebuild: ## Build docker image without using cache
		docker image build --no-cache -t ctn-cicd-hdon .
ls: ## Check docker image status
		docker image ls
run: ## Launching container
		docker run -p 8080:80 --name local-run ctn-cicd-hdon
ps: ## Check container status
		docker ps
curl: ## Send HTTP request to port 8080 on localhost
		curl localhost:8080
exec: ## Login to container
		docker exec -it local-run bash
select: ## Select target command
		@target=$$(grep -Eo '^[a-zA-Z_-]+' $(MAKEFILE_LIST) | peco); \
		if [ -n "$$target" ]; then \
			make "$$target"; \
		fi
help: ## Show help
		@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
			awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
