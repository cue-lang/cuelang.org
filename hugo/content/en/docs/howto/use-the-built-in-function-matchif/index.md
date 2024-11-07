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
cue version v0.11.0-alpha.5
...
```

The `matchIf` function must be used as a field validator; it cannot be called
as a function that returns a boolean value. It requires three arguments:

1. the *if-value*
2. the *then-value*
3. the *else-value*

The function checks if a field's value can unify successfully with the
*if-value*, and then validates the field's value by performing one of
two tests. If the relevant test fails, then the field's value is invalid:

- If the field's value **could** unify successfully with the *if-value*, can
  the field's value also unify successfully with the *then-value*? 
- If the field's value **could not** unify successfully with the *if-value*,
  can the field's value also unify successfully with the *else-value*?

<!-- We use upload/script pairs because code blocks can't access non-default
versions of CUE cf. https://cuelang.org/issues/3265 -->
{{< code-tabs >}}
{{< code-tab name="example.cue" language="cue" area="top-left" >}}
package matchIf

A: 42
// A validates successfully.
A: matchIf(>40, <100, >100)

B: 42
// B fails to validate.
B: matchIf(<40, <100, >100)
{{< /code-tab >}}{{< /code-tabs >}}
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAuOmJhc2lj" }
$ cue vet .:basic
build constraints exclude all CUE files in .:
    example.cue: package is matchIf, want basic
```

## Future enhancements

The current release of `matchN` does not consider hidden fields or definitions
when checking for a match:

{{< code-tabs >}}
{{< code-tab name="helper-fields.cue" language="cue" area="top-left" >}}
package helperFields

A: matchN(1, [#A]) & {
	_foo: "a string"
	#bar: "another string"
}

#A: {
	_foo: int
	#bar: !="another string"
}
{{< /code-tab >}}{{< /code-tabs >}}

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHZldCAuOmhlbHBlckZpZWxkcw==" }
# This command currently succeeds:
$ cue vet .:helperFields
```

This behaviour *may* change with future CUE releases.
If support for hidden fields or definitions is important to how you would like
to use `matchN`, please join [the CUE community]({{< relref "/community" >}})
and tell us about your use case.
