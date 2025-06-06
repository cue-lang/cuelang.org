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
									hash:       "FJI7VTQJ3I54CJ210OSS3ILA5UA04GK8UA1FGSLNQ6FSIGGCB2S0===="
									scriptHash: "9ODK8SC7BKBE9KINM5A31QO9U2G24T8L9OTMTEP84I6G1MI31MIG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.14.0-0.dev.0.20250606135340-250524b0d6e0:$PATH"
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

												Note that this command is not yet stable and may be changed.

												Usage:
												  cue mod tidy [flags]

												Flags:
												      --check   check for tidiness after fetching dependencies; fail if module.cue would be updated

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output
												      --trace        trace computation
												  -v, --verbose      print information about progress

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
