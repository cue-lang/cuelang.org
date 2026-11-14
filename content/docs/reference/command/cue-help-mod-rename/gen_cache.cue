package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-mod-rename": {
						page: {
							cache: {
								multi_step: {
									hash:       "360B5CA723NVRS1622EDTSEKK0GSTPM8URR4OOSAFE00KVMLFKH0===="
									scriptHash: "7EF82VCT38BB80K3P8GRI4JM1H313JUPBVFD8TB3NTAF9JUFNVTG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.19.0-0.dev.0.20261113115251-a5a9a9c5a2df:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help mod rename"
										exitCode: 0
										output: """
												Rename changes the name of the current module,
												updating import statements in source files as required.

												Usage:
												  cue mod rename <newModulePath> [flags]

												Global Flags:
												  -E, --all-errors[=true|false]   print all available errors
												  -C, --chdir string              change working directory before running command (must be the first flag)
												  -i, --ignore[=true|false]       proceed in the presence of errors

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
