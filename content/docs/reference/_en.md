---
title: References
weight: 100
toc_hide: false
---

## Language Specification

The source of truth of how the CUE language should behave is encoded in
[The CUE Language Specification]({{< relref "spec" >}}).

## API References

The CUE Go APIs in the main repo are organized as follows:

- [**cmd**](https://pkg.go.dev/cuelang.org/go/cmd):
  The CUE command line tool.
- [**cue**](https://pkg.go.dev/cuelang.org/go/cue):
  core APIs related to parsing, formatting, loading and running CUE programs.
  These packages are used by all other packages, including the command line tool.
- [**encoding**](https://pkg.go.dev/cuelang.org/go/encoding):
  Packages for converting to and from CUE, including adaptors for YAML, JSON,
  Go, Protobuf, and OpenAPI.
- [**pkg**](https://pkg.go.dev/cuelang.org/go/pkg):
  Builtin packages that are available from within _CUE_ programs.
  These are typically not used in Go code.

## Contributing to CUE

CUE maintains both a
[Gerrit](https://review.gerrithub.io/q/project:cue-lang/cuelang.org) and
[Github](https://github.com/cue-lang/cue) repository.
The Gerrit repository is the source of truth, but changes are accepted
in both repositories.

See the [Contribution Guide]({{< relref "contribution-guidelines" >}})
for more details on how to contribute in line with the project's
[Code of Conduct]({{< relref "code-of-conduct" >}}).

## Available Reference Documents
