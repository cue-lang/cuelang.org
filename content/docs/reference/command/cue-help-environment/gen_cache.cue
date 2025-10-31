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
									hash:       "4I2R3C028U6GEP6O4MFU73OH28FGL69T9E03O1IBJ8N8394CDHOG===="
									scriptHash: "O5KKLJAC8A52EDB5PVT60BLN48IRR7JCG9CEP5K5LESC4VD5OA4G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0-rc.1.0.20251031142455-4ba957271db1:$PATH"
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
