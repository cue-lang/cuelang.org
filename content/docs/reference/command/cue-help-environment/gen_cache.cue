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
									hash:       "RE9LNR5TE39OCO6JN6U8TSAQM3AK2DBDC21BAO294UFTGK8E7GTG===="
									scriptHash: "G0RDBEJR7F6RHDDUSHCQHF1KQI9M7MHHA43RTJKO33IMQB7UC4EG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.12.0:$PATH"
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

												\t\tevalv3
												\t\t\tEnable the new CUE evaluator, addressing performance issues
												\t\t\tand bringing a better disjunction algorithm.
												\t\tembed
												\t\t\tEnable support for embedded data files as described in
												\t\t\thttps://cuelang.org/discussion/3264.
												\t\tdecodeint64 (default true)
												\t\t\tTweak cue.Value.Decode to choose "int64" rather than "int"
												\t\t\tas the default Go type for CUE integer values.
												\t\ttoposort
												\t\t\tEnable topological sorting of struct fields.
												\t\t\tProvide feedback via https://cuelang.org/issue/3558

												\tCUE_DEBUG
												\t\tComma-separated list of debug flags to enable or disable, such as:

												\t\thttp
												\t\t\tLog a JSON message per HTTP request and response made
												\t\t\twhen interacting with module registries.
												\t\tsortfields
												\t\t\tForce fields in stucts to be sorted lexicographically.
												\t\topeninline (default true)
												\t\t\tPermit disallowed fields to be selected into literal struct
												\t\t\tthat would normally result in a close error, mimicking evalv2
												\t\t\tclosedness behavior in evalv3 to aid the transition.

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
