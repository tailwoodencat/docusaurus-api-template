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
	$(info => just init start)
	node -v
	npm -v
	corepack --version
	fnm --version
	npm --version

.PHONY: npm.install
npm.install:
	npm install
	npm run clean:lockfile

.PHONY: dep.prune
dep.prune:
	npm prune

.PHONY: dep.praph
dep.praph:
	npm list -l

.PHONY: dep
dep: npm.install

.PHONY: dep.reinstall
dep.reinstall: clean.npm.cache dep

.PHONY: up.check.upgrade
up.check.upgrade:
	npx npm-check-updates

.PHONY: up.do.npm.check.upgrade
up.do.npm.check.upgrade:
	npx npm-check-updates -u
	npm install

.PHONY: up.no.interactive
up.no.interactive: up.check.upgrade up.do.npm.check.upgrade

.PHONY: up
up:
	npx npm-check-updates --interactive --format group

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