---
title: Influencing the order of tasks in a workflow command
toc_hide: true
authors: [myitcv]
tags: [workflow command]
---

This [Commented CUE]({{< relref "docs/howto/about-commented-cue-guides" >}})
demonstrates how to use dependencies to influence the order of execution of
tasks in a workflow command.

{{{with code "en" "cc"}}}
#location top top bottom
exec cue cmd doStuff
cmp stdout out
-- some_tool.cue --
package example

import (
	"strings"
	"tool/cli"
	"tool/file"
)

command: doStuff: {
	// The readFile task reads a greeting from a file.
	readFile: file.Read & {
		filename: "input.txt"
		contents: string
	}

	// The echoGreeting task prints the greeting read by readFile.
	echoGreeting: cli.Print & {
		text: "We read: \(strings.TrimSpace(readFile.contents))"
	}

	// The thankUser task prints a message after both readFile and echoGreeting are finished.
	thankUser: cli.Print & {
		$after: [readFile, echoGreeting]
		text: "Thank you"
	}
}
-- input.txt --
Hello, world!
-- out --
We read: Hello, world!
Thank you
{{{end}}}

## Related content

- {{<linkto/related/howto "use-your-first-cue-workflow-command" >}}
  -- getting started with workflow commands
- {{<linkto/related/reference "command/cue-help-commands">}}
- {{<linkto/related/reference "command/cue-help-cmd">}}
