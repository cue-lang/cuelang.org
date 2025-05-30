---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue help cmd"
weight: 1000
tags:
- cue command
- workflow command
---
```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGhlbHAgY21k" }
$ cue help cmd
cmd executes the named command for each of the named instances.

Workflow commands define actions on instances. For example, they
may specify how to upload a configuration to Kubernetes. Workflow
commands are defined directly in tool files, which are regular
CUE files within the same package with a filename ending in
_tool.cue.  These are typically defined at the module root so
that they apply to all instances.

Each command consists of one or more tasks. A task may, for
example, load or write a file, consult a user on the command
line, fetch a web page, and so on. Each task has inputs and
outputs. Outputs are typically filled out by the task
implementation as the task completes.

Inputs of tasks my refer to outputs of other tasks. The cue tool
does a static analysis of the configuration and only starts tasks
that are fully specified. Upon completion of each task, cue
rewrites the instance, filling in the completed task, and
reevaluates which other tasks can now start, and so on until all
tasks have completed.

Available tasks can be found in the package documentation at

	https://cuelang.org/go/pkg/tool#section-directories

Examples:

In this simple example, we define a workflow command called
"hello", which declares a single task called "print" which uses
"tool/exec.Run" to execute a shell command that echos output to
the terminal:

	$ cat <<EOF > hello_tool.cue
	package foo

	import "tool/exec"

	city: "Amsterdam"
	who: *"World" | string @tag(who)

	// Say hello!
	command: hello: {
		print: exec.Run & {
			cmd: "echo Hello \(who)! Welcome to \(city)."
		}
	}
	EOF

We run the "hello" workflow command like this:

	$ cue cmd hello
	Hello World! Welcome to Amsterdam.

	$ cue cmd --inject who=Jan hello
	Hello Jan! Welcome to Amsterdam.


In this example we declare the "prompted" workflow command which
has four tasks. The first task prompts the user for a string
input. The second task depends on the first, and echos the
response back to the user with a friendly message. The third task
pipes the output from the second to a file. The fourth task pipes
the output from the second to standard output (i.e. it echos it
again).

	package foo

	import (
		"tool/cli"
		"tool/exec"
		"tool/file"
	)

	city: "Amsterdam"

	// Say hello!
	command: prompter: {
		// save transcript to this file
		var: file: *"out.txt" | string @tag(file)

		ask: cli.Ask & {
			prompt:   "What is your name?"
			response: string
		}

		// starts after ask
		echo: exec.Run & {
			cmd:    ["echo", "Hello", ask.response + "!"]
			stdout: string // capture stdout
		}

		// starts after echo
		append: file.Append & {
			filename: var.file
			contents: echo.stdout
		}

		// also starts after echo
		print: cli.Print & {
			text: echo.stdout
		}
	}

Run "cue help commands" for more details on tasks and workflow commands.

Usage:
  cue cmd <name> [inputs] [flags]

Flags:
  -t, --inject stringArray   set the value of a tagged field
  -T, --inject-vars          inject system variables in tags (default true)

Global Flags:
  -E, --all-errors   print all available errors
  -i, --ignore       proceed in the presence of errors
  -s, --simplify     simplify output
      --trace        trace computation
  -v, --verbose      print information about progress
```

## Related content

- {{< linkto/related/reference "command/cue-help-commands" >}}