---
WARNING: "Code generated site_tool.cue; DO NOT EDIT."
title: "cue commands"
tags:
- cue command
---

```text { title="TERMINAL" codeToCopy="Y3VlIGhlbHAgY29tbWFuZHMK" }
$ cue help commands
Commands define actions on instances. For example, they may
specify how to upload a configuration to Kubernetes. Commands are
defined directly in tool files, which are regular CUE files
within the same package with a filename ending in _tool.cue.
These are typically defined at the module root so that they apply
to all instances.

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

	https://pkg.go.dev/cuelang.org/go/pkg/tool?tab=subdirectories

More on tasks can be found in the commands help topic.

Examples:

In this simple example, we define a command called "hello",
which declares a single task called "print" which uses
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

We run the "hello" command like this:

	$ cue cmd hello
	Hello World! Welcome to Amsterdam.

	$ cue cmd --inject who=Jan hello
	Hello Jan! Welcome to Amsterdam.


In this example we declare the "prompted" command which has four
tasks. The first task prompts the user for a string input. The
second task depends on the first, and echos the response back to
the user with a friendly message. The third task pipes the output
from the second to a file. The fourth task pipes the output from
the second to standard output (i.e. it echos it again).

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

The types of the commands and tasks are defined in CUE itself at
cuelang.org/go/pkg/tool/tool.cue.

	command: [Name]: Command

	Command: {
		// Tasks specifies the things to run to complete a command. Tasks are
		// typically underspecified and completed by the particular internal
		// handler that is running them. Tasks can be a single task, or a full
		// hierarchy of tasks.
		//
		// Tasks that depend on the output of other tasks are run after such tasks.
		// Use $after if a task needs to run after another task but does not
		// otherwise depend on its output.
		Tasks

		// $usage summarizes how a command takes arguments.
		//
		// Example:
		//     mycmd [-n] names
		$usage?: string

		// $short is short description of what the command does.
		$short?: string

		// $long is a longer description that spans multiple lines and
		// likely contain examples of usage of the command.
		$long?: string
	}

	// Tasks defines a hierarchy of tasks. A command completes if all
	// tasks have run to completion.
	Tasks: Task | {
		[name=Name]: Tasks
	}

	// Name defines a valid task or command name.
	Name: =~#"^\PL([-](\PL|\PN))*$"#

	// A Task defines a step in the execution of a command.
	Task: {
		$type: "tool.Task" // legacy field 'kind' still supported for now.

		// $id indicates the operation to run. It must be of the form
		// packagePath.Operation.
		$id: =~#"\."#

		// $after can be used to specify a task is run after another one, when
		// it does not otherwise refer to an output of that task.
		$after?: Task | [...Task]
	}

```
