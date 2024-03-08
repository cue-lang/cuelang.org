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

User-defined package identifiers resemble URLs, starting with a domain name
and followed by an optional path and/or an optional suffix.
Built-in package identifiers are recognizable because they *don't* start with a
domain name.

Nothing *inherently* links identifiers to the domains they mention.
If you define a CUE module, as explained shortly, it's good practice to choose
an identifier under a domain that you control, or a path you control under a
shared domain.

```cue
package example

import (
	"strings"                       // built-in
	"github.com/cue-lang/cue"       // user-defined
	"example.test"                  // user-defined
	"cue.example/some/path"         // user-defined
	"cue.test/some/path:someSuffix" // user-defined
	"list"                          // built-in
)

...
```
