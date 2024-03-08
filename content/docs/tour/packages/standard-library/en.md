---
title: Standard Library
weight: 30
---

The CUE **standard library** is always available for use through an `import` statement.

CUE comes with a fully featured set of built-in packages containing functions
that perform a wide array of deterministic tasks.
The
[standard library package overview](https://pkg.go.dev/cuelang.org/go/pkg#pkg-overview)
links to details and examples for each package.

Some commonly used packages include:

- [`list`](https://pkg.go.dev/cuelang.org/go/pkg/list#section-documentation):
  functions for manipulating and examining lists
- [`strings`](https://pkg.go.dev/cuelang.org/go/pkg/strings#section-documentation):
  functions for manipulating UTF-8 encoded strings
- [`regexp`](https://pkg.go.dev/cuelang.org/go/pkg/regexp#section-documentation):
  regular expression search
- [`math`](https://pkg.go.dev/cuelang.org/go/pkg/math#section-documentation):
  standard mathematical functions and constants
- [`encoding/base64`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/base64#section-documentation):
  functions for encoding and decoding data in the RFC4648 Base64 encoding scheme
- [`encoding/json`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/json#section-documentation) &
  [`encoding/yaml`](https://pkg.go.dev/cuelang.org/go/pkg/encoding/yaml#section-documentation):
  functions for encoding, decoding, and validating data stored as JSON and YAML

Many of the standard library's functions are also demonstrated in
[how-to guides]({{< relref "docs/howto" >}}),
here on cuelang.org.
<!-- TODO: change link when pages are tagged with a stdlib tag -->
