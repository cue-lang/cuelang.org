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
									hash:       "MNT1D63F0TA0621MKNLSB7E84LVUINRSVU0D8ENPEHR67L5PO050===="
									scriptHash: "B59I9BMRIKEO31JBU547LFPPE5CSATPUONBDP8D1PARD1DL5FIVG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.0-rc.1.0.20260314205741-820e1530e9ff:$PATH"
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
												      --check   check for tidiness after fetching dependencies; fail if module.cue would be updated

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output

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
