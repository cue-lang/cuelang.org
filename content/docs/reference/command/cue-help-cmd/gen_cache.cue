package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-cmd": {
						page: {
							cache: {
								multi_step: {
									hash:       "53JPPQ0UUP86GDA4EI7OKF9S9PT1BESTKMHSFCIIBB28500CBE70===="
									scriptHash: "01PL290CFJTAD2EB0NPJHRI1GBMKFEMHM3J9VTD5QVSM9JOL0OM0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.14.0:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help cmd"
										exitCode: 0
										output: """
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
