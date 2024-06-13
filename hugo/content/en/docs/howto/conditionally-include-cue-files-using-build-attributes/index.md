---
title: Conditionally including CUE files using build attributes
toc_hide: true
authors:
- jpluscplusm
tags:
- language
---

<!-- TODO: consider demonstrating more complex tag usage when https://github.com/cue-lang/cue/issues/3228 is resolved -->

This guide demonstrates how to include CUE files in an evaluation
conditionally, using build attributes.

The `example` CUE package is composed of three files:

{{< columns >}}
{{< code-tabs >}}
{{< code-tab name="A.cue" language="cue" area="top-left" >}}
package example

"data from A.cue": true
{{< /code-tab >}}{{< /code-tabs >}}
{{< columns-separator >}}
{{< code-tabs >}}
{{< code-tab name="B.cue" language="cue" area="top-left" >}}
@if(foo)
package example

"data from B.cue": true
{{< /code-tab >}}{{< /code-tabs >}}
{{< columns-separator >}}
{{< code-tabs >}}
{{< code-tab name="C.cue" language="cue" area="top-left" >}}
@if(!bar)
package example

"data from C.cue": true
{{< /code-tab >}}{{< /code-tabs >}}
{{< /columns >}}

The contents of `A.cue` are unconditionally included in each evaluation of the
package, but the contents of `B.cue` are only included when the `foo` tag is
present:

```text { title="TERMINAL" codeToCopy="Y3VlIGV4cG9ydA==" }
$ cue export
{
    "data from A.cue": true,
    "data from C.cue": true
}
```

```text { title="TERMINAL" codeToCopy="Y3VlIGV4cG9ydCAtdCBmb28=" }
$ cue export -t foo
{
    "data from A.cue": true,
    "data from B.cue": true,
    "data from C.cue": true
}
```

The contents of `C.cue` are included only when the `bar` tag is *not* present:

```text { title="TERMINAL" codeToCopy="Y3VlIGV4cG9ydCAtdCBiYXI=" }
$ cue export -t bar
{
    "data from A.cue": true
}
```

Multiple tags may be present, which include and exclude files from the
evaluation as expected:

```text { title="TERMINAL" codeToCopy="Y3VlIGV4cG9ydCAtdCBmb28gLXQgYmFy" }
$ cue export -t foo -t bar
{
    "data from A.cue": true,
    "data from B.cue": true
}
```

## Related content

- {{< linkto/related/reference "cli/cue-injection" >}}
  -- injecting tags and values into `cue` command invocations
