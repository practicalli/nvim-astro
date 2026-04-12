# -------------------------------------- #
# Practicalli Makefile
#
# `-` before a command ignores any errors returned

# Requirements
# - mega-linter-runner
# -------------------------------------- #

# -- Makefile task config -------------- #
# .PHONY: ensures target used rather than matching file name
# https://makefiletutorial.com/#phony
.PHONY: all clean deps dist docs lint pre-commit-check repl test test-ci test-watch
# -------------------------------------- #

# -- Makefile Variables ---------------- #
# run help if no target specified
.DEFAULT_GOAL := help
# Column the target description is printed from
HELP-DESCRIPTION-SPACING := 24

# SHELL := /usr/bin/zsh

# Tool variables
MEGALINTER_RUNNER := npx mega-linter-runner --flavor java --env "'MEGALINTER_CONFIG=.github/config/megalinter.yaml'" --remove-container
OUTDATED_FILE := outdated-$(shell date +%y-%m-%d-%T).md

# Makefile file and directory name wildcard
# EDN-FILES := $(wildcard *.edn)
# -------------------------------------- #

# -- Code Quality ---------------------- #
pre-commit-check: lint ## Run lint target

lint:  ## Run MegaLinter with custom configuration (node.js required)
	$(info -- MegaLinter Runner ---------------------)
	$(MEGALINTER_RUNNER)

lint-fix:  ## Run MegaLinter with applied fixes and custom configuration (node.js required)
	$(info -- MegaLinter Runner fix errors ----------)
	$(MEGALINTER_RUNNER) --fix

lint-clean:  ## Clean MegaLinter report information
	$(info -- MegaLinter Clean Reports --------------)
	- rm -rf ./megalinter-reports

megalinter-upgrade:  ## Upgrade MegaLinter config to latest version
	$(info -- MegaLinter Upgrade Config -------------)
	npx mega-linter-runner@latest --upgrade

dependencies-outdated: ## Report new versions of library dependencies and GitHub action
	$(info -- Search for outdated libraries ---------)
	- clojure -T:search/outdated > $(OUTDATED_FILE)

dependencies-update: ## Update all library dependencies and GitHub action
	$(info -- Search for outdated libraries ---------)
	- clojure -T:update/dependency-versions > $(OUTDATED_FILE)
# -------------------------------------- #


# ------- Version Control -------------- #
git-sr:  ## status list of git repos under current directory
	$(info -- Multiple Git Repo Status --------------)
	mgitstatus -e --flatten

git-status:  ## status details of git repos under current directory
	$(info -- Multiple Git Status -------------------)
	mgitstatus
# -------------------------------------- #

# -- Help ------------------------------ #
# Source: https://nedbatchelder.com/blog/201804/makefile_help_target.html

help:  ## Describe available tasks in Makefile
	@grep '^[a-zA-Z]' $(MAKEFILE_LIST) | \
	sort | \
	awk -F ':.*?## ' 'NF==2 {printf "\033[36m  %-$(HELP-DESCRIPTION-SPACING)s\033[0m %s\n", $$1, $$2}'
# -------------------------------------- #
