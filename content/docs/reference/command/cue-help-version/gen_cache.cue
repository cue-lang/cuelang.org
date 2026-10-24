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
									hash:       "3OR719IT1BQGJMGP6C3GDEQNJNK9RH1K6VHDKGPA2PUPJ0DOHBKG===="
									scriptHash: "93AD0PT6A3T35A4LTKTETQ7LBFFL8PRIMAPSRC9E6PU2C3DSGQOG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-rc.1.0.20261023142911-c9393fa32ac5:$PATH"
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
												  -E, --all-errors[=true|false]   print all available errors
												  -C, --chdir string              change working directory before running command (must be the first flag)
												  -i, --ignore[=true|false]       proceed in the presence of errors

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
