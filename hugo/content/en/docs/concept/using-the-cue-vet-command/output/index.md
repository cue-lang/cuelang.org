---
title: Modifying command output
weight: 30
tags: [cue command]
authors: [jpluscplusm]
toc_hide: false
---

As shown throughout this guide, the `cue vet` command is either silent when
all its inputs validate successfully, or it displays error messages identifying
the cause of any validation failures.

As well as checking that there are no data inconsistencies, by default
`cue vet` also verifies that its inputs are
[*complete*]({{< relref "docs/concept/working-with-incomplete-cue" >}}).
In other words, the command ensures that
[`cue export`]({{< relref "docs/reference/command/cue-export" >}})
would be able to emit a configuration
using a data-only encoding such as JSON, YAML, or TOML.

If this is not the case, then `cue vet` fails and displays a single, general error:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package alpha

A: int & >100
B: string
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldA==" >}}
$ cue vet
some instances are incomplete; use the -c flag to show errors or -c=false to allow incomplete instances
{{< /code-tab >}}
{{< /code-tabs >}}

To make the general error more specific, include the `-c` flag to display
errors about individual fields:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package alpha

A: int & >100
B: string
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
A: incomplete value >100 & int
B: incomplete value string:
    ./file.cue:4:4
{{< /code-tab >}}
{{< /code-tabs >}}

The `-c` flag also has a long form: `--concrete`.

To permit incomplete regular fields, use the `-c=false` flag to check for
consistency alone:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package alpha

A: int & >100
B: string
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldCAtYz1mYWxzZQ==" >}}
$ cue vet -c=false
{{< /code-tab >}}
{{< /code-tabs >}}

The `cue vet -c=false` command succeeds if your CUE is consistent,
but contains incomplete regular fields.

The same command fails if any type of field contains inconsistent values:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package alpha

A:  int & >100
B:  string
_C: 42 & >100
#D: true & false
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldCAtYz1mYWxzZQ==" >}}
$ cue vet -c=false
#D: conflicting values false and true:
    ./file.cue:6:5
    ./file.cue:6:12
_C: invalid value 42 (out of bound >100):
    ./file.cue:5:10
    ./file.cue:5:5
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- {{< linkto/related/reference "command/cue-vet" >}}
- {{< linkto/related/reference "command/cue-help-vet" >}}
  -- the help text displayed by `cue help vet`
- {{<issue"3733">}}Issue #3733{{</issue>}} tracks an effort to re-think how
  `cue vet` operates -- if you have feedback about ways that the command could
  be improved to help your workflows, the CUE project would love to hear it in
  that issue!
