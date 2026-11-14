package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-environment": {
						page: {
							cache: {
								multi_step: {
									hash:       "0RFUI5S33E2TAC4C774B0HKDDKVRSAQD84EILASO2FG4QR0E1LLG===="
									scriptHash: "SC0AN6MFS0Q031VLKU1MP5A8A9INVR2H0QGU9SRATO01S380CAHG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.19.0-0.dev.0.20261113115251-a5a9a9c5a2df:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help environment"
										exitCode: 0
										output: """
												The cue command consults environment variables for configuration.
												If an environment variable is unset or empty, sensible default setting is used.

												\tCUE_CACHE_DIR
												\t\tA directory structure to hold files which are reused between operations.
												\t\tIt defaults to a directory for user-specific temporary data, such as:

												\t\t- "$XDG_CACHE_HOME/cue" or "$HOME/.cache/cue" on Linux
												\t\t- "$HOME/Library/Caches/cue" on MacOS
												\t\t- "%LocalAppData%/cue" on Windows

												\t\tIts contents are generally read-only and include:

												\t\t- mod/download for modules fetched from registries
												\t\t- mod/extract for extracted module archives

												\tCUE_CONFIG_DIR
												\t\tA directory to hold configuration and long-lived state files.
												\t\tIt defaults to a directory for user-specific persistent data, such as:

												\t\t- "$XDG_CONFIG_HOME/cue" or "$HOME/.config/cue" on Linux
												\t\t- "$HOME/Library/Application Support/cue" on MacOS
												\t\t- "%AppData%/cue" on Windows

												\tCUE_REGISTRY
												\t\tThe configuration to use when downloading and publishing modules.
												\t\tSee "cue help registryconfig" for details.

												\tCUE_EXPERIMENT
												\t\tComma-separated list of experiment flags to enable or disable.
												\t\tSee "cue help experiments" for details.

												\tCUE_DEBUG
												\t\tComma-separated list of debug flags to enable or disable, such as:

												\t\thttp
												\t\t\tEnables JSON logging per HTTP request and response made
												\t\t\twhen interacting with module registries.
												\t\tstrict
												\t\t\tSets whether extra aggressive checking should be done.
												\t\tlogeval
												\t\t\tSets the log level for the evaluator.
												\t\t\tThere are currently only two levels:
												\t\t\t0: no logging
												\t\t\t1: logging
												\t\tsharing
												\t\t\tEnables structure sharing.
												\t\tsortfields
												\t\t\tForces fields in a struct to be sorted
												\t\t\tlexicographically.
												\t\topendef
												\t\t\tDisables the check for closedness of definitions.
												\t\ttoolsflow
												\t\t\tCauses cuelang.org/go/tools/flow to print a task dependency mermaid graph.
												\t\tparsertrace
												\t\t\tCauses cuelang.org/go/cue/parser to print a trace of parsed productions.

												CUE_EXPERIMENT and CUE_DEBUG are comma-separated lists of key-value strings,
												where the value is a boolean "true" or "1" if omitted. For example:

												\tCUE_EXPERIMENT=toenable,todisable=0


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
