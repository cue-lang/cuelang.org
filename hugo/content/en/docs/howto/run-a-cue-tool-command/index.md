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
injecting values from the command line to set the value of some tagged fields.
<!-- TODO: better terms to distinguish "a cue command" from "a cue command command" from "a CUE tool command" etc -->

{{< code-tabs >}}
{{< code-tab name="some_tool.cue" language="cue" area="top-left" >}}
package example

import "tool/exec"

name: *"everyone" | string  @tag(who)
city: *"the world" | string @tag(where)

// The "hello" command welcomes people to a place.
command: hello: {
	// The command contains a single task.
	print: exec.Run & {
		cmd: "echo Hey \(name), welcome to \(city)!"
	}
}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGNtZCAtdCB3aG89QWxleCAtdCB3aGVyZT1Nb3JvY2NvIGhlbGxv" >}}
$ cue cmd -t who=Alex -t where=Morocco hello
Hey Alex, welcome to Morocco!
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- {{< linkto/related/reference "cli/cue-commands" >}}
  -- more information about CUE tool commands
<!-- TODO: link to some central /docs/ page on cue tools -->
