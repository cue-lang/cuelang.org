package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "NIefnQCBfS6lj205jGg+qL7ba0OTcARKVBYN6h80eF0="
								"initial x.cue":  "0KB9ulaNolla+x6pQcw2E8bADl9NuHND3a9N7cn8uuM="
								"another person": "M+T+mHyR6V5M4v9AWF3+/TS1F4A5pZFZJ1Q2IHVd+mg="
								"fixed yaml":     "XSTs6IDgfATAjouDj+fkyehxFusOPNc92NmNzdVFDWI="
							}
							multi_step: {
								hash:       "DR0NUARET4MMBR2937E17L01DA6P0SVJRBUPFOQE3U1L6603MBUG===="
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
