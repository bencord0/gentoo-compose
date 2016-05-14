NAME=gentoo

help:
	# shell - enter a shell
	# docker-clean - clean up old containers

shell:
	docker-compose run --service-ports --rm $(NAME) /bin/bash

docker-clean-containers:
	@echo Removing all containers
	-docker ps -a | tail -n+2 | \
		awk '{ print $$1; }' | \
		xargs docker rm -f 2>/dev/null

docker-clean-images:
	@echo Removing old images
	-docker images | \
		awk '/none/ {print $$3}' | \
		xargs docker rmi 2>/dev/null

docker-clean: docker-clean-containers docker-clean-images
.PHONY: help shell docker-clean
.PHONY: docker-clean-containers docker-clean-images
