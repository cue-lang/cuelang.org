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
This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to export these fields using `cue export -e`.

{{{with code "en" "emit"}}}
#location top bottom

exec cue export -l input: data.yml -e 'input["top level field"]'
cmp stdout out
-- data.yml --
# data.yml contains a field we want to export with
# the "cue export" command's "-e" parameter

"top level field":
  a: [ 1, 2, 3 ]
-- out --
{
    "a": [
        1,
        2,
        3
    ]
}
{{{end}}}

## Related content

- How to use CUE's language features to
  [refer to fields whose names are not valid identifiers]({{< relref
    "../refer-to-fields-whose-names-are-not-valid-identifiers"
  >}}).
