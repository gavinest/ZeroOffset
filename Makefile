BUILD_DIR = build/ZeroOffset.spoon
INIT_FILE = src/init.lua
VERSION := $(shell cat VERSION)

shell:
	docker compose run --rm -it --entrypoint sh zero-offset

lint:
	docker compose run --rm zero-offset luacheck --no-max-comment-line-length --globals hs -- .

test:
	docker compose run --rm zero-offset sh -c 'find tests/ -name "*_test.lua" -exec lua {} \;'

version:
	@echo "Creating version: v$(VERSION)"
	sed -i '' -E 's/(obj.version = ")([0-9]+\.[0-9]+\.[0-9]+)(")/\1'"$(VERSION)"'\3/' $(INIT_FILE)
	make build

tag:
	git fetch origin main --tags
	@echo "Creating tag for version: v$(VERSION)"
	git tag -a "v${VERSION}" -m "release v${VERSION}"

# Create the .spoon.zip file and place in Spoons directory.
build:
	@bash -c 'set -eo pipefail; \
	rm -rf $(BUILD_DIR); \
	mkdir -p $(BUILD_DIR); \
	cp $(INIT_FILE) $(BUILD_DIR)/; \
	cp assets/icon.png $(BUILD_DIR)/; \
	hs -c "hs.doc.builder.genJSON(\"$(shell pwd)\"..\"/src\")" | grep -v "^--" | tee $(BUILD_DIR)/docs.json docs/docs.json > /dev/null; \
	(cd build && zip -r ../Spoons/ZeroOffset.spoon.zip ZeroOffset.spoon)'

.PHONY: shell lint test version tag build