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
									hash:       "7TLII6DAG32P77LO5VVJFM2J3B5FII1F4QIS02VI2SVAI4P4FJUG===="
									scriptHash: "LD30N9RL9LN0SHGK18UP6MMCSGERLSTLVE79CNBECQTL663HQJD0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0-0.dev.0.20250808151001-88adc227ad53:$PATH"
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
