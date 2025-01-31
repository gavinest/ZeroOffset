build:
	rm -rf build
	mkdir -p build/ZeroOffset.spoon
	cp init.lua build/ZeroOffset.spoon/init.lua
	(cd build && zip -r ../Spoons/ZeroOffset.spoon.zip ZeroOffset.spoon)

.PHONY: build