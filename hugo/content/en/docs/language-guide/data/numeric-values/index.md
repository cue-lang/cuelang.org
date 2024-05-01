---
title: Numeric values
weight: 30
draft: false
---

CUE extends JSON numerals with:

- SI suffixes, such as 5M, and 1.5Ti,
- `_` to separate number groupings, such as `1_000_000`
- hexadecimal numbers `0x51`
- octal numbers `0o755`
- binary numbers `0b0101_0001`

## SI Suffixes

Numbers can have SI suffixes to express large numbers more compactly.
It is also possible to use a suffix with a fraction, in which case the result
gets rounded down to the nearest whole number.

| Decimal Suffix | Value | Binary Suffix | Value |
| --- | --- | --- | --- |
| 1K | 1000 | 1Ki | 1024 |
| 1M | 1_000_000 | 1Mi | 1_048_576 |
| 1G | 1_000_000_000 | 1Gi | 1_073_741_824 |
| 1T | 1e12 | 1Ti | 1_099_511_627_776 |
| 1P | 1e15 | 1Pi | 1_125_899_906_842_624 |

Note that `k` is written as `K` instead.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
a: 1_000_000
b: 1M
c: 1Mi
{{< /code-tab >}}
{{< code-tab name="JSON" language="json" area="top-right" type="terminal" >}}
{
    "a": 1000000,
    "b": 1000000,
    "c": 1048576
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Numbers with a different base

CUE can represent numbers in bases other than decimal.

| Base | Prefix | Example | Value |
| --- | --- | --- | --- |
| Hexadecimal | 0x | 0xFF | 255 |
| Octal | 0o | 0o10 | 8 |
| Binary | 0b | 0b1111_1111 | 255 |

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue" area="top-left" >}}
o: 0o755
h: 0x00Dec0de
b: 0b0101_0001
{{< /code-tab >}}
{{< code-tab name="JSON" language="json" area="top-right" type="terminal" >}}
{
    "o": 493,
    "h": 14598366,
    "b": 81
}
{{< /code-tab >}}
{{< /code-tabs >}}

