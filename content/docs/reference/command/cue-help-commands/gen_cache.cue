package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-commands": {
						page: {
							cache: {
								multi_step: {
									hash:       "5A07OLBLTBD73AVLTFCPCF8RLE9UM8FAK5OP7MNQ02FCDDHHPA10===="
									scriptHash: "KGCE3EH68RGQSGE17FHC48V9RJ2IF957P3DISRGNJBK7HFCGG7G0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.14.0:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help commands"
										exitCode: 0
										output: """
												Workflow commands define actions on instances. For example, they
												may specify how to upload a configuration to Kubernetes. Workflow
												commands are defined directly in tool files, which are regular
												CUE files within the same package with a filename ending in
												_tool.cue.  These are typically defined at the module root so
												that they apply to all instances.

												Each workflow command consists of one or more tasks. A task may,
												for example, load or write a file, consult a user on the command
												line, fetch a web page, and so on. Each task has inputs and
												outputs. Outputs are typically filled out by the task
												implementation as the task completes.

												Tasks are found as regular fields underneath the top-level "command" field,
												excluding hidden fields and definitions. Note that regular fields
												may be produced by comprehensions or from the result of other tasks,
												which can result in discovering more tasks.
												To avoid this, set the CUE_EXPERIMENT=cmdreferencepkg experiment flag.

												Inputs of tasks my refer to outputs of other tasks. The cue tool
												does a static analysis of the configuration and only starts tasks
												that are fully specified. Upon completion of each task, cue
												rewrites the instance, filling in the completed task, and
												reevaluates which other tasks can now start, and so on until all
												tasks have completed.

												Available tasks can be found in the package documentation at

												\thttps://cuelang.org/go/pkg/tool#section-directories

												Examples:

												In this simple example, we define a workflow command called
												"hello", which declares a single task called "print" which uses
												"tool/exec.Run" to execute a shell command that echos output to
												the terminal:

												\t$ cat <<EOF > hello_tool.cue
												\tpackage foo

												\timport "tool/exec"

												\tcity: "Amsterdam"
												\twho: *"World" | string @tag(who)

												\t// Say hello!
												\tcommand: hello: {
												\t\tprint: exec.Run & {
												\t\t\tcmd: "echo Hello \\(who)! Welcome to \\(city)."
												\t\t}
												\t}
												\tEOF

												We run the "hello" workflow command like this:

												\t$ cue cmd hello
												\tHello World! Welcome to Amsterdam.

												\t$ cue cmd --inject who=Jan hello
												\tHello Jan! Welcome to Amsterdam.


												In this example we declare the "prompted" workflow command which
												has four tasks. The first task prompts the user for a string
												input. The second task depends on the first, and echos the
												response back to the user with a friendly message. The third task
												pipes the output from the second to a file. The fourth task pipes
												the output from the second to standard output (i.e. it echos it
												again).

												\tpackage foo

												\timport (
												\t\t"tool/cli"
												\t\t"tool/exec"
												\t\t"tool/file"
												\t)

												\tcity: "Amsterdam"

												\t// Say hello!
												\tcommand: prompter: {
												\t\t// save transcript to this file
												\t\tvar: file: *"out.txt" | string @tag(file)

												\t\task: cli.Ask & {
												\t\t\tprompt:   "What is your name?"
												\t\t\tresponse: string
												\t\t}

												\t\t// starts after ask
												\t\techo: exec.Run & {
												\t\t\tcmd:    ["echo", "Hello", ask.response + "!"]
												\t\t\tstdout: string // capture stdout
												\t\t}

												\t\t// starts after echo
												\t\tappend: file.Append & {
												\t\t\tfilename: var.file
												\t\t\tcontents: echo.stdout
												\t\t}

												\t\t// also starts after echo
												\t\tprint: cli.Print & {
												\t\t\ttext: echo.stdout
												\t\t}
												\t}

												The types of the commands and tasks are defined in CUE itself at
												cuelang.org/go/pkg/tool/tool.cue.

												\tcommand: [Name]: Command

												\tCommand: {
												\t\t// Tasks specifies the things to run to complete a command. Tasks are
												\t\t// typically underspecified and completed by the particular internal
												\t\t// handler that is running them. Tasks can be a single task, or a full
												\t\t// hierarchy of tasks.
												\t\t//
												\t\t// Tasks that depend on the output of other tasks are run after such tasks.
												\t\t// Use $after if a task needs to run after another task but does not
												\t\t// otherwise depend on its output.
												\t\tTasks

												\t\t// $usage summarizes how a command takes arguments.
												\t\t//
												\t\t// Example:
												\t\t//     mycmd [-n] names
												\t\t$usage?: string

												\t\t// $short is short description of what the command does.
												\t\t$short?: string

												\t\t// $long is a longer description that spans multiple lines and
												\t\t// likely contain examples of usage of the command.
												\t\t$long?: string
												\t}

												\t// Tasks defines a hierarchy of tasks. A command completes if all
												\t// tasks have run to completion.
												\tTasks: Task | {
												\t\t[name=Name]: Tasks
												\t}

												\t// Name defines a valid task or command name.
												\tName: =~#"^\\PL([-](\\PL|\\PN))*$"#

												\t// A Task defines a step in the execution of a command.
												\tTask: {
												\t\t// $id indicates the operation to run. Do not use this field directly;
												\t\t// instead unify with a task imported from one of the tool packages.
												\t\t$id: =~#"\\."#

												\t\t// $after can be used to specify a task is run after another one,
												\t\t// when it does not otherwise refer to an output of that task.
												\t\t$after?: Task | [...Task]
												\t}


												"""
									}]
								}
							}
						}
					}
				}
			}
		}
	}
}
