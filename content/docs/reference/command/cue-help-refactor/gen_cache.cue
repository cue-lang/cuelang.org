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
									hash:       "BAB4LBFEHTI213A5G9F1FA3356O7B74PN99S17QECH46N5CNG370===="
									scriptHash: "NA2MKGDSE7AL1UGBK5DS9Q82CP8CK0QG8CM4UDSBEQDVFBR1OSU0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.0-0.dev.0.20250225142354-26a698fe9ae9:$PATH"
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
