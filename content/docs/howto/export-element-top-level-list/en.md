---
title: Exporting an element from a top-level data list
authors: [jpluscplusm]
toc_hide: true
---

Many data formats can encode lists at their top-level, including JSON and YAML.
This guide demonstrates how to export an element from such a list using only
the `cue` command.

{{{with code "en" "example"}}}
exec cue export data.yaml -l input: -e input[2]
cmp stdout out
-- data.yaml --
# This list contains mixed types, including
# structs, simple values, and other lists.
- some: data
  in: { a: list }
- [ 1, 2, 3 ]
- a: list element
  of: { type: struct }
- 4
- 5
-- out --
{
    "a": "list element",
    "of": {
        "type": "struct"
    }
}
{{{end}}}

## Related content

- {{<linkto/related/howto"export-fields-whose-names-are-not-valid-identifiers">}}
- {{<linkto/related/howto"refer-to-fields-whose-names-are-not-valid-identifiers">}}
- {{<linkto/related/reference"command/cue-export">}}
