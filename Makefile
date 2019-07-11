APP ?= rest-rtt
REPO ?= netaskd

all:	build

release: tag push

build:
	docker build $(BUILD_ARGS) -t $(APP) .

tag:
	docker tag $(APP) $(REPO)/$(APP)

push:
	docker push $(REPO)/$(APP)

test:
	docker run --rm -it -p 4432:4432 -v ${PWD}/nginx.conf:/etc/nginx/nginx.conf --entrypoint=/bin/bash $(REPO)/$(APP)

.PHONY: build tag push test
