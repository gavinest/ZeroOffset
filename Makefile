BUILD_DIR = build/ZeroOffset.spoon

shell:
	docker compose run --rm -it --entrypoint sh zero-offset

lint:
	docker compose run --rm zero-offset luacheck --no-max-comment-line-length --globals hs -- .

test:
	docker compose run --rm zero-offset lua init_test.lua -v

build:
	rm -rf $(BUILD_DIR)
	mkdir -p $(BUILD_DIR)
	cp init.lua $(BUILD_DIR)/
	cp assets/icon.png $(BUILD_DIR)/
	hs -c "hs.doc.builder.genJSON(\"$(shell pwd)\")" | grep -v "^--" | tee $(BUILD_DIR)/docs.json docs/docs.json > /dev/null
	(cd build && zip -r ../Spoons/ZeroOffset.spoon.zip ZeroOffset.spoon)

.PHONY: shell lint build