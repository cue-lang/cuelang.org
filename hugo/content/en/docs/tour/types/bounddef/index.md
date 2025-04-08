---
title: Predefined Bounds
weight: 140
---

CUE defines the following predefined identifiers to restrict the bounds of
integers to common values.\
The `u`-prefixed identifiers provide similar capabilities to unsigned integer
types in other languages.

```cue
uint:    >=0
uint8:   >=0 & <=255
int8:    >=-128 & <=127
uint16:  >=0 & <=65535
int16:   >=-32_768 & <=32_767
rune:    >=0 & <=0x10FFFF
uint32:  >=0 & <=4_294_967_295
int32:   >=-2_147_483_648 & <=2_147_483_647
uint64:  >=0 & <=18_446_744_073_709_551_615
int64:   >=-9_223_372_036_854_775_808 & <=9_223_372_036_854_775_807
int128:  >=-170_141_183_460_469_231_731_687_303_715_884_105_728 & <=170_141_183_460_469_231_731_687_303_715_884_105_727
uint128: >=0 & <=340_282_366_920_938_463_463_374_607_431_768_211_455
```

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
import "math"

a: uint & -1
b: uint8 & 256
c: int32 & math.Pow(2, 31) // 2^31
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldCAtYyBmaWxlLmN1ZQ==" >}}
$ cue vet -c file.cue
a: invalid value -1 (out of bound >=0):
    ./file.cue:3:11
b: invalid value 256 (out of bound <=255):
    ./file.cue:4:12
c: invalid value 2147483648 (out of bound <=2147483647):
    ./file.cue:5:12
{{< /code-tab >}}
{{< /code-tabs >}}
