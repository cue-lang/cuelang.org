---
title: Using your first CUE workflow command
toc_hide: true
authors:
- jpluscplusm
tags:
- workflow command
---

This guide demonstrates how to define a very simple CUE *workflow command*,
and how to run it.
This specific workflow command allows a `-t` flag to
[inject]({{< relref "docs/reference/command/cue-help-injection" >}})
a value into the process so that it can be referred to.

{{< code-tabs >}}
{{< code-tab name="some_tool.cue" language="cue" area="top-left" >}}
package example

import "tool/exec"

name: *"everyone" | string @tag(who)
city: "Kinshasa"

// The "hello" command welcomes people to a place.
command: hello: {
	// The command contains a single task.
	print: exec.Run & {
		cmd: "echo Hey \(name), welcome to \(city)!"
	}
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGNtZCAtdCB3aG89QWxleCBoZWxsbw==" >}}
$ cue cmd -t who=Alex hello
Hey Alex, welcome to Kinshasa!
{{< /code-tab >}}
{{< /code-tabs >}}

{{< info >}}
CUE workflows commands can only be invoked if
they are stored in a file with a name ending `_tool.cue`.
{{< /info >}}

## Related content

<!-- TODO: link to some central /docs/ page on cue tools -->
- {{< linkto/related/reference "command/cue-help-commands" >}}
  -- more information about CUE workflow commands
- {{< linkto/related/reference "command/cue-help-injection" >}}
  -- injecting values into `cue` command invocations
