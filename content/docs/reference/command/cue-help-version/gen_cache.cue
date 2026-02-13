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
									hash:       "483N3F7RKT8BSQSKDS9VUH4P60UE0U62PV5IAREKLABGSL54ASC0===="
									scriptHash: "52JJR84RIRM3NCMPOTSK5RHFIB4QTOB87F1UFHRPTJF110G6DO8G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.15.4:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help version"
										exitCode: 0
										output: """
												print the CUE version and build information

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
