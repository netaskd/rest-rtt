APP ?= rest-rtt
REPO ?= netaskd

build:
	docker build $(BUILD_ARGS) $(REPO)/$(APP) .

test:
	docker run --rm -it -p 4432:4432 -v ${PWD}/nginx.conf:/etc/nginx/nginx.conf --entrypoint=/bin/bash $(REPO)/$(APP)

.PHONY: build
