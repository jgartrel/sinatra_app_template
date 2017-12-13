#
# Setup all targets to repeatedly run as tasks
#
.PHONEY: all install test run clean distclean
all: help

install: ## Install bundler dependencies
	bundle install --path vendor/bundle --binstubs --clean
	bundle package

run:    ## Run a development server
	bundle exec rackup -p 8888

testargs ?= --order random
ifneq ($(strip $(seed)),)
  testargs += --seed $(seed)
endif

test:   ## Run all tests
	bundle exec rspec $(testargs) ./spec

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
