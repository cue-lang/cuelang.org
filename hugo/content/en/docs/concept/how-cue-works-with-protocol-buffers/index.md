---
title: How CUE works with Protocol Buffers
tags:
- encodings
authors:
- jpluscplusm
toc_hide: true
---

[Protocol Buffers](https://protobuf.dev/), also known as *Protobuf*, is a
language-neutral, platform-neutral, and extensible mechanism for serializing
structured data, initially developed and released by Google.

Protobuf definitions can be converted to CUE by the `cue` command and CUE's Go API,
applying any CUE validation code that's present as a Protobuf option.

## Converting Protobuf to CUE with the `cue` command

Let's see the `cue` command in action, converting Protobuf to CUE.

We'll start with this Protobuf file, `basic.proto`:

```proto { title="basic.proto" }
syntax = "proto3";

// Package basic is rather basic.
package cuelang.examples.basic;

import "cue/cue.proto";

option go_package = "cuelang.org/encoding/protobuf/examples/basic";

// This is my type.
message MyType {
    string string_value = 1; // Some string value

    // A method must start with a capital letter.
    repeated string method = 2 [(cue.val) = '[...=~"^[A-Z]"]'];
}
```

The `cue import` command converts Protobuf to CUE:

```text { title="TERMINAL" codeToCopy="Y3VlIGltcG9ydCBiYXNpYy5wcm90bw==" }
$ cue import basic.proto
```
The command displays nothing, indicating that it was successful.
It creates this CUE file:

```cue { title="basic.cue" }
// Package basic is rather basic.
package basic

// This is my type.
#MyType: {
	stringValue?: string @protobuf(1,string,name=string_value) // Some string value

	// A method must start with a capital letter.
	method?: [...string] @protobuf(2,string)
	method?: [...=~"^[A-Z]"]
}
```

Do you notice how the `method` field's type and constraints are split over two lines?
That's exactly as expected, because CUE's core operation is to automatically
*unify* each field's right-hand-side.
## Using the Go API

CUE's Go API can achieve the same result as the `cue import` command,
but with the added flexibility of features such as customizable include paths.

This simple Go code takes the `basic.proto` file from above and prints the equivalent CUE:

```go { title="main.go" }
package main

import (
	"cuelang.org/go/cue/format"
	"cuelang.org/go/encoding/protobuf"
	"fmt"
	"log"
)

func main() {
	file, err := protobuf.Extract("basic.proto", nil, &protobuf.Config{
		Paths: []string{ /* paths to proto includes */ },
	})
	if err != nil {
		log.Fatal(err, "")
	}
	b, _ := format.Node(file)
	fmt.Println(string(b))
}
```
Here's the program's output - identical to the CUE code produced by `cue import`, above:

```text { title="TERMINAL" codeToCopy="Z28gcnVuIG1haW4uZ28=" }
$ go run main.go
// Package basic is rather basic.
package basic

// This is my type.
#MyType: {
	stringValue?: string @protobuf(1,string,name=string_value) // Some string value

	// A method must start with a capital letter.
	method?: [...string] @protobuf(2,string)
	method?: [...=~"^[A-Z]"]
}

```

### Extracting CUE from several Protobuf files

In some environments it might be necessary to import multiple Protobuf files
that map to different CUE packages within the same module.
If several `.proto` files import each other, and other centralized schema
definitions, then things can get hairy!

In this situation, CUE's Go API has you covered. The
[`encoding/protobuf`](https://pkg.go.dev/cuelang.org/go/encoding/protobuf)
package can be configured to deal with:

- `.proto` files that have a `go_package` directive: CUE uses this path
- files that map to a package within the CUE module: CUE uses the package's
  directory
- otherwise: CUE maps to a location in the `cue.mod/pkg` directory

## Protobuf mappings

The mappings between Protobuf and CUE types are outlined in the `encoding/protobuf`
[package documentation](https://pkg.go.dev/cuelang.org/go/encoding/protobuf#hdr-Type_Mappings).

## Future plans

CUE's support for Protobuf is only going to expand,
with plans already in place for converting CUE definitions to Protobuf,
and for bidirectional conversion of text, binary and JSON Protobuf *messages* to and from CUE.
