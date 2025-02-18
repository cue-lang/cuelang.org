---
title: Exporting an element from a top-level data list
authors: [jpluscplusm]
toc_hide: true
---

Many data formats can encode lists at their top-level, such as JSON arrays and
YAML sequences.
This guide demonstrates how to export an element from such a list using only
the `cue` command.

{{{with code "en" "example"}}}
exec cue export data.yaml -l input: -e input[2]
cmp stdout out
-- data.yaml --
- A
- B
- C
- D
- E
-- out --
"C"
{{{end}}}

The `cue export` command shown above uses two flags to export the list element.
Firstly, the `--path`(`-l`) flag places the data input at an addressable location.
Then the `--expression`(`-e`) flag is used to reach into that location and
select the element at index `2` in the list.

## Related content

- {{<linkto/related/reference"command/cue-export">}} -- including:
  - [Using the `--path`(`-l`) flag]({{<relref"docs/concept/using-the-cue-export-command/inputs">}}#non-cue-data-location)
  - [Using the `--expression`(`-e`) flag]({{<relref"docs/concept/using-the-cue-export-command/evaluation">}}#modified-expression)
- {{<linkto/related/howto"export-fields-whose-names-are-not-valid-identifiers">}}
- {{<linkto/related/howto"refer-to-fields-whose-names-are-not-valid-identifiers">}}
