---
title: Conditionally including CUE files using build attributes
toc_hide: true
authors:
- jpluscplusm
tags:
- language
---

This guide demonstrates how to include CUE files in an evaluation
conditionally, using build attributes.

<!--more-->

Our `example` CUE package is composed of four files:

{{< code-tabs >}}
{{< code-tab name="foo.cue" language="cue" area="left" >}}
@if(foo)
package example

"data from foo.cue": true
{{< /code-tab >}}{{< code-tab name="bar.cue" language="cue" area="left" >}}
@if(!bar)
package example

"data from bar.cue": true
{{< /code-tab >}}{{< code-tab name="qux.cue" language="cue" area="left" >}}
@if((foo && !bar) || (!foo && bar))
package example

"data from qux.cue": true
{{< /code-tab >}}{{< code-tab name="baz.cue" language="cue" area="right" >}}
package example

"data from baz.cue": true
{{< /code-tab >}}{{< /code-tabs >}}

The first three of these files contain
[build attributes]({{<relref"docs/reference/command/cue-help-injection">}}),
which control if the
file's contents are included in evaluations of the `example` package based on
the presence or absence of tags:

- `foo.cue` is only included when the `foo` tag is present.
- `bar.cue` is only included when the `bar` tag is *not* present.
- `qux.cue` is only included when one of the `bar` or `foo` tags is present
  (but not when both or neither are present).
- `baz.cue` is always included.

The following `cue export` invocations all specify different tags to change the
evaluation as described above:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV4cG9ydApjdWUgZXhwb3J0IC10IGZvbwpjdWUgZXhwb3J0IC10IGJhcgpjdWUgZXhwb3J0IC10IGZvbyAtdCBiYXI=" }
$ cue export
{
    "data from bar.cue": true,
    "data from baz.cue": true
}
$ cue export -t foo
{
    "data from bar.cue": true,
    "data from baz.cue": true,
    "data from foo.cue": true,
    "data from qux.cue": true
}
$ cue export -t bar
{
    "data from baz.cue": true,
    "data from qux.cue": true
}
$ cue export -t foo -t bar
{
    "data from baz.cue": true,
    "data from foo.cue": true
}
```

{{< info >}}
The `foo` and `bar` tags are only aligned with their respective filenames to
help you understand their relationships in this example. Tags and filenames
do not need to overlap in any way --
**they are entirely unrelated strings.**
{{< /info >}}

## Related content

- {{< linkto/related/reference "command/cue-help-injection" >}}
  -- injecting tags and values into `cue` command invocations
