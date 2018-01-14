WEBPACK=./node_modules/.bin/webpack

.PHONY: all
all: deps build

.PHONY: buld
build: build-client build-server

.PHONY: build-client
build-client:
ifeq ($(OPTIMIZE), 1)
	NODE_ENV=production $(WEBPACK) --bail
else
	$(WEBPACK) --bail
endif

.PHONY: build-server
build-server:
ifeq ($(OPTIMIZE), 1)
	swift build -c release
else
	swift build
endif

.PHONY: run
run:
	./.build/debug/stock serve

.PHONY: watch
watch:
	$(WEBPACK) --progress --colors --watch

.PHONY: run-dev-server
run-dev-server:
	webpack-dev-server --inline --progress --colors -d --host 0.0.0.0 --port 8081

.PHONY: deps
deps:
	yarn

#.PHONY: docker
#docker:
#	docker build -t react-swift-example .
#
#.PHONY: docker-run
#docker-run:
#	docker run -it --rm=true -p 8080:8080 react-swift-example $(DOCKER_COMMAND)

.PHONY: check-integration
check-integration:
	./node_modules/.bin/mocha --timeout 60000 --compilers js:babel-core/register Tests/Integration/**/*.js

.PHONY: run-webdriver
run-webdriver:
	./node_modules/.bin/phantomjs --webdriver=4444

.PHONY: xcode
xcode:
	swift package generate-xcodeproj
