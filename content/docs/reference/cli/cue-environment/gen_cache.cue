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
									"U80JKHM9M8PCPD3M1BBUDBPOBTE0B3IMFADGJGOB6LC5Q95FEIVG====": [{
										doc:      ""
										cmd:      "cue help environment"
										exitCode: 0
										output: """
												The cue command consults environment variables for configuration.
												If an environment variable is unset or empty, it uses a sensible default
												setting.

												\tCUE_CACHE_DIR
												\t\tThe directory where the cue command keeps a cache of files to be
												\t\treused. This defaults to a directory for user-specific temporary
												\t\tcache data, such as:

												\t\t\t"$XDG_CACHE_HOME/cue" or "$HOME/.cache/cue" on Linux
												\t\t\t"$HOME/Library/Caches/cue" on MacOS
												\t\t\t"%LocalAppData%/cue" on Windows

												\tCUE_CONFIG_DIR
												\t\tThe directory where the cue command keeps configuration and
												\t\tstate files. This defaults to a directory for user-specific
												\t\tconfiguration data, such as:

												\t\t\t"$XDG_CONFIG_HOME/cue" or "$HOME/.config/cue" on Linux
												\t\t\t"$HOME/Library/Application Support/cue" on MacOS
												\t\t\t"%AppData%/cue" on Windows

												\tCUE_DEBUG
												\t\tComma-separated list of debug flags to enable. Current possible
												\t\tvalues are:
												\t\t\thttp
												\t\t\t\tPrint log messages in JSON format, one per line showing
												\t\t\t\tHTTP requests and responses made when interacting with
												\t\t\t\tmodule registries.

												\tCUE_EXPERIMENT
												\t\tComma-separated list of experiments to enable. The
												\t\tlist of available experiments may change arbitrarily over time.
												\t\tSee exp.go in package cuelang.org/go/internal/cueexperiment for
												\t\tcurrently valid values.

												\t\tWarning: This variable is provided for the development and
												\t\ttesting of the cue commands itself. Use beyond that purpose is
												\t\tunsupported.

												\tCUE_REGISTRY

												\t\tThis variable specifies which registry or registries to use for
												\t\tdownloading and publishing modules. See "cue help registryconfig"
												\t\tfor details.


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
