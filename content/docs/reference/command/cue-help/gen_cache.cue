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
									hash:       "NUNA3A8L3T56ALR7682L4AK0S4ETKV4J66DGQI7U14NMHG431FT0===="
									scriptHash: "GLF9LIIK8KLN2KQOJE3VV8B5LV1GMILVCQS78N0Q02FFD82A9BSG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.0-alpha.2.0.20250328144635-721ca5db06fc:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help"
										exitCode: 0
										output: """
												CUE makes it easy to validate data, write schemas,
												and ensure configurations align with policies.

												CUE works with a wide range of tools and formats that you're already using
												such as Go, JSON, YAML, OpenAPI, and JSON Schema.

												For more information and documentation, see: https://cuelang.org

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
