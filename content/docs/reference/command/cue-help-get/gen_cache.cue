package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-get": {
						page: {
							cache: {
								multi_step: {
									hash:       "OHSBSDSLG6QE8GVFTPN9HC6K1Q6RU4JMF2ATO7IMCAQ44C2E28L0===="
									scriptHash: "HNV8QDFS9JCQEVIDBR7NLGL714JAJ9QQTB25B4QHSPFHV8K3SL8G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-rc.1.0.20261023142911-c9393fa32ac5:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help get"
										exitCode: 0
										output: """
												Get downloads packages or modules for non-CUE languages
												to include them in the module's pkg directory.

												Get requires an additional language field to determine for which
												language definitions should be fetched. Definitions are extracted
												from the source of the respective language and stored.
												The specifics on how dependencies are fetched and converted vary
												per language and are documented in the respective subcommands.

												For information on native CUE modules:

												    cue help modules

												Usage:
												  cue get <language> [flags] [packages]
												  cue get [command]

												Available Commands:
												  crd         convert Kubernetes CRDs to packages in the current module
												  go          add Go dependencies to the current module

												Global Flags:
												  -E, --all-errors[=true|false]   print all available errors
												  -C, --chdir string              change working directory before running command (must be the first flag)
												  -i, --ignore[=true|false]       proceed in the presence of errors

												Use "cue get [command] --help" for more information about a command.

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
