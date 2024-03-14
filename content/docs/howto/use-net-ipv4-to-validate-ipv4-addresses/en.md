---
title: Using "net.IPv4" to validate IPv4 addresses
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in function
[`net.IPv4`](https://pkg.go.dev/cuelang.org/go/pkg/net#IPv4)
to check that values represent valid IPv4 addresses as strings or lists of
bytes.

{{{with code "en" "cc"}}}
#location top bottom

! exec cue vet
cmp stderr out
-- file.cue --
package example

import "net"

// All top-level fields must represent valid IPv4 addresses.
[_]: net.IPv4

// These fields represent the same valid IPv4 address.
v4String: "198.51.100.14"
v4Bytes: [198, 51, 100, 14]

// Some invalid IPv4 addresses.
tooManyOctets: "198.51.100.14.0"
octetTooLarge: [300, 51, 100, 14]
v6NotV4: "2001:0db8:85a3::8a2e:0370:7334"
-- out --
octetTooLarge: invalid value [300,51,100,14] (does not satisfy net.IPv4):
    ./file.cue:6:6
    ./file.cue:14:16
tooManyOctets: invalid value "198.51.100.14.0" (does not satisfy net.IPv4):
    ./file.cue:6:6
    ./file.cue:13:16
v6NotV4: invalid value "2001:0db8:85a3::8a2e:0370:7334" (does not satisfy net.IPv4):
    ./file.cue:6:6
    ./file.cue:15:10
{{{end}}}

## Related content

- The [`net`](https://pkg.go.dev/cuelang.org/go/pkg/net) built-in package
- {{< linkto/related/howto "use-net-ip-to-validate-ip-addresses" >}}
- {{< linkto/related/howto "use-net-ipcidr-to-validate-ip-cidr-ranges" >}}
