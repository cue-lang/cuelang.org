---
title: Using your first CUE workflow command
toc_hide: true
authors:
- jpluscplusm
tags:
- cue command
---

This guide demonstrates the source of a very simple CUE *workflow command*,
and how it should be run.
This specific workflow command allows information to be injected from the
command line to set the value of a tagged field.

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
- {{< linkto/related/reference "cli/cue-commands" >}}
  -- more information about CUE tool commands
- {{< linkto/related/reference "cli/cue-injection" >}}
  -- injecting information into `cue` command invocations
