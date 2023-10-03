---
title: Go API basics
tags:
- go api
authors:
- myitcv
toc_hide: true
---

This howto demonstrates getting started with CUE's Go API.

```text { title="TERMINAL" codeToCopy="Y3VlIHZlcnNpb24K" }
$ cue version
cue version v0.8.0-alpha.5
...
```

```text { title="TERMINAL" codeToCopy="Z28gdmVyc2lvbgo=" }
$ go version
go version go1.22.0 linux/amd64
```

```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCBpbml0IGNvbXBhbnkuY29tL2V4YW1wbGUKZ28gbW9kIGluaXQgY29tcGFueS5jb20vZXhhbXBsZQo=" }
$ cue mod init company.com/example
$ go mod init company.com/example
go: creating new go.mod: module company.com/example
go: to add module requirements and sums:
	go mod tidy
```

```cue { title="some.cue" }
package example

output: "Hello \(name)"
name:   "Joe"
```


```text { title="TERMINAL" codeToCopy="Y3VlIGV4cG9ydCAuCg==" }
$ cue export .
{
    "output": "Hello Joe",
    "name": "Joe"
}
```


```go { title="main.go" }
package main

import (
	"fmt"
	"log"
	"path/filepath"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
)

func main() {
	// Load the package "example" from the current directory.
	// We don't need to specify a config in this case.
	insts := load.Instances([]string{"."}, nil)

	// The current directory just has one file without any build tags,
	// and that file belongs to the example package.
	// So we get a single instance as a result.
	fmt.Println("Number of instances:", len(insts))
	inst := insts[0]
	if err := inst.Err; err != nil {
		log.Fatal(err)
	}
	fmt.Println("Instance module:", inst.Module)
	fmt.Println("Instance import path:", inst.ImportPath)
	fmt.Println()

	// Inspect the syntax trees.
	fmt.Println("Source files:")
	for _, file := range inst.Files {
		fmt.Println(filepath.Base(file.Filename), "with", len(file.Decls), "declarations")
	}
	fmt.Println()

	// Build the instance into a value.
	// We can also use BuildInstances for many instances at once.
	ctx := cuecontext.New()
	val := ctx.BuildInstance(inst)
	if err := val.Err(); err != nil {
		log.Fatal(err)
	}

	// Inspect the contents of the value, such as one string field.
	fieldStr, err := val.LookupPath(cue.MakePath(cue.Str("output"))).String()
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println("Field string:", fieldStr)
}
```

```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjguMC1hbHBoYS41CmdvIG1vZCB0aWR5CmdvIHJ1biAuCg==" }
$ go get cuelang.org/go@v0.8.0-alpha.5
...
$ go mod tidy
...
$ go run .
Number of instances: 1
Instance module: company.com/example@v0
Instance import path: company.com/example@v0:example

Source files:
some.cue with 3 declarations

Field string: Hello Joe
```
