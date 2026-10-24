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
									hash:       "OPU76GEJ468FGD7BKINRI5NVTGMUEL05CCQTG2AQIINPDFS31LM0===="
									scriptHash: "UO8V8I7L9UHPQA07FHVEJIS26GEIFAEU81VGTUMQRI74U8ECDJ10===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-rc.1.0.20261023142911-c9393fa32ac5:$PATH"
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
