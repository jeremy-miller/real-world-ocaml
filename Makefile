default: help

.PHONY: help
help: ## Show this help
	@echo
	@echo "Available commands:"
	@echo
	@awk -F ':|##' '/^[^\t].+?:.*?##/ {printf "\033[36m%-30s\033[0m %s\n", $$1, $$NF}' $(MAKEFILE_LIST)

.PHONY: format
format: ## Format files
	@dune build @fmt --auto-promote

.PHONY: build
build: ## Build
	@dune build freq.bc

.PHONY: exec
exec: ## Build and execute
	@dune exec ./freq.bc
