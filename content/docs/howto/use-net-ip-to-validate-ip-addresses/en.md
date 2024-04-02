---
title: Using "net.IP" to validate IP addresses
tags:
- commented cue
authors:
- jpluscplusm
toc_hide: true
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use the built-in function
[`net.IP`](https://pkg.go.dev/cuelang.org/go/pkg/net#IP)
to check that values represent valid IPv4 or IPv6 addresses as strings or lists
of bytes.

{{{with code "en" "cc"}}}
#location top bottom

! exec cue vet
cmp stderr out
-- file.cue --
package example

import "net"

// All top-level fields must represent valid IP addresses.
[_]: net.IP

// These fields represent the same valid IPv4 address.
v4String: "198.51.100.14"
v4Bytes: [198, 51, 100, 14]

// These fields represent the same valid IPv6 address.
v6StringFull:  "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
v6StringShort: "2001:0db8:85a3::8a2e:0370:7334"
v6Bytes: [32, 1, 13, 184, 133, 163, 0, 0, 1, 0, 138, 46, 3, 112, 115, 52]

// Some invalid IP addresses.
v4TooManyOctets: "198.51.100.14.0"
v4OctetTooLarge: [300, 51, 100, 14]
v6ByteTooLarge: [300, 1, 13, 184, 133, 163, 0, 0, 1, 0, 138, 46, 3, 112, 115, 52]
-- out --
v4OctetTooLarge: invalid value [300,51,100,14] (does not satisfy net.IP):
    ./file.cue:6:6
    ./file.cue:19:18
v4TooManyOctets: invalid value "198.51.100.14.0" (does not satisfy net.IP):
    ./file.cue:6:6
    ./file.cue:18:18
v6ByteTooLarge: invalid value [300,1,13,184,133,163,0,0,1,0,138,46,3,112,115,52] (does not satisfy net.IP):
    ./file.cue:6:6
    ./file.cue:20:17
{{{end}}}

## Related content

- The [`net`](https://pkg.go.dev/cuelang.org/go/pkg/net) built-in package
- {{< linkto/related/howto "use-net-ipv4-to-validate-ipv4-addresses" >}}
- {{< linkto/related/howto "use-net-ipcidr-to-validate-ip-cidr-ranges" >}}
