TAG=$(shell git rev-parse --short HEAD)

build_backend:
	docker build \
		-t backend:$(TAG) \
		-f backend/Dockerfile \
		--secret id=sshKey,src=${HOME}/.ssh/id_ecdsa \
		.

build_authorizer:
	docker build \
		-t authorizer:$(TAG) \
		-f authorizer/Dockerfile \
		--secret id=sshKey,src=${HOME}/.ssh/id_ecdsa \
		.
