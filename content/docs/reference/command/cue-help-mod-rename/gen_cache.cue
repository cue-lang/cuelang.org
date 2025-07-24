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
									hash:       "0CQLVHB7P7LBNUDMB2ASUF80TI2547P976T9DMK1KHIQ5R0DS0O0===="
									scriptHash: "UBJHLNT6NBSSSSSKFGENUGSN79UPG6U489H1S2O8EESI32S6QJM0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.14.0-rc.1.0.20250724155554-6d101321cb41:$PATH"
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
