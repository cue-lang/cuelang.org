---
title: Emitting Values
weight: 40
---

By default all top-level fields are emitted when evaluating a configuration.
**Embedding** a value at the top level causes that value to be emitted instead.

The facility to emit values allows CUE configurations to define any type or
value at the top level, alongside any data used to construct that value.
This surpasses JSON's ability to encode top-level scalars and arrays, whilst
keeping CUE optimised for the most common use case: defining structs.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
"""
Hello, \(#.who)!

Today is \(#.day), and there are only
\(365-#.DoY) days until \(#.year+1) ... \(#.e)
"""

#: {
	who:  "world"
	day:  "Wednesday"
	year: 2024
	DoY:  66
	e:    "\U0001F604"
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZSAtLW91dCB0ZXh0" >}}
$ cue export file.cue --out text
Hello, world!

Today is Wednesday, and there are only
299 days until 2025 ... 😄
{{< /code-tab >}}
{{< /code-tabs >}}
