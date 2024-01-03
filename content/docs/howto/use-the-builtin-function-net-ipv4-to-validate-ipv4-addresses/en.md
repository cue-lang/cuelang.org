---
title: Using the builtin function "net.IPv4" to validate IPv4 addresses
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the builtin function `net.IPv4` to check that values
represent valid IPv4 addresses as strings or lists of bytes.

{{{with code "en" "cc"}}}
! exec cue vet
cmp stderr out
-- file.cue --
package example

import "net"

v4ValidString: "198.51.100.14" & net.IPv4
v4ValidBytes: [198, 51, 100, 14] & net.IPv4

v4TooManyOctets: "198.51.100.14.0" & net.IPv4
v4OctetTooLarge: [300, 51, 100, 14] & net.IPv4
v6Notv4: "2001:0db8:85a3::8a2e:0370:7334"
v6Notv4: net.IPv4
-- out --
v4OctetTooLarge: invalid value [300,51,100,14] (does not satisfy net.IPv4):
    ./file.cue:9:18
v4TooManyOctets: invalid value "198.51.100.14.0" (does not satisfy net.IPv4):
    ./file.cue:8:18
v6Notv4: invalid value "2001:0db8:85a3::8a2e:0370:7334" (does not satisfy net.IPv4):
    ./file.cue:10:10
    ./file.cue:11:10
{{{end}}}

## Related content

- The [`net`](https://pkg.go.dev/cuelang.org/go/pkg/net) builtin package
- [Using the builtin function "net.IP" to validate IP addresses]({{< relref
    "use-the-builtin-function-net-ip-to-validate-ip-addresses"
  >}})
- [Using the builtin function "net.IPCIDR" to validate IP CIDR ranges]({{< relref
    "use-the-builtin-function-net-ipcidr-to-validate-ip-cidr-ranges"
  >}})
