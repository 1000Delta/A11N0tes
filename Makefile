tools/webhook/webhook:
	cd tools/webhook && go build

.PHONY: build
build: tools/webhook/webhook

.PHONY: run
run: build
	cd tools/webhook && GIN_MODE=release ./webhook 1>>access.log 2>>error.log &

.PHONY: stop
stop:
	if [ -n "$$(ps | awk '{ if($$4=="webhook"){print $$1}}')" ]; then kill $$(ps | awk '{ if($$4=="webhook"){print $$1}}'); fi