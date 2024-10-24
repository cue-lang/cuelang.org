---
title: Determine the order of tasks in your CUE workflow
toc_hide: true
authors:
- myitcv
tags:
- workflow command
---

This guide demonstrates how dependencies between tasks in a workflow, implicit
or explicit, influence the order of execution.

{{< code-tabs >}}
{{< code-tab name="some_tool.cue" language="cue" area="top-left" >}}
package example

import (
	"strings"
	"tool/cli"
	"tool/file"
)

command: dostuff: {
	read: file.Read & {
		filename: "input.txt"
		contents: string
	}

	// The report task will run after read, because it depends on the output of
	// the file read.
	report: cli.Print & {
		text: "We read: \(strings.TrimSpace(read.contents))"
	}

	// Use the $after meta field to reference and therefore depend on the tasks
	// that should run before.
	thank: cli.Print & {
		$after: [read, report]
		text: "Thank you"
	}
}
{{< /code-tab >}}
{{< code-tab name="input.txt" language="txt" area="top-left" >}}
Hello, world!
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIGNtZCBkb3N0dWZm" >}}
$ cue cmd dostuff
We read: Hello, world!
Thank you
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content

- {{<linkto/related/howto "use-your-first-cue-workflow-command" >}}
  -- getting started with CUE workflows
