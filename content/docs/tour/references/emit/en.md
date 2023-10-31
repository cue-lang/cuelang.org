---
title: "Emit Values"
weight: 4
---

By default all top-level fields are emitted when evaluating a configuration.
Embedding a value at top-level will cause that value to be emitted instead.

Emit values allow CUE configurations, like JSON,
to define any type, instead of just structs, while keeping the common case
of defining structs light.

{{{with code "en" "emit"}}}
exec cue export emit.cue
cmp stdout result.txt
-- emit.cue --
"Hello \(#who)!"

#who: "world"
-- result.txt --
"Hello world!"
{{{end}}}
