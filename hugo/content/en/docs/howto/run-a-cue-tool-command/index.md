---
title: Running a CUE tool command
toc_hide: true
authors:
- jpluscplusm
tags:
- cue command
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to run a simple CUE *tool command* from a `_tool.cue` file,
injecting a string from the command line to set the value of a tagged field.
<!-- TODO: better terms to distinguish "a cue command" from "a cue command command" from "a CUE tool command" etc -->

{{< code-tabs >}}
{{< code-tab name="some_tool.cue" language="cue" area="top-left" >}}
package example

import "tool/exec"

city: "Kinshasa"
name: *"World" | string @tag(who)

// The "hello" command welcomes people to a place.
command: hello: {
	// Hello contains a single Task.
	print: exec.Run & {
		cmd: "echo Hey \(name)! Welcome to \(city)"
	}
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGNtZCAtdCB3aG89QWxleCBoZWxsbw==" >}}
$ cue cmd -t who=Alex hello
Hey Alex! Welcome to Kinshasa
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- This example comes from
  [`cue help commands`]({{< relref "docs/reference/cli/cue-commands" >}}),
  which contains more information about CUE tool commands.
<!-- TODO: link to some central /docs/ page on cue tools -->
