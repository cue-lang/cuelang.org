package site
{
	content: {
		docs: {
			reference: {
				cli: {
					"cue-environment": {
						page: {
							cache: {
								multi_step: {
									"FN2GK1NAGMMKCAO67IDNSQ67793R3IE1VBAD6LPFECPI19N3DODG====": [{
										doc:      ""
										cmd:      "cue help environment"
										exitCode: 0
										output: """
												The cue command consults environment variables for configuration.
												If an environment variable is unset or empty, it uses a sensible default
												setting.

												\tCUE_CONFIG_DIR
												\t\tThe directory where the cue command keeps configuration and
												\t\tstate files. This defaults to a directory for user-specific
												\t\tconfiguration data, such as:

												\t\t\t"$XDG_CONFIG_HOME/cue" or "$HOME/.config/cue" on Linux
												\t\t\t"$HOME/Library/Application Support/cue" on MacOS
												\t\t\t"%AppData%/cue" on Windows

												\tCUE_CACHE_DIR
												\t\tThe directory where the cue command keeps a cache of files to be
												\t\treused. This defaults to a directory for user-specific temporary
												\t\tcache data, such as:

												\t\t\t"$XDG_CACHE_HOME/cue" or "$HOME/.cache/cue" on Linux
												\t\t\t"$HOME/Library/Caches/cue" on MacOS
												\t\t\t"%LocalAppData%/cue" on Windows

												\tCUE_REGISTRY

												\t\tThis variable specifies which registry or registries to use for
												\t\tdownloading and publishing modules. See "cue help registryconfig"
												\t\tfor details.

												\tCUE_EXPERIMENT
												\t\tComma-separated list of experiments to enable or disable. The
												\t\tlist of available experiments may change arbitrarily over time.
												\t\tSee exp.go in package cuelang.org/go/internal/cueexperiment for
												\t\tcurrently valid values.

												\t\tWarning: This variable is provided for the development and
												\t\ttesting of the cue commands itself. Use beyond that purpose is
												\t\tunsupported.


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
