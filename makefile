.PHONY: build build_zip

build:
	zig build
	wasm2wat zig-out/lib/wasm_zig_sdk.wasm -o zig-out/lib/wasm_zig_sdk.wat

run: build
	go run example/main.go

build_zip:
	TEMPHIA_BDEV_BPRINT_CONFIG="src/example/bprint.yaml" temphia-cli bdev zip