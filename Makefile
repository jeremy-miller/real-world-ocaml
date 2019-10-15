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

.PHONY: build-bc
build-bc: ## Build bytecode executable
	@dune build freq.bc

.PHONY: buid-exe
build-exe: ## Build native executable
	@dune build freq.exe

.PHONY: exec-bc
exec-bc: ## Build and execute bytecode executable
	@dune exec ./freq.bc

.PHONY: exec-exe
exec-exe: ## Build and execute bytecode executable
	@dune exec ./freq.exe
