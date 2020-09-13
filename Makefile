VERSION := 10.19.0
.PHONY: build
build:
	@docker build -t xackery/webbuild .
.PHONY: deploy
deploy: build
	@docker tag xackery/webbuild xackery/webbuild:${VERSION}
	@docker push xackery/webbuild:${VERSION}