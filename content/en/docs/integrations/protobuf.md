+++
title = "Protobuf"
weight = 440
description = "How CUE integrates with Protocol Buffers."
+++

[Protocol buffers](https://developers.google.com/protocol-buffers/)
are Google's language-neutral, platform-neutral,
extensible mechanism for serializing structured data.

CUE can interact with protocol buffers in various ways.
Currently supported are

- convert protocol buffers definitions to CUE definitions and
- extract CUE validation code included as Protobuf options
  in such definitions.

Support is planned for

- generating Protobuf definitions from CUE definitions
- encoding text, binary and JSON Protobuf messages from CUE
- decoding text, binary and JSON Protobuf messages to CUE.


## Extract CUE from Protobuf definitions

### Mappings

Proto definitions are mapped to CUE following the Protobuf to JSON mapping.
Adjusted to CUE:

| Proto type     | CUE type        | Comments                                                                            |
| -------------- | --------------- | ----------------------------------------------------------------------------------- |
| message        | struct          | Message fields become CUE fields, whereby names are mapped to lowerCamelCase.       |
| enum           | e1 \| e2 \| ... | Where ex are strings. A separate mapping is generated to obtain the numeric values. |
| map<K, V>      | { [string]: V } | All keys are converted to strings.                                                  |
| repeated V     | [...V]          | null is accepted as the empty list [].                                              |
| bool           | bool            |                                                                                     |
| string         | string          |                                                                                     |
| bytes          | bytes           | A base64-encoded string when converted to JSON.                                     |
| int32, fixed32 | int32           | An integer with bounds as defined by int32.                                         |
| uint32         | uint32          | An integer with bounds as defined by uint32.                                        |
| int64, fixed64 | int64           | An integer with bounds as defined by int64.                                         |
| uint64         | uint64          | An integer with bounds as defined by uint64.                                        |
| float          | float32         | A number with bounds as defined by float32.                                         |
| double         | float64         | A number with bounds as defined by float64.                                         |
| Struct         | struct          | See struct.proto.                                                                   |
| Value          | _               | See struct.proto.                                                                   |
| ListValue      | [...]           | See struct.proto.                                                                   |
| NullValue      | null            | See struct.proto.                                                                   |
| BoolValue      | bool            | See struct.proto.                                                                   |
| StringValue    | string          | See struct.proto.                                                                   |
| NumberValue    | number          | See struct.proto.                                                                   |
| StringValue    | string          | See struct.proto.                                                                   |
| Empty          | close({})       |                                                                                     |
| Timestamp      | time.Time       | CUE's builtin Time type.                                                            |
| Duration       | time.Duration   | CUE's builtin Duration type.                                                        |


### Field Options

Protobuf definitions can be annotated with CUE constraints that are included
in the generated CUE:

| Option    | FieldOption | Type   | Comment                                                                                                                                  |
| --------- | ----------- | ------ | ---------------------------------------------------------------------------------------------------------------------------------------- |
| (cue.val) |             | string | CUE expression defining a constraint for this field. The string may refer to other fields in a message definition using their JSON name. |
| (cue.opt) |             |        |                                                                                                                                          |
|           | required    | bool   | Defines the field is required. Use with caution.                                                                                         |

An example usage:

{{< highlight proto >}}
message Server {
  int32 port = 1 [(cue.val) = ">5000 & <10_000"];
}
{{< /highlight>}}


### Extract CUE from a standalone `.proto` file

This is currently only supported through the API.

The following file (`basic.proto`)

{{< highlight proto >}}
syntax = "proto3";

// Package basic is just that: basic.
package cuelang.examples.basic;

import "cue/cue.proto";

option go_package = "cuelang.org/encoding/protobuf/examples/basic";

// This is my type.
message MyType {
    string string_value = 1; // just any 'ole string

    // A method must start with a capital letter.
    repeated string method = 2 [(cue.val) = '[...=~"^[A-Z]"]'];
}
{{< /highlight>}}

where the import
[`cue/cue.proto`](https://review.gerrithub.io/plugins/gitiles/cue-lang/cue/+/refs/heads/master/encoding/protobuf/cue/cue.proto)
resides in
[`cuelang.org/go/encoding/protobuf`](https://pkg.go.dev/cuelang.org/go/encoding/protobuf),
can be converted to CUE using the following Go code

{{< highlight go >}}
package main

import (
	"cuelang.org/go/cue/format"
	"cuelang.org/go/encoding/protobuf"
	// ...
)

func main() {
	file, err := protobuf.Extract("basic.proto", nil, &protobuf.Config{
		Paths: []string{ /* paths to proto includes */ },
	})

	if err != nil {
		log.Fatal(err, "")
	}

	b, _ := format.Node(file)
	os.WriteFile("out.cue", b, 0644)
}
{{< /highlight  >}}

which will write the following CUE file:

{{< highlight cue >}}
//  Package basic is just that: basic.
package basic

// This is my type.
MyType: {
	stringValue?: string @protobuf(1,name=string_value) // just any 'ole string

	//  A method must start with a capital letter.
	method?: [...string] @protobuf(2)
	method?: [...=~"^[A-Z]"]
}
{{< /highlight  >}}

Field types and constraints are written separately.
This is fine, CUE will just merge them.


### Extract CUE from multiple interdependent `.proto` files

In a large setting one may find the need to import multiple `.proto` files
that map to various different CUE packages within the same module
(similar to Go packages and modules),
importing each other and `.proto` files from other locations.
This is where things can get hairy.

Package [`cuelang.org/go/encoding/protobuf`](https://pkg.go.dev/cuelang.org/go/encoding/protobuf)
can be configured to deal with these situations.
For `.proto` files that have a `go_package` directive, it will use this path.
If it maps to a package within the CUE module will be generated within the
respective directory.
Otherwise, or if there is no Go package defined,
it will map to a location in the `pkg` directory.
