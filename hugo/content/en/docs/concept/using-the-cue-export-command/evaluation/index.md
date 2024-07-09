---
title: Evaluation
weight: 20
toc_hide: false
---

The command fails with an error message:

- if evaluation of the configuration is unsuccessful
  - such as when concrete data values are unified with constraints that forbid
    those same values, or if the configuration to be evaluated can't be loaded
- if the value of the expression to be emitted isn't concrete
  - which is when the value *wouldn't* be able to be represented in a data-only
    format such as JSON. Examples of non-concrete values include types such as
    `string` and constraints such as `>=100`:

{{< code-tabs >}}
{{< code-tab name="failure.cue" language="cue" area="left" >}}
package d

Ad: 1
Bd: float
Cd: >=100
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="right" type="terminal" codetocopy="Y3VlIGV4cG9ydA==" >}}
$ cue export
Bd: incomplete value float:
    ./failure.cue:4:5
Cd: incomplete value >=100:
    ./failure.cue:5:5
{{< /code-tab >}}
{{< /code-tabs >}}
