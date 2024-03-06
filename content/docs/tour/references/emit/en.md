---
title: Emitting Values
weight: 40
---

By default all top-level fields are emitted when evaluating a configuration.
**Embedding** a value at the top level causes that value to be emitted instead.

This allows CUE configurations to define any type or value at the top level
(just like JSON), whilst keeping CUE optimised for the most common use case of
defining structs.

{{{with code "en" "tour"}}}
exec cue export file.cue
cmp stdout out
-- file.cue --
"Hello, \(#who)!"

#who: "world"
-- out --
"Hello, world!"
{{{end}}}
