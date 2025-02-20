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
									hash:       "V831NQ4VEL3EJFKAOERU9U7JTMCVOCV5UOPB1LVDPJTCRN18JI80===="
									scriptHash: "7UFECT2PAGBRLO03STEOCLMJG3LOSBEUJH02U2MJGJ7N60ESDB8G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.0-0.dev.0.20250221114952-15a702eab521:$PATH"
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
