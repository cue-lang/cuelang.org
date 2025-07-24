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
									hash:       "NCENVBUADVQBAT9M5CD346N82DT452TMV26S817QS7OOL3NUR33G===="
									scriptHash: "SCT6KDKV23SBUFNVN9OEFQVU59KQDK0NBJB0KA5UUUG0740HNSH0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.14.0-rc.1.0.20250724155554-6d101321cb41:$PATH"
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
