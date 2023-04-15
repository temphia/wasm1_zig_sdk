build:
	zig build-lib src/main.zig -target wasm32-freestanding -dynamic -OReleaseSmall
	mv main.wasm zig-out/
	mv main.wasm.o zig-out/

build_zip:
	TEMPHIA_BDEV_BPRINT_CONFIG="src/example/bprint.yaml" temphia-cli bdev zip