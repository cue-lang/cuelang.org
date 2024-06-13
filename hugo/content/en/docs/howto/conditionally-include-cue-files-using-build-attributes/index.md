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

{{< code-tabs >}}
{{< code-tab name="foo.cue" language="cue" area="left" >}}
@if(foo)
package example

"data from foo.cue": true
{{< /code-tab >}}{{< code-tab name="bar.cue" language="cue" area="left" >}}
@if(!bar)
package example

"data from bar.cue": true
{{< /code-tab >}}{{< code-tab name="qux.cue" language="cue" area="right" >}}
package example

"data from qux.cue": true
{{< /code-tab >}}{{< /code-tabs >}}

Two of these files contain build attributes, which control if the file's
contents are included in evaluations of the `example` package based on the
presence or absence of tags:

- `foo.cue` is included only when the `foo` tag is present.
- `bar.cue` is included only when the `bar` tag is *not* present.
- `qux.cue` is always included in the `example` package.

```text { title="TERMINAL" codeToCopy="Y3VlIGV4cG9ydApjdWUgZXhwb3J0IC10IGZvbwpjdWUgZXhwb3J0IC10IGJhcgpjdWUgZXhwb3J0IC10IGZvbyAtdCBiYXI=" }
$ cue export
{
    "data from bar.cue": true,
    "data from qux.cue": true
}
$ cue export -t foo
{
    "data from bar.cue": true,
    "data from foo.cue": true,
    "data from qux.cue": true
}
$ cue export -t bar
{
    "data from qux.cue": true
}
$ cue export -t foo -t bar
{
    "data from foo.cue": true,
    "data from qux.cue": true
}
```

{{< info >}}
The `foo` and `bar` tags are only aligned with their respective filenames to
help you understand their relationships in this example. **Tags and filenames
do not need to overlap in any way:** they are entirely unrelated strings.
{{< /info >}}

## Related content

- {{< linkto/related/reference "cli/cue-injection" >}}
  -- injecting tags and values into `cue` command invocations
