---
title: Using "net.IPCIDR" to validate IP CIDR ranges
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in function
[`net.IPCIDR`](https://pkg.go.dev/cuelang.org/go/pkg/net#IPCIDR)
to check that values represent valid IPv4 or IPv6 addresses or subnets in
[CIDR notation](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing#CIDR_notation).

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

import "net"

// All top-level fields must represent valid CIDR ranges.
[_]: net.IPCIDR

// Some valid CIDR ranges.
v4Block:   "198.51.100.0/22"
v4Address: "198.51.100.14/24"
v6Block:   "2001:db8::/48"
v6Address: "::1/128"

// Some invalid CIDR ranges.
v4SubnetMaskTooLarge: "10.0.0.0/50"
v6MalformedPrefix:    ":::1/128"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldA==" >}}
$ cue vet
v4SubnetMaskTooLarge: invalid value "10.0.0.0/50" (does not satisfy net.IPCIDR): error in call to net.IPCIDR: netip.ParsePrefix("10.0.0.0/50"): prefix length out of range:
    ./file.cue:6:6
    ./file.cue:15:23
v6MalformedPrefix: invalid value ":::1/128" (does not satisfy net.IPCIDR): error in call to net.IPCIDR: netip.ParsePrefix(":::1/128"): ParseAddr(":::1"): each colon-separated field must have at least one digit (at ":1"):
    ./file.cue:6:6
    ./file.cue:16:23
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- The [`net`](https://pkg.go.dev/cuelang.org/go/pkg/net) built-in package
- {{< linkto/related/howto "use-net-ip-to-validate-ip-addresses" >}}
- {{< linkto/related/howto "use-net-ipv4-to-validate-ipv4-addresses" >}}
