# env
WORKDIR=$(shell pwd)
DIR_TOOL_WEBHOOK=${WORKDIR}/tools/webhook
# build
DIR_TOOL_BIN=${WORKDIR}/tools/bin

${DIR_TOOL_WEBHOOK}/*.go:  
	cd ${DIR_TOOL_WEBHOOK} && \
	go build

.PHONY: webhook
webhook: ${DIR_TOOL_WEBHOOK}/*.go

.PHONY: webhook_run
webhook_run:
	cd ${DIR_TOOL_WEBHOOK} && \
	GIN_MODE=release ./webhook 1>>access.log 2>>error.log &

.PHONY: webhook_stop
webhook_stop:
	@target=$$(ps | awk '{ if($$4=="./webhook"){print $$1}}'); \
	if [ -n "$$target" ]; then \
	echo "stop $$target"; \
	kill $$target; \
	fi

.PHONY: build
build: webhook

.PHONY: run
run: build webhook_run
	
.PHONY: stop
stop: webhook_stop

.PHONY: clean
clean:
	-rm ${DIR_TOOL_BIN}/*