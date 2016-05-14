NAME=gentoo

help:
	# shell - enter a shell
	# docker-clean - clean up old containers

shell:
	docker-compose run --service-ports --rm $(NAME) /bin/bash

docker-clean-containers:
	@echo Removing all containers
	-docker ps -aq | \
		xargs -r docker rm -f

docker-clean-images:
	@echo Removing old images
	-docker images -q -f="dangling=true" | \
		xargs -r docker rmi -f

docker-clean: docker-clean-containers docker-clean-images
.PHONY: help shell docker-clean
.PHONY: docker-clean-containers docker-clean-images
