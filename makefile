.PHONY: build build_zip

build:
	zig build-lib example/main.zig -target wasm32-freestanding -dynamic -OReleaseSmall
	mv main.wasm zig-cache/bin
	mv main.wasm.o zig-cache/bin
	wasm2wat zig-cache/bin/main.wasm -o zig-cache/bin/main.wat
build_zip:
	TEMPHIA_BDEV_BPRINT_CONFIG="src/example/bprint.yaml" temphia-cli bdev zip