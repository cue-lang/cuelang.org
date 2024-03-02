---
title: Default Values
weight: 110
---

A disjunction's elements can be prefixed with the preference marker (`*`).

If there is only one mark,
or if unfication constrains a field sufficiently so that only one mark remains,
then that value is the default value.
CUE will select and use the default value when a concrete value is required
but none has been explicitly specified.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
a: int | *1 // a single default is selected.

// b's two defaults are incompatible, so neither
// is selected.
b: *2 | 99
b: *99 | 2

// c's three defaults are incompatible, but two
// of them are excluded by the final disjunction
// so the only remaining default is selected.
c: *1 | 2 | 3 | 4
c: 1 | *2 | 3 | 4
c: 1 | 2 | *3 | 4
c: 3 | 4
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV2YWwgZmlsZS5jdWU=" >}}
$ cue eval file.cue
a: 1
b: 2 | 99
c: 3
{{< /code-tab >}}
{{< /code-tabs >}}
