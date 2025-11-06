package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-refactor": {
						page: {
							cache: {
								multi_step: {
									hash:       "9S3SO4VT6G3U7NOHNJS5DD1HFM8TV1J50BEUVORV75B72VL3IGD0===="
									scriptHash: "15493RR6PU6JV8GRQBPCUIBQJGUB4FF7KFF9AOK3EM6NQ4K471K0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.0:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help refactor"
										exitCode: 0
										output: """
												This command groups together commands relating
												to altering code within the current CUE module.

												Usage:
												  cue refactor <cmd> [arguments] [flags]

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
