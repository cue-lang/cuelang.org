---
title: Emitting Values
weight: 40
---

By default all top-level fields are emitted when evaluating a configuration.
**Embedding** a value at the top-level causes that value to be emitted instead.

The ability to emit values allows CUE configurations to define any top-level
type alongside any data required by the top-level value.
This surpasses JSON's ability to encode top-level scalars and arrays, whilst
keeping CUE optimised for its most common use case: defining structs.

{{{with code "en" "tour"}}}
exec cue export file.cue --out text
cmp stdout out
-- file.cue --
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
-- out --
Hello, world!

Today is Wednesday, and there are only
299 days until 2025 ... 😄
{{{end}}}
