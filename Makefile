.PHONY: env
env:
	@echo "-> show node version"
	node -v
	@echo "-> show npm version"
	npm -v
	@echo "-> show fnm version"
	-fnm --version

.PHONY: init
init: dep
	$(info => just init finish project)

.PHONY: dep
dep:
	@npm i

.PHONY: up
up:
	@npm update

.PHONY: clean.docusaurus
cleanDocusaurus:
	@npm run clear

.PHONY: build.pre
build.pre:
	@npm run write-translations
	@npm run write-heading-ids

.PHONY: build.only
build.only:
	@npm run build

.PHONY: run
run:
	@npm run start -- --host 0.0.0.0

.PHONY: run.build
run.build: build.only
	@npm run serve -- --host 0.0.0.0 --no-open

.PHONY: help
help:
	@echo "Usage: make [target]"
	@echo "Available targets:"
	@echo "~> make env                      show node and npm version"
	@echo "~> make init                     init project"
	@echo "~> make dep                      install dependencies"
	@echo "~> make up                       update dependencies"
	@echo ""
	@echo "~> make clean.docusaurus         clean docusaurus"
	@echo "~> make build.pre                build pre"
	@echo "~> make build.only               build only"
	@echo ""
	@echo "~> make run                      run project"
	@echo "~> make run.build                run project and build"
	@echo ""