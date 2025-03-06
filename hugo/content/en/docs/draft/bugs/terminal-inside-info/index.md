---
title: frontend bug - additional vertical space for code blocks inside an info block
draft: true
no_index: true
---

## Terminal

Here's a terminal. Note the vertical spacing around the command and its output, which is expected:

```text { title="TERMINAL" type="terminal" codeToCopy="ZWNobyBoZWxsbw==" }
$ echo hello
hello
```

{{< step stepNumber="1" >}}
Here's the same terminal inside a `step`. It looks the same as above:
```text { title="TERMINAL" type="terminal" codeToCopy="ZWNobyBoZWxsbw==" }
$ echo hello
hello
```
{{< /step >}}

{{<info>}}
Here's the same terminal inside an `info`. It gains two extra lines of vertical space:
```text { title="TERMINAL" type="terminal" codeToCopy="ZWNobyBoZWxsbw==" }
$ echo hello
hello
```
{{</info>}}

## Upload

Here's the same sequence for a file `upload`.

Plain (as expected):
{{< code-tabs >}}
{{< code-tab name="1.cue" language="cue" area="top-left" >}}
foo: 42
{{< /code-tab >}}{{< /code-tabs >}}

{{< step stepNumber="2" >}}
Inside a step (as expected):
{{< code-tabs >}}
{{< code-tab name="2.cue" language="cue" area="top-left" >}}
foo: 42
{{< /code-tab >}}{{< /code-tabs >}}
{{< /step >}}

{{<info>}}
Inside an info block (same problem occurs):
{{< code-tabs >}}
{{< code-tab name="3.cue" language="cue" area="top-left" >}}
foo: 42
{{< /code-tab >}}{{< /code-tabs >}}
{{</info>}}

{{<warning>}}
Inside a warning block (same problem occurs):
{{< code-tabs >}}
{{< code-tab name="4.cue" language="cue" area="top-left" >}}
foo: 42
{{< /code-tab >}}{{< /code-tabs >}}
{{</warning>}}

{{<caution>}}
Inside a caution block (same problem occurs):
{{< code-tabs >}}
{{< code-tab name="5.cue" language="cue" area="top-left" >}}
foo: 42
{{< /code-tab >}}{{< /code-tabs >}}
{{</caution>}}
