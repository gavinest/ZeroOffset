BUILD_DIR = build/ZeroOffset.spoon

build:
	rm -rf $(BUILD_DIR)
	mkdir -p $(BUILD_DIR)
	cp init.lua $(BUILD_DIR)/init.lua
	hs -c "hs.doc.builder.genJSON(\"$(shell pwd)\")" | grep -v "^--" > $(BUILD_DIR)/docs.json
	(cd build && zip -r ../Spoons/ZeroOffset.spoon.zip ZeroOffset.spoon)

.PHONY: build