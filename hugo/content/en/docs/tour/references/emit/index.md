---
title: "Emit Values"
weight: 4
---

By default all top-level fields are emitted when evaluating a configuration.
Embedding a value at top-level will cause that value to be emitted instead.

Emit values allow CUE configurations, like JSON,
to define any type, instead of just structs, while keeping the common case
of defining structs light.

{{< code-tabs >}}
{{< code-tab name="emit.cue" language="text"  area="top-left" >}}
"Hello \(#who)!"

#who: "world"
{{< /code-tab >}}
{{< code-tab name="result.txt" language="txt"  area="top-right" >}}
"Hello world!"
{{< /code-tab >}}
{{< /code-tabs >}}
