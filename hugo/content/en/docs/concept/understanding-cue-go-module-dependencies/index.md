---
title: Understanding CUE's Go module dependencies
authors: [rogpeppe]
tags: [go api]
toc_hide: true
---

This guide explains why certain dependencies appear in a Go module graph when
using the CUE API. It provides conceptual clarity around how Go's module system
interacts with CUE packages, the meaning of module dependencies, and how to
interpret module graph output. It is intended for users exploring or embedding
the CUE language in their Go programs.

<!--more-->

## Overview: Why This Matters

When you add CUE packages like `cuelang.org/go/cue`, `cue/cuecontext`, or
`cue/load` to your Go project, the resulting module graph may include a
surprising number of transitive dependencies. Some of these arise only due to
tests or tools used during development and are not part of the code your
program will actually use. Understanding the difference is essential for:

* Auditing your dependencies
* Minimizing bloat
* Evaluating security risks

## The Go Module System: A Quick Recap

* The `go.mod` file: lists required modules for building and testing packages
  in your main module.
* The `go.sum` file: records checksums for all modules needed to build and test
  all packages, including transitive dependencies.

As a result, modules that only appear in `go.sum` but not `go.mod` often exist
solely to satisfy transitive test dependencies. These are not part of your
program’s actual runtime.

{{<info>}}
### Key insight:
Just because a module appears in the dependency graph doesn’t mean it’s part of
your program’s trusted runtime.
{{</info>}}

## Dependency Graphs by CUE Usage Level

In this section we'll show some of the module dependencies that are pulled in
and explain why they're present.
In each diagram:

- The green "example" box represents **your module**: the root of the
  dependency tree.
- Boxes in purple are the **core dependencies of your module**: code in these
  modules can be executed when running your module's actual code or tests.
  These modules will appear in your `go.mod` file.
- Boxes in red highlight modules pulled in **only for testing external
  packages**. They inflate the graph but not the runtime or security surface
  area; they will appear in the `go.sum` file but *not* the `go.mod` file.

### When importing `cuelang.org/go/cue/cuecontext`

```go
package example

import _ "cuelang.org/go/cue/cuecontext"
```

- Includes the CUE evaluator and standard library.
- Adds standard library definitions (such as for JSON/YAML encoding/decoding,
  math functions).

{{< mermaid caption="Importing cuelang.org/go/cue/cuecontext" >}}
graph LR
    N0["cuelabs.dev/go/oci/ociregistry"]
    N1["cuelang.org/go"]
    N2["example"]
    N3["github.com/cockroachdb/apd/v3"]
    N4["github.com/emicklei/proto"]
    N5["github.com/go-quicktest/qt"]
    N6["github.com/google/go-cmp"]
    N7["github.com/google/uuid"]
    N8["github.com/kr/pretty"]
    N9["github.com/kr/text"]
    N10["github.com/mitchellh/go-wordwrap"]
    N11["github.com/opencontainers/go-digest"]
    N12["github.com/opencontainers/image-spec"]
    N13["github.com/pelletier/go-toml/v2"]
    N14["github.com/protocolbuffers/txtpbfmt"]
    N15["github.com/rogpeppe/go-internal"]
    N16["golang.org/x/mod"]
    N17["golang.org/x/net"]
    N18["golang.org/x/oauth2"]
    N19["golang.org/x/sync"]
    N20["golang.org/x/text"]
    N21["golang.org/x/tools"]
    N22["gopkg.in/check.v1"]
    N23["gopkg.in/yaml.v3"]
    N0 --> N11
    N0 --> N12
    N1 --> N0
    N1 --> N3
    N1 --> N4
    N1 --> N5
    N1 --> N6
    N1 --> N7
    N1 --> N11
    N1 --> N12
    N1 --> N13
    N1 --> N14
    N1 --> N15
    N1 --> N16
    N1 --> N17
    N1 --> N18
    N1 --> N19
    N1 --> N20
    N1 --> N21
    N1 --> N23
    N2 --> N1
    N5 --> N6
    N5 --> N8
    N8 --> N9
    N8 --> N15
    N12 --> N11
    N14 --> N10
    N17 --> N20
    N21 --> N16
    N21 --> N19
    N22 --> N8
    N23 --> N22
    classDef red fill:#ffdddd,stroke:#333,stroke-width:1px;
    class N0,N4,N5,N6,N8,N9,N10,N11,N12,N14,N15,N18,N19,N21,N22 red;
    classDef green fill:#ddffdd,stroke:#333,stroke-width:1px;
    class N2 green;
{{< /mermaid >}}

### When importing `cuelang.org/go/cue/load`

```go
package example

import _ "cuelang.org/go/cue/load"
```

- Includes compiler, file loading logic, and schema resolution.
- The largest footprint; includes encoding and parser dependencies.

