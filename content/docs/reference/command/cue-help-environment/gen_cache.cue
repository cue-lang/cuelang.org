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
									hash:       "7KFVD6C82P88QDI53041RFD4FV0T929E7I5KS07MRGMRFH0KKGNG===="
									scriptHash: "B4PO2M197NKIE57HQT20I44UD39VRN4DSHF7ILP26D28PH97TMJ0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-0.dev.0.20260702073200-7686325819d2:$PATH"
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
												\t\t\thttp enables JSON logging per HTTP request and response made
												\t\t\twhen interacting with module registries.
												\t\tstrict
												\t\t\tstrict sets whether extra aggressive checking should be done.
												\t\t\tThis should typically default to true for pre-releases and default to
												\t\t\tfalse otherwise.
												\t\tlogeval
												\t\t\tlogeval sets the log level for the evaluator.
												\t\t\tThere are currently only two levels:
												\t\t\t0: no logging
												\t\t\t1: logging
												\t\tsharing
												\t\t\tsharing enables structure sharing.
												\t\tsortfields
												\t\t\tsortfields forces fields in a struct to be sorted
												\t\t\tlexicographically.
												\t\topendef
												\t\t\topendef disables the check for closedness of definitions.
												\t\ttoolsflow
												\t\t\ttoolsflow causes [cuelang.org/go/tools/flow] to print a task dependency mermaid graph.
												\t\tparsertrace
												\t\t\tparsertrace causes [cuelang.org/go/cue/parser] to print a trace of parsed productions.

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
