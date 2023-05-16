---
title: Lists
weight: 70
draft: false
---

CUE lists are identical to JSON lists.

List elements are considered to be a special kind of data field, with elements indexed by their position.

{{< code-tabs >}}
{{< code-tab name="CUE" language="cue"  area="top-left" >}}
a: [1, 2]
"a": [1, 2, 3]
{{< /code-tab >}}
{{< code-tab name="CUE" language="cue" type="terminal" area="top-right" >}}
a: [1, 2, 3]
{{< /code-tab >}}
{{< /code-tabs >}}

<!-- TODO

a: 3: 4 // ok

a:  5: 6 // introduces gap.

<sidebar: CUE has a construct called associative lists which allows redefining how composition works>

<Reference: associative lists>

-->
