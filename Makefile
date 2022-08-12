TAG=$(shell git rev-parse --short HEAD)
LOG_SSH_KEY?=id_ecdsa
SERVER_SSH_KEY?=id_ecdsa

build_backend:
	docker build \
		-t backend:$(TAG) \
		-f backend/Dockerfile \
		--secret id=ssh-script,src=.circleci/scripts/go_mod_ssh_config.sh \
		--secret id=log-key,src=${HOME}/.ssh/${LOG_SSH_KEY} \
		--secret id=server-key,src=${HOME}/.ssh/${SERVER_SSH_KEY} \
		.

build_authorizer:
	docker build \
		-t authorizer:$(TAG) \
		-f authorizer/Dockerfile \
		--secret id=ssh-script,src=.circleci/scripts/go_mod_ssh_config.sh \
		--secret id=log-key,src=${HOME}/.ssh/${LOG_SSH_KEY} \
		--secret id=server-key,src=${HOME}/.ssh/${SERVER_SSH_KEY} \
		.
