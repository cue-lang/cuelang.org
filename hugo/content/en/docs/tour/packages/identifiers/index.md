---
title: Identifiers
weight: 30
---

Package **identifiers** either name a built-in package, provided by CUE, or
a user-defined package.
CUE's built-in packages provide its *standard library*, and are indexed
[here](https://pkg.go.dev/cuelang.org/go/pkg#pkg-overview).
User-defined packages contain schemas, policies, data, tools, abstractions ...
or anything else that can be encoded in CUE.
<!-- TODO: mention public sharing / private here? -->

{{< columns >}}

User-defined package identifiers start with a domain name, followed by an
optional path and/or an optional suffix.
Built-in package identifiers are recognizable because they *don't* start with a
domain name.

Nothing *inherently* links packages and their identifiers to the domain names
they mention.
If you need to select a package identifier it's good practice to choose one
that references a domain you control, or one that lives under a path you
control on a shared domain.

{{< columns-separator >}}

```cue { title="file.cue" }
package example

import (
	"strings"                  // built-in
	"github.com/cue-lang/cue"  // user-defined
	"example.test"             // user-defined
	"cue.example/some/path"    // user-defined
	"cue.test/path:someSuffix" // user-defined
	"list"                     // built-in
)

...
```

{{< /columns >}}
