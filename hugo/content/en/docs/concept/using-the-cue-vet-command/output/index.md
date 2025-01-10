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
In other words, the command ensures that (if invoked)
[`cue export`]({{< relref "docs/reference/command/cue-export" >}})
would be able to emit a configuration succesfully
using a data-only encoding such as JSON, YAML, or TOML.

If this is not the case, then `cue vet` fails and displays a general error:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

A: int & >100
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldA==" >}}
$ cue vet
some instances are incomplete; use the -c flag to show errors or -c=false to allow incomplete instances
{{< /code-tab >}}
{{< /code-tabs >}}

To make the general error more specific, include the `-c` flag to display
errors about individual fields:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

A: int & >100
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
A: incomplete value >100 & int
{{< /code-tab >}}
{{< /code-tabs >}}

The `-c` flag also has a long form: `--concrete`.

To permit incomplete regular fields, use the `-c=false` flag to check for
consistency alone:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

A: int & >100
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYz1mYWxzZQ==" >}}
$ cue vet -c=false
{{< /code-tab >}}
{{< /code-tabs >}}

The `cue vet -c=false` command succeeds if your CUE is consistent but contains
incomplete regular fields. It fails if consistency errors are present in any
type of field:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

A:  int & >100
_B: int & string
#C: true & false
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYz1mYWxzZQ==" >}}
$ cue vet -c=false
#C: conflicting values false and true:
    ./file.cue:5:5
    ./file.cue:5:12
_B: conflicting values int and string (mismatched types int and string):
    ./file.cue:4:5
    ./file.cue:4:11
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- {{<linkto/related/reference "command/cue-vet">}}
- {{<linkto/related/reference "command/cue-help-vet">}} -- the help text displayed by `cue help vet`
- {{<issue"3733">}}Issue #3733{{</issue>}} tracks an effort to re-think how
  `cue vet` operates -- if you have feedback about ways that the command could
  be improved to help your workflows, the CUE project would love to hear it in
  that issue!
