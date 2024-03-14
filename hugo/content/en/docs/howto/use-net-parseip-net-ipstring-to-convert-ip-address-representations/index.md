---
title: Using "net.ParseIP" and "net.IPString" to convert between IP address representations
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in functions
[`net.ParseIP`](https://pkg.go.dev/cuelang.org/go/pkg/net#ParseIP) and
[`net.IPString`](https://pkg.go.dev/cuelang.org/go/pkg/net#IPString)
to convert IPv4 and IPv6 addresses between their canonical string and
list-of-bytes representations.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

import "net"

v4String: "198.51.100.14"
v6String: "2001:db8:85a3::8a2e:370:7334"

// Use net.ParseIP to convert IP addresses from strings to lists of bytes.
v4Bytes: net.ParseIP(v4String)
v6Bytes: net.ParseIP(v6String)

// Use net.IPString to convert IP addresses from lists of bytes to strings.
// Notice that we're assigning net.IPString's output to the same field names we
// started with, above. By performing this cross-check we confirm that
// net.IPString and net.ParseIP both act as the inverse function of the other.
v4String: net.IPString(v4Bytes)
v6String: net.IPString(v6Bytes)
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV2YWw=" >}}
$ cue eval
v4String: "198.51.100.14"
v6String: "2001:db8:85a3::8a2e:370:7334"
v4Bytes: [198, 51, 100, 14]
v6Bytes: [32, 1, 13, 184, 133, 163, 0, 0, 0, 0, 138, 46, 3, 112, 115, 52]
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The [`net`](https://pkg.go.dev/cuelang.org/go/pkg/net) built-in package
