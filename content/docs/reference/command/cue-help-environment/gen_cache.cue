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
									hash:       "TI5H947RF4G4EBB9BRDINPBFUOD9TMUS841CF34MV1P07ARISPDG===="
									scriptHash: "JM5P0I1IDI53U15IIHH0VHEH5UV0MPML9VI97LM9BT42JR5EO5U0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.2:$PATH"
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
												\t\tComma-separated list of experiment flags to enable or disable:

												\t\tevalv3 (default true)
												\t\t\tEnable the new CUE evaluator, addressing performance issues
												\t\t\tand bringing a better disjunction algorithm.
												\t\tembed (default true)
												\t\t\tEnable support for embedded data files as described in
												\t\t\thttps://cuelang.org/discussion/3264.
												\t\ttoposort (default true)
												\t\t\tEnable topological sorting of struct fields.
												\t\t\tProvide feedback via https://cuelang.org/issue/3558
												\t\tcmdreferencepkg
												\t\t    Require referencing imported tool packages to declare "cue cmd" tasks.

												\tCUE_DEBUG
												\t\tComma-separated list of debug flags to enable or disable, such as:

												\t\thttp
												\t\t\tLog a JSON message per HTTP request and response made
												\t\t\twhen interacting with module registries.
												\t\tsortfields
												\t\t\tForce fields in stucts to be sorted lexicographically.
												\t\ttoolsflow
												\t\t\tPrint task dependency mermaid graphs in 'cue cmd'.
												\t\tparsertrace
												\t\t\tPrint a trace of parsed CUE productions.

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
