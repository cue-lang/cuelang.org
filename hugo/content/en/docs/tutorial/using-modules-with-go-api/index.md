---
title: Using modules with the Go API
authors:
- myitcv
tags:
- modules
- tooling
toc_hide: true
---

```text { title="TERMINAL" codeToCopy="Y3VlIG1vZCBpbml0IG91ci5leGFtcGxlL21vZEB2MA==" }
$ cue mod init our.example/mod@v0
```

```cue { title="main.cue" }
package main

import "schemas.example/person@v0"

p: person.#Person & {
	name: "cueckoo"
	age:  99
}
```

```text { title="TERMINAL" codeToCopy="ZXhwb3J0IENVRV9FWFBFUklNRU5UPW1vZHVsZXMKY3VlIG1vZCB0aWR5CmN1ZSBleHBvcnQ=" }
$ export CUE_EXPERIMENT=modules
$ cue mod tidy
$ cue export
{
    "p": {
        "name": "cueckoo",
        "age": 99
    }
}
```

```text { title="TERMINAL" codeToCopy="Z28gbW9kIGluaXQgb3VyLmV4YW1wbGUvbW9k" }
$ go mod init our.example/mod
...
```

```go { title="main.go" }
package main

import (
	"fmt"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
)

func main() {
	ctx := cuecontext.New()
	bps := load.Instances([]string{"."}, &load.Config{
		Env: []string{"CUE_REGISTRY=localhost:5000"},
	})
	v := ctx.BuildInstance(bps[0])
	namePath := cue.ParsePath("p.name")
	name := v.LookupPath(namePath)
	fmt.Printf("%v: %v\n", namePath, name)
}
```

```text { title="TERMINAL" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjkuMC1hbHBoYS4xCmdvIG1vZCB0aWR5CmdvIHJ1biAu" }
$ go get cuelang.org/go@v0.9.0-alpha.1
...
$ go mod tidy
...
$ go run .
p.name: "cueckoo"
```
