---
title: Using the builtin function "net.IPCIDR" to validate IP CIDR ranges
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the builtin function `net.IPCIDR` to check that values
represent valid IPv4 or IPv6 addresses or subnets in
[CIDR notation](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation).

{{{with code "en" "cc"}}}
! exec cue vet 
cmp stderr out
-- file.cue --
package example

import "net"

valid: [_]: net.IPCIDR
valid: {
	v4Block:   "198.51.100.0/22"
	v4Address: "198.51.100.14/24"
	v6Block:   "2001:db8::/48"
	v6Address: "::1/128"
}

v4SubnetMaskTooLarge: "10.0.0.0/50" & net.IPCIDR
v6MalformedPrefix:    ":::1/128"
v6MalformedPrefix:    net.IPCIDR
-- out --
v4SubnetMaskTooLarge: invalid value "10.0.0.0/50" (does not satisfy net.IPCIDR): error in call to net.IPCIDR: invalid CIDR address: 10.0.0.0/50:
    ./file.cue:13:23
v6MalformedPrefix: invalid value ":::1/128" (does not satisfy net.IPCIDR): error in call to net.IPCIDR: invalid CIDR address: :::1/128:
    ./file.cue:14:23
    ./file.cue:15:23
{{{end}}}

## Related content

- The [`net`](https://pkg.go.dev/cuelang.org/go/pkg/net) builtin package
- [Using the builtin function "net.IP" to validate IP addresses]({{< relref
    "use-the-builtin-function-net-ip-to-validate-ip-addresses"
  >}})
- [Using the builtin function "net.IPv4" to validate IPv4 addresses]({{< relref
    "use-the-builtin-function-net-ipv4-to-validate-ipv4-addresses"
  >}})
