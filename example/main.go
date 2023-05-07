package main

import (
	"context"
	_ "embed"
	"fmt"
	"os"

	"github.com/k0kubun/pp"
	"github.com/tetratelabs/wazero"
	"github.com/tetratelabs/wazero/api"
)

var code []byte

func init() {
	_code, err := os.ReadFile("zig-out/lib/wasm_zig_sdk.wasm")
	if err != nil {
		pp.Println(err.Error())
		panic(err)
	}

	code = _code
}

func main() {
	if err := run(); err != nil {
		pp.Println(err)
		pp.Println(err.Error())
	}
}

func run() error {
	ctx := context.Background()

	r := wazero.NewRuntime(ctx)
	defer r.Close(ctx)

	_, err := r.NewHostModuleBuilder("temphia1").
		NewFunctionBuilder().WithFunc(log).Export("log").
		Instantiate(ctx)
	if err != nil {
		return err
	}

	mod, err := r.InstantiateWithConfig(ctx, code,
		wazero.NewModuleConfig().WithStdout(os.Stdout).WithStderr(os.Stderr))
	if err != nil {
		return err
	}

	ahello := mod.ExportedFunction("action_hello")
	malloc := mod.ExportedFunction("allocBytes")
	//	free := mod.ExportedFunction("freeBytes")

	resp, err := malloc.Call(ctx, 24)
	if err != nil {
		return err
	}

	// set data

	if !mod.Memory().Write(uint32(resp[0]), []byte(`hello@darkside`)) {
		panic("Cannot write data")
	}

	pp.Println(ahello.Call(ctx, resp[0], 24))

	return nil
}

func log(ctx context.Context, m api.Module, offset, len int32) {
	buf, ok := m.Memory().Read(uint32(offset), uint32(len))
	if !ok {
		fmt.Printf("Memory.Read(%d, %d) out of range", offset, len)
		panic("Mem read Not ok")
	}

	fmt.Println(string(buf))
}
