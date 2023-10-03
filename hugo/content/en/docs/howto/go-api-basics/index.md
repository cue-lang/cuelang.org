---
title: Go API basics
tags:
- go api
authors:
- myitcv
toc_hide: true
---

This howto demonstrates getting started with CUE's Go API.

```text { title="TERMINAL" codeToCopy="Z28gdmVyc2lvbgo=" }
$ go version
go version go1.21.1 linux/amd64
```

```text { title="TERMINAL" codeToCopy="Z28gbW9kIGluaXQgZXhhbXBsZQo=" }
$ go mod init example
go: creating new go.mod: module example
```

```go { title="main_test.go" }
package main

import (
	"math/rand"
	"testing"
	"time"
)

func TestRand(t *testing.T) {
	time.Sleep(time.Duration(rand.Int63n(10)) * time.Millisecond)
}
```

```text { title="TERMINAL" codeToCopy="Z28gdGVzdAo=" }
$ go test
PASS
ok  	example	0.002s
```
