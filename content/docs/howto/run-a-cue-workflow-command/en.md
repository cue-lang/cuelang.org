---
title: Running a CUE workflow command
toc_hide: true
authors:
- jpluscplusm
tags:
- cue command
---

This [Commented CUE]({{< relref "docs/howto#commented-cue-guides" >}})
demonstrates how to run a simple CUE *workflow command* while injecting
information from the command line to set the value of a tagged field.

{{{with code "en" "cc"}}}
exec cue cmd -t who=Alex hello
cmp stdout out
-- some_tool.cue --
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
-- out --
Hey Alex, welcome to Kinshasa!
{{{end}}}

{{< info >}}
CUE workflows commands can *only* be invoked if they are stored in a file with a
name ending `_tool.cue`.
{{< /info >}}

## Related content

- {{< linkto/related/reference "cli/cue-commands" >}}
  -- more information about CUE tool commands
- {{< linkto/related/reference "cli/cue-injection" >}}
  -- injecting information into `cue` command invocations
<!-- TODO: link to some central /docs/ page on cue tools -->
