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
									hash:       "OJ34SUH42UBCJ29MQ89DNE9AD90IMD6IIO8CLV8CERIV2B70IVUG===="
									scriptHash: "AODEOSP9BTF5DDSSSTO8127QBOQJ202M57AEKHKUN2VJKTII01S0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0-0.dev.0.20250815110336-a2eed3278a6c:$PATH"
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
