---
title: "Issue 3796: code-tabs inside info blocks have unwanted extra vertical spaces"
---

## Terminal

Here's a terminal. Note the vertical spacing around the command and its output - this is the expected rendering:

````text { title="TERMINAL" type="terminal" codeToCopy="ZWNobyBoZWxsbw==" }
$ echo hello
hello
````

{{< step stepNumber="1" >}}
Here's the same terminal inside a `step`. It renders as expected:
````text { title="TERMINAL" type="terminal" codeToCopy="ZWNobyBoZWxsbw==" }
$ echo hello
hello
````
{{< /step >}}

{{<info>}}
Here's the same terminal inside an `info` block.

It has two extra lines of vertical space versus the expected rendering:
````text { title="TERMINAL" type="terminal" codeToCopy="ZWNobyBoZWxsbw==" }
$ echo hello
hello
````
{{</info>}}

{{< step stepNumber="2" >}}
{{<info>}}
Here's the same terminal inside an `info` block inside a `step`.

It also has two extra lines of vertical space versus the expected rendering:
````text { title="TERMINAL" type="terminal" codeToCopy="ZWNobyBoZWxsbw==" }
$ echo hello
hello
````
{{</info>}}
{{< /step >}}

## Upload

Here's the same sequence for a file `upload`.

The expected rendering:
{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
foo: 42
{{< /code-tab >}}{{< /code-tabs >}}

{{< step stepNumber="3" >}}
Inside a step (renders as expected):
{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
foo: 42
{{< /code-tab >}}{{< /code-tabs >}}
{{< /step >}}

{{<info>}}
Inside an info block (two extra lines of vertical space):
{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
foo: 42
{{< /code-tab >}}{{< /code-tabs >}}
{{</info>}}

{{<warning>}}
Inside a warning block (two extra lines of vertical space):
{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
foo: 42
{{< /code-tab >}}{{< /code-tabs >}}
{{</warning>}}

{{<caution>}}
Inside a caution block (two extra lines of vertical space):
{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
foo: 42
{{< /code-tab >}}{{< /code-tabs >}}
{{</caution>}}

{{< step stepNumber="4" >}}
{{<info>}}
Inside an info block inside a step (two extra lines of vertical space):
{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
foo: 42
{{< /code-tab >}}{{< /code-tabs >}}
{{</info>}}
{{< /step >}}
