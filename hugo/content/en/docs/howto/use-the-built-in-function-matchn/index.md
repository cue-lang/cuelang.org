---
title: Using the built-in function "matchN" as a field validator
tags: [commented cue]
authors: [jpluscplusm]
toc_hide: true
---

{{<caution>}}
This guide demonstrates a CUE feature that isn't yet available in a release.
It is only available in the `cue` command and Go API when they are
[installed from source]({{< relref "/docs/introduction/installation" >}}#install-from-source)
using the `@master` version selector.
{{</caution>}}

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to use the
[built-in]({{< relref "docs/reference/glossary#built-in-functions" >}})
function `matchN()` as a field validator. This flexible function allows CUE
constraints to be bound together in a wide range of combinations, including
"one of", "any of", "all of", and "none of"/"not".

This guide uses the following unreleased version of CUE:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.11.0-0.dev.0.20240820111527-0a41a20985d3
...
```

## Basic use

The `matchN()` function takes two arguments:

1. a **number constraint**;
2. a **list of constraints**.

The function validates a field's value by unifying the value with each item in
the **list of constraints** in turn, and keeping count of how many list items
the field's value is able to unify with. A field's value is valid if the count
unifies successfully with the **number constraint**:

<!-- We use upload/script pairs because code blocks can't access non-default
versions of CUE cf. https://cuelang.org/issues/3265 -->
{{< code-tabs >}}
{{< code-tab name="basic.cue" language="cue" area="top-left" >}}
package basic

A: 42
// A validates successfully.
A: matchN(1, [int])
A: matchN(2, [int, >10])
A: matchN(2, [int, >10, >100])

B: 42
// B fails to validate.
B: matchN(1, [int, >10])
B: matchN(3, [int, >10, >100])
{{< /code-tab >}}{{< /code-tabs >}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAuOmJhc2lj" }
$ cue vet .:basic
B: invalid value 42 (does not satisfy matchN(1, [int,>10])): 2 matched, expected 1:
    ./basic.cue:11:4
    ./basic.cue:9:4
    ./basic.cue:11:11
    ./basic.cue:12:4
B: invalid value 42 (does not satisfy matchN(3, [int,>10,>100])): 2 matched, expected 3:
    ./basic.cue:12:4
    ./basic.cue:9:4
    ./basic.cue:11:4
    ./basic.cue:12:11
```

## "One of"

With its **number constraint** set to `1` the `matchN()` function checks that a
field's value unifies successfully with just one of the **list of
constraints**:

{{< code-tabs >}}
{{< code-tab name="one-of.cue" language="cue" area="top-left" >}}
package oneOf

A: 42
// A validates successfully.
A: matchN(1, [int])
A: matchN(1, [>10, >100, string])

B: 42
// B fails to validate.
B: matchN(1, [int, >10])
B: matchN(1, [string, >100])
{{< /code-tab >}}{{< /code-tabs >}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAuOm9uZU9m" }
$ cue vet .:oneOf
B: invalid value 42 (does not satisfy matchN(1, [string,>100])): 0 matched, expected 1:
    ./one-of.cue:11:4
    ./one-of.cue:8:4
    ./one-of.cue:10:4
    ./one-of.cue:11:11
```

## "Any of"

If the **number constraint** is set to `>0`, the function checks that at least
one of the **list of constraints** unifies with the field's value:

{{< code-tabs >}}
{{< code-tab name="any-of.cue" language="cue" area="top-left" >}}
package anyOf

A: 42
// A validates successfully.
A: matchN(>0, [>10])
A: matchN(>0, [int, >0, >100, string])

B: 42
// B fails to validate.
B: matchN(1, [int, >0])
B: matchN(>0, [string, >100])
{{< /code-tab >}}{{< /code-tabs >}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAuOmFueU9m" }
$ cue vet .:anyOf
B: invalid value 42 (does not satisfy matchN(1, [int,>0])): 2 matched, expected 1:
    ./any-of.cue:10:4
    ./any-of.cue:8:4
    ./any-of.cue:10:11
    ./any-of.cue:11:4
B: invalid value 42 (does not satisfy matchN(>0, [string,>100])): 0 matched, expected >0:
    ./any-of.cue:11:4
    ./any-of.cue:8:4
    ./any-of.cue:10:4
    ./any-of.cue:11:11
```

## "All of"

To check that a field's value unifies successfully with all of the **list of
constraints**, set the **number constraint** to a value matching the number of
items in the list:

{{< code-tabs >}}
{{< code-tab name="all-of.cue" language="cue" area="top-left" >}}
package allOf

import "math"

A: 42
// A validates successfully.
A: matchN(1, [int])
A: matchN(2, [int, >10])
A: matchN(4, [int, >10, <100, math.MultipleOf(2)])

B: 42
// B fails to validate.
B: matchN(3, [int, >10, >100])
B: matchN(4, [int, >10, <100, math.MultipleOf(41)])
{{< /code-tab >}}{{< /code-tabs >}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAuOmFsbE9m" }
$ cue vet .:allOf
B: invalid value 42 (does not satisfy matchN(3, [int,>10,>100])): 2 matched, expected 3:
    ./all-of.cue:13:4
    ./all-of.cue:11:4
    ./all-of.cue:13:11
    ./all-of.cue:14:4
B: invalid value 42 (does not satisfy matchN(4, [int,>10,<100,math.MultipleOf(41)])): 3 matched, expected 4:
    ./all-of.cue:14:4
    ./all-of.cue:11:4
    ./all-of.cue:13:4
    ./all-of.cue:14:11
```

## "Not"

If you set the **number constraint** to `0` then `matchN()` checks that a
field's value doesn't unify successfully with any of the **list of
constraints**:

{{< code-tabs >}}
{{< code-tab name="not.cue" language="cue" area="top-left" >}}
package not

import (
	"strings"
	"struct"
)

A: 42
// A validates successfully.
A: matchN(0, [string])
A: matchN(0, [bytes, struct.MinFields(0)])
A: matchN(0, [>100, strings.HasPrefix("4")])

B: 42
// B fails to validate.
B: matchN(0, [int])
B: matchN(0, [string, number])
B: matchN(0, [42, >100, strings.HasSuffix(2)])
{{< /code-tab >}}{{< /code-tabs >}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAuOm5vdA==" }
$ cue vet .:not
B: invalid value 42 (does not satisfy matchN(0, [int])): 1 matched, expected 0:
    ./not.cue:16:4
    ./not.cue:14:4
    ./not.cue:16:11
    ./not.cue:17:4
    ./not.cue:18:4
B: invalid value 42 (does not satisfy matchN(0, [string,number])): 1 matched, expected 0:
    ./not.cue:17:4
    ./not.cue:14:4
    ./not.cue:16:4
    ./not.cue:17:11
    ./not.cue:18:4
B: invalid value 42 (does not satisfy matchN(0, [42,>100,strings.HasSuffix(2)])): 1 matched, expected 0:
    ./not.cue:18:4
    ./not.cue:14:4
    ./not.cue:16:4
    ./not.cue:17:4
    ./not.cue:18:11
```

## More complex uses

### References

Either argument to `matchN()` can be resolved through a reference:

{{< code-tabs >}}
{{< code-tab name="all-but-one.cue" language="cue" area="top-left" >}}
package allButOne

// A validates successfully.
A: 42
A: matchN(len(#C)-1, #C)

// B fails to validate.
B: 42.0
B: matchN(len(#C)-1, #C)

#C: [number, int, >100]
{{< /code-tab >}}{{< /code-tabs >}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAuOmFsbEJ1dE9uZQ==" }
$ cue vet .:allButOne
B: invalid value 42.0 (does not satisfy matchN(2, [number,int,>100])): 1 matched, expected 2:
    ./all-but-one.cue:9:4
    ./all-but-one.cue:8:4
    ./all-but-one.cue:9:11
```

### Composite data structures

The `matchN()` function can validate composite data structures, not just
primitive values. Use it with both structs and lists:

{{< code-tabs >}}
{{< code-tab name="composite.cue" language="cue" area="top-left" >}}
package composite

// A validates successfully.
A: matchN(>0, [#C1, #C2]) & {
	x: 42
	y: "42"
}
// B fails to validate.
B: matchN(>0, [#C1, #C2]) & {
	x: "4.2"
	y: "4.2"
	z: "4.2"
}
#C1: {x: int, ...}
#C2: {
	z: float
	y: string
	...
}

// D validates successfully.
D: [1, 2, 3] & matchN(1, [#F1, #F2, #F3])
// E fails to validate.
E: [11, 12, 13] & matchN(1, [#F1, #F2, #F3])
#F1: [...>0]
#F2: [...>10]
#F3: [...>100]
{{< /code-tab >}}{{< /code-tabs >}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAuOmNvbXBvc2l0ZQ==" }
$ cue vet .:composite
B: invalid value {x:"4.2",y:"4.2",z:"4.2"} (does not satisfy matchN(>0, [{x:int},{z:float,y:string}])): 0 matched, expected >0:
    ./composite.cue:9:4
    ./composite.cue:9:11
E: invalid value [11,12,13] (does not satisfy matchN(1, [[],[],[]])): 2 matched, expected 1:
    ./composite.cue:24:19
    ./composite.cue:24:4
    ./composite.cue:24:26
```

The sub-optimal error reporting for field `E` is tracked in {{<issue FIXME/>}}.
