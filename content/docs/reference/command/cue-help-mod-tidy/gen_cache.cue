package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-mod-tidy": {
						page: {
							cache: {
								multi_step: {
									hash:       "D8P8UIU44NHIODCK1E8H2BS6AJIPKODPNTTHOJMSRNQIL60U46QG===="
									scriptHash: "O1LU7NVQPP0R7AUDBQRUN4MFF5H78I1JDHVIAQIS3O5HJNHR3S60===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.19.0-0.dev.0.20261113115251-a5a9a9c5a2df:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help mod tidy"
										exitCode: 0
										output: """
												Tidy resolves all module dependencies in the current module and updates
												the cue.mod/module.cue file to reflect them.

												It also removes dependencies that are not needed.

												It will attempt to fetch modules that aren't yet present in the
												dependencies by fetching the latest available version from
												a registry.

												See "cue help environment" for details on how $CUE_REGISTRY is used to
												determine the modules registry.

												Usage:
												  cue mod tidy [flags]

												Flags:
												      --check[=true|false]        check for tidiness after fetching dependencies; fail if module.cue would be updated
												      --local-only[=true|false]   only update cue.mod/local-module.cue, leaving cue.mod/module.cue unchanged

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
