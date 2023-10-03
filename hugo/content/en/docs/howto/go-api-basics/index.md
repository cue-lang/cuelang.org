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
# we should really use a full-qualified domain here
$ go mod init example
go: creating new go.mod: module example
```

```go { title="main_test.go" }
package main

import (
	"fmt"
	"math/rand"
	"strings"
	"testing"
	"time"
)

func TestRand(t *testing.T) {
	time.Sleep(time.Duration(rand.Int63n(10)) * time.Millisecond)
	words := strings.Fields("ink runs from the corners of my mouth")
	rand.Shuffle(len(words), func(i, j int) {
		words[i], words[j] = words[j], words[i]
	})
	fmt.Printf("%s\n", strings.Join(words, "\n"))
}
```

```text { title="TERMINAL" codeToCopy="Z28gdGVzdAo=" }
$ go test
my
from
of
the
ink
runs
corners
mouth
PASS
ok  	example	0.006s
```
