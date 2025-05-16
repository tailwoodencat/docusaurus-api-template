ROOT_NAME ?=docusaurus-api-template

ENV_NODE_MODULES_FOLDER     =node_modules/
ENV_NODE_MODULES_LOCK_FILE  =package-lock.json
ENV_PNPM_LOCK_FILE          =pnpm-lock.yaml
ENV_ROOT_CHANGELOG_PATH     ?=CHANGELOG.md
ENV_COVERAGE_OUT_FOLDER     =coverage/

ENV_DOCUSAURUS_BUILD_EXPORT_FOLDER ?=build/
ENV_DOCUSAURUS_BUILD_WORK_FOLDER   ?=.docusaurus/

.PHONY: env
env:
	@echo "-> show node version"
	node -v
	@echo "-> show npm version"
	npm -v
	@echo "-> show pnpm version"
	pnpm -v
	@echo "-> show fnm version"
	-fnm --version

clean.docusaurus.build:
	@$(RM) -r ${ENV_DOCUSAURUS_BUILD_EXPORT_FOLDER}
	$(info ~> has cleaned ${ENV_DOCUSAURUS_BUILD_EXPORT_FOLDER})
	@$(RM) -r ${ENV_DOCUSAURUS_BUILD_WORK_FOLDER}
	$(info ~> has cleaned ${ENV_DOCUSAURUS_BUILD_WORK_FOLDER})

.PHONY: clean.coverage.out
clean.coverage.out:
	@$(RM) -r ${ENV_COVERAGE_OUT_FOLDER}
	$(info ~> has cleaned ${ENV_COVERAGE_OUT_FOLDER})

.PHONY: clean.npm.cache
clean.npm.cache:
	@$(RM) -r ${ENV_NODE_MODULES_FOLDER}
	$(info ~> has cleaned ${ENV_NODE_MODULES_FOLDER})
	@$(RM) ${ENV_NODE_MODULES_LOCK_FILE}
	$(info ~> has cleaned ${ENV_NODE_MODULES_LOCK_FILE})
	@$(RM) ${ENV_PNPM_LOCK_FILE}
	$(info ~> has cleaned ${ENV_PNPM_LOCK_FILE})

.PHONY: clean.all
clean.all: clean.coverage.out clean.docusaurus.build clean.npm.cache
	@echo "=> clean all finish"

.PHONY: init
init: dep
	$(info => just init start)

.PHONY: dep.install
dep.install:
	pnpm install
	pnpm run clean:lockfile
	pnpm run docusaurus --version

.PHONY: dep.prune
dep.prune:
	pnpm prune

.PHONY: dep.graph
dep.graph:
	pnpm list -l

.PHONY: dep
dep: dep.install

.PHONY: dep.reinstall
dep.reinstall: clean.npm.cache dep

.PHONY: up.check.upgrade
up.check.upgrade:
	npx npm-check-updates

.PHONY: up.do.npm.check.upgrade
up.do.npm.check.upgrade:
	npx npm-check-updates -u
	pnpm install

.PHONY: up.no.interactive
up.no.interactive: up.check.upgrade up.do.npm.check.upgrade

.PHONY: up
up:
	npx npm-check-updates --interactive --format group

.PHONY: clean.docusaurus
cleanDocusaurus:
	pnpm run clear

.PHONY: build.pre
build.pre:
	pnpm run write-translations
	pnpm run write-heading-ids

.PHONY: build.only
build.only:
	pnpm run build

.PHONY: run
run:
	pnpm run start --host 0.0.0.0

.PHONY: run.build
run.build: build.only
	pnpm run serve --host 0.0.0.0 --no-open

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