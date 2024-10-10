package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help": {
						page: {
							cache: {
								multi_step: {
									hash:       "U7VT1L54JHGSEBHDV3VIC4S2FL93E7FRTJ57LJ51KQF02LM7MLMG===="
									scriptHash: "VLC8CVP03NLVG8HQNQNJATQENR1Q3O2UKK3JH01F27V5ABP5KEG0===="
									steps: [{
										doc:      ""
										cmd:      "cue help"
										exitCode: 0
										output: """
												cue evaluates CUE files, an extension of JSON, and sends them
												to user-defined commands for processing.

												Commands are defined in CUE as follows:

												\timport "tool/exec"
												\tcommand: deploy: {
												\t\texec.Run
												\t\tcmd:   "kubectl"
												\t\targs:  ["-f", "deploy"]
												\t\tin:    json.Encode(userValue) // encode the emitted configuration.
												\t}

												cue can also combine the results of http or grpc request with the input
												configuration for further processing. For more information on defining commands
												run 'cue help cmd' or go to cuelang.org/pkg/cmd.

												For more information on writing CUE configuration files see cuelang.org.

												Usage:
												  cue [command]

												Available Commands:
												  cmd         run a user-defined workflow command
												  completion  Generate completion script
												  def         print consolidated definitions
												  eval        evaluate and print a configuration
												  export      output data in a standard format
												  fix         rewrite packages to latest standards
												  fmt         formats CUE configuration files
												  get         add non-CUE dependencies to the current module
												  import      convert other formats to CUE files
												  login       log into a CUE registry
												  mod         module maintenance
												  trim        remove superfluous fields
												  version     print CUE version
												  vet         validate data

												Use "cue help [command]" for more information about a command.

												Additional help topics:
												  cue help commands       user-defined commands
												  cue help embed          file embedding
												  cue help environment    environment variables
												  cue help filetypes      supported file types and qualifiers
												  cue help flags          common flags for composing packages
												  cue help injection      inject files or values into specific fields for a build
												  cue help inputs         package list, patterns, and files
												  cue help modules        module support
												  cue help registryconfig module registry configuration

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
