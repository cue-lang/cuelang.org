---
title: "Working with incomplete CUE"
toc_hide: true
authors: [myitcv, jpluscplusm]
tags: [go api]
---

In general, CUE can handle references to fields that don't yet exist, or where
a value can't be calculated because there's insufficient information.
CUE that contains such references or values is referred to as *incomplete* CUE
 -- but only if it's otherwise *valid* CUE.

Here's an example of incomplete CUE. The value of `connectionString` can't be
calculated given the information in `database.cue` alone because the value of
the `password` field isn't concrete - it's only a `string` constraint.

{{< code-tabs >}}
{{< code-tab name="database.cue" language="cue" area="top-left" >}}
package database

connectionString: "\(system)://\(user):\(password)@\(host):\(port)/\(database)"

system:   "postgres"
host:     "prod.db.example.com"
user:     "alex"
port:     "5432"
database: "transactions"
password: string
{{< /code-tab >}}{{< /code-tabs >}}

CUE allows evaluations to be augmented by extra information introduced through
{{<linkto/inline "tour/basics/unification" >}}.
If we introduce information into an evaluation of the `database.cue` file and
provide a concrete `string` value for the `password` field then the value of
the `connectionString` field can be calculated.
But until that happens, this otherwise valid CUE is referred to as "incomplete"
because it doesn't contain sufficient information to permit a complete
evaluation by itself.

Note that because incomplete CUE is valid CUE it *can* be evaluated ...

<!-- TODO(jcm): replace eval with vet (x1? x2?) if the resolution of
https://cuelang.org/issue/2120 permits. -->
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV2YWwgZGF0YWJhc2UuY3Vl" }
$ cue eval database.cue
connectionString: "\(system)://\(user):\(password)@\(host):\(port)/\(database)"
system:           "postgres"
host:             "prod.db.example.com"
user:             "alex"
port:             "5432"
database:         "transactions"
password:         string
```

... but it *can't* be exported:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCBkYXRhYmFzZS5jdWU=" }
$ cue export database.cue
password: incomplete value string:
    ./database.cue:10:11
connectionString: invalid interpolation: non-concrete value string (type string):
    ./database.cue:3:19
    ./database.cue:10:11
```

A configuration that results in incomplete values can be made *complete* by
unifying it with the right information. This means that every field that
contributes to the emitted configuration must be able to be resolved to a
concrete value.

Here's some YAML data that will do this for our example and "fill in the gaps"
in our incomplete CUE by providing the `password` secret:

{{< code-tabs >}}
{{< code-tab name="secrets.yaml" language="yaml" area="top-left" >}}
password: "Ch^ngeMeBef0r3GoL!ve"
{{< /code-tab >}}{{< /code-tabs >}}

Unifying our incomplete CUE with this data makes the configuration complete,
and allows us to export the result:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydCBkYXRhYmFzZS5jdWUgc2VjcmV0cy55YW1sCmN1ZSBleHBvcnQgZGF0YWJhc2UuY3VlIHNlY3JldHMueWFtbCAtZSBjb25uZWN0aW9uU3RyaW5n" }
$ cue export database.cue secrets.yaml
{
    "connectionString": "postgres://alex:Ch^ngeMeBef0r3GoL!ve@prod.db.example.com:5432/transactions",
    "system": "postgres",
    "host": "prod.db.example.com",
    "user": "alex",
    "port": "5432",
    "database": "transactions",
    "password": "Ch^ngeMeBef0r3GoL!ve"
}

# Export just the data source name as a text value.
$ cue export database.cue secrets.yaml -e connectionString
"postgres://alex:Ch^ngeMeBef0r3GoL!ve@prod.db.example.com:5432/transactions"
```

### Using the Go API

The Go API is also able to handle incomplete CUE.

To demonstrate the Go API in action we start by initializing a Go module:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gbW9kIGluaXQgZ28uZXhhbXBsZQ==" }
$ go mod init go.example
...
```

We place this example Go code in `main.go`.
Comments explain what is being done at each step.

{{< code-tabs >}}
{{< code-tab name="main.go" language="go" area="top-left" >}}
package main

import (
	"fmt"
	"log"

	"cuelang.org/go/cue"
	"cuelang.org/go/cue/cuecontext"
	"cuelang.org/go/cue/load"
	"cuelang.org/go/encoding/yaml"
)

func main() {
	ctx := cuecontext.New()

	// Step #1: load the CUE package in the current directory.
	// It contains a single file - "database.cue", as shown above.
	bis := load.Instances([]string{"."}, nil)
	step1 := ctx.BuildInstance(bis[0])
	fmt.Printf("step1: %v\n", step1)

	// Step #2: load the "secrets.yaml" file shown above.
	step2File, err := yaml.Extract("secrets.yaml", nil)
	if err != nil {
		log.Fatal(err)
	}
	step2 := ctx.BuildFile(step2File)
	fmt.Printf("step2: %v\n", step2)

	// Ensure that the result of unifying the two steps is both
	// valid and concrete - and thus could be exported as data:
	result := step1.Unify(step2)
	if err := result.Validate(cue.Concrete(true)); err != nil {
		log.Fatal(err)
	}

	// Display the resulting CUE:
	fmt.Printf("result: %v\n", result)
}
{{< /code-tab >}}{{< /code-tabs >}}

We fetch the latest version of CUE, and tidy our Go module:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gZ2V0IGN1ZWxhbmcub3JnL2dvQHYwLjEyLjEKZ28gbW9kIHRpZHk=" }
$ go get cuelang.org/go@v0.12.1
...
$ go mod tidy
...
```

When we run our Go code, it behaves the same as the `cue export` command above
\- except that it *also* displays the interim `step1` and `step2` values:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gcnVuIC4=" }
$ go run .
step1: {
	connectionString: "\(system)://\(user):\(password)@\(host):\(port)/\(database)"
	system:           "postgres"
	host:             "prod.db.example.com"
	user:             "alex"
	port:             "5432"
	database:         "transactions"
	password:         string
}
step2: {
	password: "Ch^ngeMeBef0r3GoL!ve"
}
result: {
	connectionString: "postgres://alex:Ch^ngeMeBef0r3GoL!ve@prod.db.example.com:5432/transactions"
	system:           "postgres"
	host:             "prod.db.example.com"
	user:             "alex"
	port:             "5432"
	database:         "transactions"
	password:         "Ch^ngeMeBef0r3GoL!ve"
}
```
## Related content

- Tag: {{<tag "go api">}} -- Guides exploring CUE's Go API
