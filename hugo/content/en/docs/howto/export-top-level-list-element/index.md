---
title: Exporting an element from a top-level data list
authors: [jpluscplusm]
toc_hide: true
---

Many data formats can encode lists at their top-level, such as JSON arrays and
YAML sequences.
This guide demonstrates how to export an element from such a list using the
`cue` command by itself.

{{< code-tabs >}}
{{< code-tab name="data.yaml" language="yaml" area="top-left" >}}
- A
- B
- C
- D
- E
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBkYXRhLnlhbWwgLWwgZm9vOiAtZSBmb29bMl0=" >}}
$ cue export data.yaml -l foo: -e foo[2]
"C"
{{< /code-tab >}}
{{< /code-tabs >}}

The `cue export` command shown here uses two flags to export the list element:
- the `-l` flag places the data input at an addressable location using an
  arbitrary identifier
- the `-e` flag refers to that location using the identifier and selects the
  element at list index `2`

## Related content

- {{<linkto/related/reference"command/cue-export">}} -- including:
  - [Using the `--path` flag (also known as `-l`)]({{<relref"docs/concept/using-the-cue-export-command/inputs">}}#non-cue-data-location)
  - [Using the `--expression` flag (also known as `-e`)]({{<relref"docs/concept/using-the-cue-export-command/evaluation">}}#modified-expression)
- {{<linkto/related/howto"export-fields-whose-names-are-not-valid-identifiers">}}
- {{<linkto/related/howto"refer-to-fields-whose-names-are-not-valid-identifiers">}}
