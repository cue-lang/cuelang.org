---
title: Using the built-in function "net.IPv4" to validate IPv4 addresses
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the built-in function `net.IPv4` to check that values
represent valid IPv4 addresses as strings or lists of bytes.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue"  area="top-left" >}}
package example

import "net"

v4ValidString: "198.51.100.14" & net.IPv4
v4ValidBytes: [198, 51, 100, 14] & net.IPv4

v4TooManyOctets: "198.51.100.14.0" & net.IPv4
v4OctetTooLarge: [300, 51, 100, 14] & net.IPv4
v6Notv4: "2001:0db8:85a3::8a2e:0370:7334"
v6Notv4: net.IPv4
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="top-right" >}}
$ cue vet
v4OctetTooLarge: invalid value [300,51,100,14] (does not satisfy net.IPv4):
    ./file.cue:9:18
v4TooManyOctets: invalid value "198.51.100.14.0" (does not satisfy net.IPv4):
    ./file.cue:8:18
v6Notv4: invalid value "2001:0db8:85a3::8a2e:0370:7334" (does not satisfy net.IPv4):
    ./file.cue:10:10
    ./file.cue:11:10
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The [`net`](https://pkg.go.dev/cuelang.org/go/pkg/net) built-in package
- [Using the built-in function "net.IP" to validate IP addresses]({{< relref
    "use-the-built-in-function-net-ip-to-validate-ip-addresses"
  >}})
- [Using the built-in function "net.IPCIDR" to validate IP CIDR ranges]({{< relref
    "use-the-built-in-function-net-ipcidr-to-validate-ip-cidr-ranges"
  >}})
