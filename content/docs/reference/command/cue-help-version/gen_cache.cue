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
									hash:       "6FM98UJV18KU9K9F8HK8A5RNCK7KJFJHU3HSS5O2K5HFCAHUTA80===="
									scriptHash: "9O7EDBT51QGTPNGGQ2VM0DU2RT88G50T58HTPFPVTNRQ6AN98EHG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.19.0-0.dev.0.20261119142547-4feb85fac20e:$PATH"
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