{{< mermaid caption="Importing cuelang.org/go/cue/load" >}}
graph LR
    N0["cuelabs.dev/go/oci/ociregistry"]
    N1["cuelang.org/go"]
    N2["example"]
    N3["github.com/cockroachdb/apd/v3"]
    N4["github.com/emicklei/proto"]
    N5["github.com/go-quicktest/qt"]
    N6["github.com/google/go-cmp"]
    N7["github.com/google/uuid"]
    N8["github.com/kr/pretty"]
    N9["github.com/kr/text"]
    N10["github.com/kylelemons/godebug"]
    N11["github.com/mitchellh/go-wordwrap"]
    N12["github.com/opencontainers/go-digest"]
    N13["github.com/opencontainers/image-spec"]
    N14["github.com/pelletier/go-toml/v2"]
    N15["github.com/protocolbuffers/txtpbfmt"]
    N16["github.com/rogpeppe/go-internal"]
    N17["golang.org/x/mod"]
    N18["golang.org/x/net"]
    N19["golang.org/x/oauth2"]
    N20["golang.org/x/sync"]
    N21["golang.org/x/text"]
    N22["golang.org/x/tools"]
    N23["gopkg.in/check.v1"]
    N24["gopkg.in/yaml.v3"]
    N0 --> N5
    N0 --> N12
    N0 --> N13
    N0 --> N16
    N1 --> N0
    N1 --> N3
    N1 --> N4
    N1 --> N5
    N1 --> N6
    N1 --> N7
    N1 --> N12
    N1 --> N13
    N1 --> N14
    N1 --> N15
    N1 --> N16
    N1 --> N17
    N1 --> N18
    N1 --> N19
    N1 --> N20
    N1 --> N21
    N1 --> N22
    N1 --> N24
    N2 --> N1
    N5 --> N6
    N5 --> N8
    N8 --> N9
    N8 --> N16
    N13 --> N12
    N15 --> N6
    N15 --> N10
    N15 --> N11
    N16 --> N22
    N18 --> N21
    N19 --> N6
    N22 --> N17
    N22 --> N20
    N23 --> N8
    N24 --> N23
    classDef red fill:#ffdddd,stroke:#333,stroke-width:1px;
    class N5,N6,N8,N9,N10,N22,N23 red;
    classDef green fill:#ddffdd,stroke:#333,stroke-width:1px;
    class N2 green;
{{< /mermaid >}}

## Mitigations and Future Directions

We recognize that the current design may lead to dependency noise. For example,
if all you are doing is compiling CUE which does not marshal or unmarshal YAML,
it should be possible to evaluate it without using a YAML dependency. Several
mitigations are either planned or under consideration:

### Lean Construction API

We could add a constructor for a bare `*cue.Context` that would avoid standard
library dependencies.

* Useful for simple validation and evaluation tasks that do not need the CUE
  standard library.
* Trivially implemented without radically changing the existing CUE API.

This is what a minimal dependency graph looks like that only imports
`cuelang.org/go/cue`:

{{< mermaid caption="Minimal dependency graph (not yet implemented)" >}}
graph LR
    N0["cuelabs.dev/go/oci/ociregistry"]
    N1["cuelang.org/go"]
    N2["example"]
    N3["github.com/cockroachdb/apd/v3"]
    N4["github.com/emicklei/proto"]
    N5["github.com/go-quicktest/qt"]
    N6["github.com/google/go-cmp"]
    N7["github.com/google/uuid"]
    N8["github.com/kr/pretty"]
    N9["github.com/kr/text"]
    N10["github.com/mitchellh/go-wordwrap"]
    N11["github.com/opencontainers/go-digest"]
    N12["github.com/opencontainers/image-spec"]
    N13["github.com/pelletier/go-toml/v2"]
    N14["github.com/protocolbuffers/txtpbfmt"]
    N15["github.com/rogpeppe/go-internal"]
    N16["golang.org/x/mod"]
    N17["golang.org/x/net"]
    N18["golang.org/x/oauth2"]
    N19["golang.org/x/sync"]
    N20["golang.org/x/text"]
    N21["golang.org/x/tools"]
    N22["gopkg.in/yaml.v3"]
    N0 --> N11
    N0 --> N12
    N1 --> N0
    N1 --> N3
    N1 --> N4
    N1 --> N5
    N1 --> N6
    N1 --> N7
    N1 --> N11
    N1 --> N12
    N1 --> N13
    N1 --> N14
    N1 --> N15
    N1 --> N17
    N1 --> N18
    N1 --> N19
    N1 --> N20
    N1 --> N21
    N1 --> N22
    N2 --> N1
    N5 --> N6
    N5 --> N8
    N8 --> N9
    N8 --> N15
    N12 --> N11
    N14 --> N10
    N17 --> N20
    N21 --> N16
    N21 --> N19
    classDef red fill:#ffdddd,stroke:#333,stroke-width:1px;
    class N0,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N19,N21,N22 red;
    classDef green fill:#ddffdd,stroke:#333,stroke-width:1px;
    class N2 green;
{{< /mermaid >}}

### Pluggable Loader Redesign

* A future API may support dependency injection, including redesigning
  [cue/load](https://pkg.go.dev/cuelang.org/go/cue/load) and a potential
  replacement for the
  [cue/cuecontext](https://pkg.go.dev/cuelang.org/go/cue/context) package.
* This would enable custom encoders and limit included dependencies to just
  what's needed.
* Tracked in {{<issue 3911/>}}.

## Final Thoughts

The Go module system offers deterministic builds and strong integrity
guarantees, but its all-encompassing view of test and tool dependencies can be
misleading when assessing runtime requirements. This guide aims to help you
discern what's necessary and what's incidental, and to look forward to a more
modular future for CUE.

{{<info>}}
### Key takeaways:
* Review your `go.mod` file for dependencies that will be added to your
  program/service.
* Remember that not all packages in these modules will necessarily be used.
* Do not be overly concerned by entries in `go.sum` itself.
{{</info>}}
