package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-version": {
						page: {
							cache: {
								multi_step: {
									hash:       "PS5V6U3N559K3D2MPOBDLNKDDBKK5F60OTOP74794I8S9FF348NG===="
									scriptHash: "II9KLPLANNN77BMLF051S8Q6BVE6ASQ122V5RU5Q0KH4MN73NMM0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.14.0-alpha.1:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help version"
										exitCode: 0
										output: """
												print CUE version

												Usage:
												  cue version [flags]

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
