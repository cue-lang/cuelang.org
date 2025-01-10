---
title: Modifying command output
---

As shown throughout this guide, the `cue vet` command is either silent when
all its inputs validate successfully, or it displays error messages identifying
the cause of any validation failures.

By default, in addition to checking that there are no data inconsistencies,
`cue vet` verifies that its inputs are
[*complete*]({{< relref "docs/concept/working-with-incomplete-cue" >}}).
In other words, it ensures that
[`cue export`]({{< relref "docs/reference/command/cue-export" >}})
would be able to produce a JSON or YAML configuration if it were invoked.
`cue vet` displays a general error if this is not the case:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

A: int & >100
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldA==" >}}
$ cue vet
some instances are incomplete; use the -c flag to show errors or suppress this message
{{< /code-tab >}}
{{< /code-tabs >}}

To display specific errors about incomplete regular fields use the `--concrete`/`-c` flag:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

A: int & >100
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
A: incomplete value >100 & int
{{< /code-tab >}}
{{< /code-tabs >}}

To permit incomplete fields, and to check only for consistency, use `--concrete=false`/`-c=false`:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
package example

A: int & >100
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIHZldCAtYz1mYWxzZQ==" >}}
$ cue vet -c=false
{{< /code-tab >}}
{{< /code-tabs >}}

You can use `cue vet -c=false` to find consistency errors in your CUE:

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

A: int & string
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYz1mYWxzZQ==" >}}
$ cue vet -c=false
A: conflicting values int and string (mismatched types int and string):
    ./file.cue:3:4
    ./file.cue:3:10
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- {{<linkto/related/reference "command/cue-vet">}}
- {{<linkto/related/reference "command/cue-help-vet">}} -- the help text displayed by `cue help vet`
- {{<issue"3733">}}Issue #3733{{</issue>}} tracks an effort to re-think how
  `cue vet` operates -- if you'd like to provide feedback about ways that the
  command could be improved to help your workflows, the CUE project would love
  to hear it in that issue!
