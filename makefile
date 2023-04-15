build:
	zig build-lib src/main.zig -target wasm32-freestanding -dynamic -OReleaseSmall
	mv main.wasm zig-out/
	mv main.wasm.o zig-out/