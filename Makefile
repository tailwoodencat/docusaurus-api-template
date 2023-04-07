.PHONY: test check clean build dist all

dep:
	@npm i

up:
	@npm update

init: dep
	$(info => just init finish project)

cleanDocusaurus:
	@npm run clear

buildPre:
	@npm run write-translations
	@npm run write-heading-ids

buildOnly:
	@npm run build

run:
	@npm run start -- --host 0.0.0.0

runBuild: buildOnly
	@npm run serve -- --host 0.0.0.0 --no-open