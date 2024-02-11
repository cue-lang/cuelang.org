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
									"DV08GG27OKFI7TFB1ENIR7QEGRS2UQ3T5K6H8QS0GPLP8HO74TVG====": [{
										doc:      ""
										cmd:      "cue help environment"
										exitCode: 0
										output: """
												The cue command consults environment variables for configuration.
												If an environment variable is unset or empty, it uses a sensible default
												setting.

												\tCUE_CONFIG_DIR
												\t\tThe directory where the cue command keeps configuration and state files.
												\t\tThis defaults to a directory for user-specific configuration data, such as:

												\t\t\t"$XDG_CONFIG_HOME/cue" or "$HOME/.config/cue" on Linux
												\t\t\t"$HOME/Library/Application Support" on MacOS
												\t\t\t"%AppData%/cue" on Windows

												\tCUE_REGISTRY
												\t\tA comma-separated list specifying which registry to use for
												\t\tdownloading and publishing modules. A registry is specifed
												\t\tas follows:

												\t\t\t[modulePrefix=]hostname[:port][/repoPrefix][+insecure]

												\t\tThe optional modulePrefix specifes that all modules with the
												\t\tgiven prefix wil use the associated registry. If there are
												\t\tmultiple registries with a prefix, the longest matching prefix wins.

												\t\tThe hostname holds the OCI registry host (in square brackets if it's
												\t\tan IPv6 address).  The repoPrefix holds a prefix to use in front
												\t\tof all repositories in the registry.  If there's a "+insecure"
												\t\tsuffix, it specifies that an insecure HTTP connection should be
												\t\tused to this registry; otherwise the default is secure except
												\t\tfor localhost addresses.

												\t\tFor example, given:
												\t\t\tCUE_REGISTRY=public-registry.com,github.com/acmecorp=registry.acme.com:6000/modules
												\t\tthe module named github.com/foo/bar will be fetched
												\t\tfrom public-registry.com; a module named
												\t\tgithub.com/acmecorp/somemodule will be fetched from the
												\t\tmodules/github.com/acmecorp/somemodule repository in the host
												\t\tregistry.acme.com at port 6000.

												\t\tRequires that CUE_EXPERIMENT=modules is enabled.

												\tCUE_MODCACHE
												\t\tThe directory where the cue command will store downloaded
												\t\tmodules.

												\t\tRequires that CUE_EXPERIMENT=modules is enabled.

												\tCUE_EXPERIMENT
												\t\tComma-separated list of experiments to enable or disable.
												\t\tThe list of available experiments may change arbitrarily over
												\t\ttime.  See exp.go in package cuelang.org/go/internal/cueexperiment for
												\t\tcurrently valid values.

												\t\tWarning: This variable is provided for the development and
												\t\ttesting of the cue commands itself. Use beyond that purpose
												\t\tis unsupported.


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
