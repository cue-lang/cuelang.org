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
									hash:       "554O2CT5KB1QEEBU1MIR2VJ1EFLRQ4UB586625J0J1942HO2B780===="
									scriptHash: "5QIGEACURON473SMMKH8SL4S59K2HQJVK9405AP0H9CV7G1PIPMG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.0:$PATH"
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
