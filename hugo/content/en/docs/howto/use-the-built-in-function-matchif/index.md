---
title: Using the built-in function "matchIf" as a field validator
authors: [jpluscplusm]
toc_hide: true
---

This guide demonstrates how to use the
[built-in]({{< relref "docs/reference/glossary#built-in-functions" >}})
function `matchIf` as a field validator.
The function currently requires a
[pre-release]({{< relref "/docs/introduction/installation" >}}#download-an-official-cue-binary)
version of the `cue` command:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZlcnNpb24=" }
$ cue version
cue version v0.11.0-rc.1
...
```

The `matchIf` function must be used as a field validator; it cannot be called
as a function that returns a boolean value. It requires three arguments:

1. the *if-value*
2. the *then-value*
3. the *else-value*

The function first checks if a field's value can unify successfully with the *if-value*,
and then validates the field's value by performing one of two tests.
If the test fails, then the field's value is invalid:

- If the field's value **could** unify successfully with the *if-value*, can
  the field's value also unify successfully with the *then-value*?
- If the field's value **could not** unify successfully with the *if-value*,
  can the field's value also unify successfully with the *else-value*?

<!-- We use upload/script pairs because code blocks can't access non-default
versions of CUE cf. https://cuelang.org/issues/3265 -->
{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="top-left" >}}
package matchIf

// A and B have the same value.
A: 42
B: 42
// A validates successfully.
A: matchIf(>40, <100, >100)
// B fails to validate.
B: matchIf(<40, <100, >100)

// C and D have the same composite value.
C: {x: "some string", o: 99}
D: {x: "some string", o: 99}
// C validates successfully.
C: matchIf({x?: string}, {o?: <100}, {o?: >100})
// D fails to validate.
D: matchIf({x?: int}, _oUnder100, _oOver100)

_oUnder100: {o?: <100}
_oOver100: {o?: >100}
{{< /code-tab >}}{{< /code-tabs >}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldA==" }
$ cue vet
B: invalid value 42 (does not satisfy matchIf): invalid value 42 (out of bound >100):
    ./example.cue:9:4
    ./example.cue:5:4
    ./example.cue:9:12
    ./example.cue:9:17
    ./example.cue:9:23
D: invalid value {x:"some string",o:99} (does not satisfy matchIf): invalid value 99 (out of bound >100):
    ./example.cue:17:4
    ./example.cue:13:4
    ./example.cue:13:26
    ./example.cue:20:17
```

## Future enhancements

The current release of `matchIf` does not consider hidden fields or definitions
when checking for a match with any of its parameters
(the *if-value*, the *then-value*, or the *else-value*):

{{< code-tabs >}}
{{< code-tab name="helper-fields.cue" language="cue" area="top-left" >}}
package helperFields

A: {
	_foo: "some string"
	#bar: 42
	baz:  4.2
}
// A validates successfully.
A: matchIf(#A, #A, #A)

#A: {
	_foo?: int
	#bar?: string
	baz!:  float
}
{{< /code-tab >}}{{< /code-tabs >}}

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAuOmhlbHBlckZpZWxkcw==" }
# This command currently succeeds:
$ cue vet .:helperFields
```

This behaviour *may* change with future CUE releases.
If support for hidden fields or definitions is important to how you would like
to use `matchIf`, please join [the CUE community]({{< relref "/community" >}})
and tell us about your use case.
