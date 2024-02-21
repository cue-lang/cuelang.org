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
									"GHHIHKI3QOCLVQ027HBVJERKJHR6P6OKCUI94NI68UTTA1ODIEQG====": [{
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
												\t\tA comma-separated list specifying which registry to use for
												\t\tdownloading and publishing modules. A registry is specifed as
												\t\tfollows:

												\t\t\t[modulePrefix=]hostname[:port][/repoPrefix][+insecure]

												\t\tThe optional modulePrefix specifes that all modules with the
												\t\tgiven prefix will use the associated registry. If there are
												\t\tmultiple registries with a prefix, the longest matching prefix
												\t\twins. When matching a prefix, only complete path elements
												\t\t(non-slash characters) are considered.

												\t\tThe hostname holds the OCI registry host (in square brackets if
												\t\tit's an IPv6 address). The repoPrefix holds a prefix to use in
												\t\tfront of all repositories in the registry. If there's a
												\t\t"+insecure" suffix, it specifies that an insecure HTTP
												\t\tconnection should be used to this registry; otherwise the
												\t\tdefault is secure except for localhost addresses.

												\t\tFor example, given:

												\t\t\tCUE_REGISTRY=public-registry.com,github.com/acmecorp=registry.acme.com:6000/modules

												\t\t- the module named github.com/foo/bar will be fetched
												\t\t  from the github.com/foo/bar repository in the registry host
												\t\t  public-registry.com
												\t\t- a module named github.com/acmecorp/somemodule will
												\t\t  be fetched from the modules/github.com/acmecorp/somemodule
												\t\t  repository in the host registry.acme.com at port 6000
												\t\t- a module named github.com/acmecorpus/x will be
												\t\t  fetched from the github.com/acmecorpus/x repository in the
												\t\t  host public-registry.com

												\t\tRequires that CUE_EXPERIMENT=modules is enabled.

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
