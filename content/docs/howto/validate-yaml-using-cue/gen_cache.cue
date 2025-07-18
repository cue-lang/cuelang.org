package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "srAHEEb9zK++BJhM0RkOwI6jSl8U1t7A6WuKkVpQaes="
								"initial x.cue":  "WKGGbL1Z6tkvZgoM4jAB7YIV+oSI1puwtQ/M4CpceVo="
								"another person": "XeOeT4HLcRCGsVSBKSx0Q77wR7Obk3bsMPyYNgtzMf8="
								"fixed yaml":     "nqIgfgchBRlxaqN0g5yWCOIl1HCKFwDkVJrPVhiqhGc="
							}
							multi_step: {
								hash:       "2DQRH8QMUHUQT5G1VP9PVSRKC4H5GP65PDLG6PCSIDD9OS1OOFBG===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
