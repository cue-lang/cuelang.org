---
title: References
weight: 100
toc_hide: false
index_hide: true
---

{{< cards >}}
{{< card title="Language Specification" label="reference/spec" href="spec/" >}}
The **source of truth** for how the CUE language should behave
{{< /card >}}

<!-- The trailing "\" on the next line vertically aligns the card's body with the spec card's body -->
{{< card title="CLI Reference" label="reference/cli" href="cli/" >}}\
**Help texts** for each **`cue`** subcommand
{{< /card >}}

<!-- The trailing "\" on the next line vertically aligns the card's body with the spec card's body -->
{{< card title="Modules" label="reference/modules" href="modules/" >}}\
CUE's experimental **dependency management** system
{{< /card >}}

{{< card title="Glossary" label="reference/glossary" href="glossary/" >}}
Index and **glossary** of terms used by CUE
{{< /card >}}

{{< card title="Contributing to CUE" label="reference/contribution-guidelines" href="contribution-guidelines/" >}}
Guidance on **how to contribute** to the CUE project
{{< /card >}}

<!-- The space in "code-of- conduct" allows a line wrap which, for some reason, doesn't happen otherwise.
It's needed to avoid the "...conduct" text crashing into the label's chevron -->
{{< card title="Code of Conduct" label="reference/code-of- conduct" href="code-of-conduct/" >}}
The project's **values**, **standards**, **responsibilities**, and **processes**
{{< /card >}}
{{< /cards >}}

## External references

*Reference information published on other websites*.

{{< cards >}}


{{< card title="API: go/cue" label="pkg.go.dev" href="https://pkg.go.dev/cuelang.org/go/cue" >}}
**Core Go APIs** related to parsing, formatting, loading and running CUE programs.
Used by all other packages, including the `cue` command
{{< /card >}}

{{< card title="API: go/encoding" label="pkg.go.dev" href="https://pkg.go.dev/cuelang.org/go/encoding" >}}
Go APIs for **converting to and from CUE**.
Includes adaptors for YAML, JSON, Go, Protobuf, and OpenAPI
{{< /card >}}

{{< card title="API: go/cmd" label="pkg.go.dev" href="https://pkg.go.dev/cuelang.org/go/cmd" >}}
The Go API for the `cue` **comand line tool**
{{< /card >}}

{{< card title="Standard library" label="pkg.go.dev" href="https://pkg.go.dev/cuelang.org/go/pkg" >}}
Built-in packages **available to CUE code**.
Also available to Go code, but typically not used there
{{< /card >}}

{{< card title="cue-lang/cue" label="github.com" href="https://github.com/cue-lang/cue" >}}
The CUE project **issue tracker, and source code** for the CUE Go implementation
{{< /card >}}
{{< /cards >}}
