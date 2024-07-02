---
title: How CUE works with Protocol Buffers
tags:
- encodings
- go api
authors:
- jpluscplusm
toc_hide: true
---

[Protocol Buffers](https://protobuf.dev/), also known as *Protobuf*, is a
language-neutral, platform-neutral, and extensible mechanism for serializing
structured data, initially developed and released by Google.

Protobuf definitions can be converted to CUE by the `cue` command and CUE's Go
API, promoting any CUE validation code placed in Protobuf options to
first-class CUE value constraints.

## Using the `cue` command

Let's start by **converting Protobuf to CUE** using the `cue` command.
We'll begin with this Protobuf file, `basic.proto`:

{{< code-tabs >}}
{{< code-tab name="basic.proto" language="proto" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}

The `cue import` command converts Protobuf to CUE.
It indicates success by displaying no output:

```text { title="TERMINAL" codeToCopy="Y3VlIGltcG9ydCBiYXNpYy5wcm90bw==" }
$ cue import basic.proto
```
The command creates this CUE file:

{{< code-tabs >}}
{{< code-tab name="basic.cue" language="cue" area="top-left" >}}
// Package basic is rather basic.
package basic

// This is my type.
#MyType: {
	stringValue?: string @protobuf(1,string,name=string_value) // Some string value

	// A method must start with a capital letter.
	method?: [...string] @protobuf(2,string)
	method?: [...=~"^[A-Z]"]
}
{{< /code-tab >}}{{< /code-tabs >}}
Do you notice how the `method` field's type and constraints are split over two lines?
That's exactly as expected, because CUE's core operation is to automatically
*unify* each field's right-hand-side.

The behaviour of the `cue import` command can be affected by the flags outlined
in the `proto mode` section of
[the command's help text]({{< relref "docs/reference/command/cue-help-import" >}}).

## Using the Go API

CUE's Go API can achieve the same result as the `cue import` command,
**converting Protobuf definitions to CUE**, but with
[more customization and flexibility](https://pkg.go.dev/cuelang.org/go/encoding/protobuf#Config).

This simple Go code takes the `basic.proto` file shown above, and prints the
equivalent CUE:

{{< code-tabs >}}
{{< code-tab name="main.go" language="go" area="top-left" >}}
package main

import (
	"fmt"
	"log"

	"cuelang.org/go/cue/format"
	"cuelang.org/go/encoding/protobuf"
)

func main() {
	file, err := protobuf.Extract("basic.proto", nil, &protobuf.Config{
		Paths: []string{ /* paths to proto includes */ },
	})
	if err != nil {
		log.Fatal(err)
	}
	b, _ := format.Node(file)
	fmt.Println(string(b))
}
{{< /code-tab >}}{{< /code-tabs >}}
Here's the program's output:

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

Notice that the ouput is identical to the CUE produced previously by `cue
import`.

## Extracting CUE from several Protobuf files

In some environments it might be necessary to import multiple Protobuf files
that map to different CUE packages within the same module.
If several `.proto` files import each other, and other centralized schema
definitions, then things can get hairy!
In these situations, CUE's Go API and the `cue` command have you covered.

Both [`cue import`]({{< relref "docs/reference/command/cue-help-import" >}}) and the
[`encoding/protobuf`](https://pkg.go.dev/cuelang.org/go/encoding/protobuf)
package can be configured to handle custom import paths but, by default, when
they encounter ...

- `.proto` files that have a `go_package` directive: CUE uses this path
- files that map to a package within the CUE module: CUE uses the package's directory
- any other import path: CUE maps to a location in the `cue.mod/pkg` directory.

## Experimental APIs

CUE initially publishes APIs and packages marked as "experimental", in order to
gather feedback on their use and structure before comitting the project to
their long-term support.
CUE's Protobuf APIs include two experimental packages:
[`encoding/protobuf/textproto`](https://pkg.go.dev/cuelang.org/go/encoding/protobuf/textproto)
and
[`encoding/protobuf/jsonpb`](https://pkg.go.dev/cuelang.org/go/encoding/protobuf/jsonpb).

`textproto` converts
**[text Protobuf message files](https://protobuf.dev/reference/protobuf/textformat-spec/)
to and from CUE**, and `jsonpb` rewrites a CUE expression based on the Protobuf
interpretation of JSON.

Your feedback on their utility and structure is invaluable - please join the
[CUE community]({{< relref "/community" >}}) on Slack and GitHub, and let us
know how you're using these APIs!

## Protobuf mappings

The mappings between Protobuf and CUE types are outlined in the `encoding/protobuf`
[package documentation](https://pkg.go.dev/cuelang.org/go/encoding/protobuf#hdr-Type_Mappings).

## Future plans

CUE's support for Protobuf is only going to expand, with plans including the
conversion of CUE definitions to *binary* Protobuf definitions, and for
bidirectional conversion of binary and JSON Protobuf *messages* to and from
CUE.

## Related content

- {{< linkto/related/reference "command/cue-help-import" >}}
- {{< linkto/related/reference "command/cue-help-filetypes" >}}
- Go API: [`encoding/protobuf`](https://pkg.go.dev/cuelang.org/go/encoding/protobuf)
- Go API: [`encoding/protobuf/textproto`](https://pkg.go.dev/cuelang.org/go/encoding/protobuf/textproto)
- Go API: [`encoding/protobuf/jsonpb`](https://pkg.go.dev/cuelang.org/go/encoding/protobuf/jsonpb)
