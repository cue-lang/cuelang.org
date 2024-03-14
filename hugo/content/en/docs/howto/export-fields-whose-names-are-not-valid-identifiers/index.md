---
title: Exporting fields whose names are not valid identifiers
tags:
- commented cue
- cue command
authors:
- jpluscplusm
toc_hide: true
---

Some fields have names that are not valid
[CUE identifiers]({{< relref "docs/reference/spec#identifiers" >}}).
This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to export these fields using `cue export -e`.

{{< code-tabs >}}
{{< code-tab name="data.yml" language="yml" area="top" >}}
# data.yml contains a field we want to export with
# the "cue export" command's "-e" parameter

"top level field":
  a: [ 1, 2, 3 ]
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGV4cG9ydCAtbCBpbnB1dDogZGF0YS55bWwgLWUgJ2lucHV0WyJ0b3AgbGV2ZWwgZmllbGQiXSc=" >}}
$ cue export -l input: data.yml -e 'input["top level field"]'
{
    "a": [
        1,
        2,
        3
    ]
}
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- {{< linkto/related/howto "refer-to-fields-whose-names-are-not-valid-identifiers" >}}
