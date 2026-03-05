.PHONY: gitignore
gitignore:
	@echo "Generating .gitignore file..."; \
	if [ -f .gitignore ]; then \
			sed '/^### Generated .gitignore contents, place custom entries above this line ###/,$$d' .gitignore > .gitignore.header; \
	else \
			touch .gitignore.header; \
	fi; \
	curl -fsSL https://www.toptal.com/developers/gitignore/api/git,macos,terraform,visualstudiocode,vim > .gitignore.generated; \
	cat .gitignore.header > .gitignore.tmp; \
	echo "### Generated .gitignore contents, place custom entries above this line ###" >> .gitignore.tmp; \
	cat .gitignore.generated >> .gitignore.tmp; \
	mv .gitignore.tmp .gitignore; \
	rm -f .gitignore.header .gitignore.generated; \
	echo ".gitignore file generated."

.PHONY: lint
lint:
	pre-commit run --all-files
