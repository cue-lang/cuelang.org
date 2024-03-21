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

{{{with code "en" "cc"}}}
exec cue cmd -t who=Alex -t where=Morocco hello
cmp stdout out
-- some_tool.cue --
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
-- out --
Hey Alex, welcome to Morocco!
{{{end}}}

## Related content

- {{< linkto/related/reference "cli/cue-commands" >}}
  -- more information about CUE tool commands
<!-- TODO: link to some central /docs/ page on cue tools -->
