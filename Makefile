.PHONY: default build release clean

default: build ;

RUST_VERSION := 1.16.0
IMAGE_USER := marccarre
IMAGE_NAME := rust-dev-env
IMAGE := $(IMAGE_USER)/$(IMAGE_NAME)

build:
	docker build \
		-t $(IMAGE):latest \
		-t $(IMAGE):$(RUST_VERSION) \
		-t quay.io/$(IMAGE):latest \
		-t quay.io/$(IMAGE):$(RUST_VERSION) \
		--build-arg=rust_version=$(RUST_VERSION) \
		$(dir $(realpath $(firstword $(MAKEFILE_LIST))))

release:
	docker push $(IMAGE):latest
	docker push $(IMAGE):$(RUST_VERSION)
	docker push quay.io/$(IMAGE):latest
	docker push quay.io/$(IMAGE):$(RUST_VERSION)

clean:
	docker rmi -f \
		$(IMAGE):latest \
		$(IMAGE):$(RUST_VERSION) \
		quay.io/$(IMAGE):latest \
		quay.io/$(IMAGE):$(RUST_VERSION)
