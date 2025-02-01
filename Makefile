BUILD_DIR = build/ZeroOffset.spoon

shell:
	docker compose run --rm -it --entrypoint sh zero-offset

lint:
	docker compose run --rm zero-offset luacheck --no-max-comment-line-length --globals hs -- .

build:
	rm -rf $(BUILD_DIR)
	mkdir -p $(BUILD_DIR)
	cp init.lua $(BUILD_DIR)/init.lua
	hs -c "hs.doc.builder.genJSON(\"$(shell pwd)\")" | grep -v "^--" > $(BUILD_DIR)/docs.json
	(cd build && zip -r ../Spoons/ZeroOffset.spoon.zip ZeroOffset.spoon)

.PHONY: shell lint build