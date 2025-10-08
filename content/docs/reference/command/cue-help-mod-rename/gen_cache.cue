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
									hash:       "8LO0T64CNFJHGO00LO8G4S7D9FT34V1RBOR4NDPS7AMCE41BM8K0===="
									scriptHash: "1GN2A7G8Q6P3SJ0KQR5CF00FD79AFQ81MC4ATEQPETGJP2T3PLNG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.14.1:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help mod rename"
										exitCode: 0
										output: """
												Rename changes the name of the current module,
												updating import statements in source files as required.

												Note that this command is not yet stable and may be changed.

												Usage:
												  cue mod rename <newModulePath> [flags]

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
