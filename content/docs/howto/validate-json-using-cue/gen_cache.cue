package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "k8f9PnWe+4BZL30JPYBVzwEDNc7gS5wjdtkIpJcGt/k="
								"x.cue":        "Qg/6GarkIRgp2/fNGvaO3CRJpJXKde014K4Os+a3pGE="
								"x.json v2":    "ifd7i8d3qWyMofpob72CkfDTchQmXkaQ+FbzHtG+ZaQ="
								"fixed x.json": "kmnC2NC6IG+ilJk/OfrOjYIRjVhvbQqDG51+hFkZ67U="
							}
							multi_step: {
								hash:       "P4NOGOF6J3SBK4SURSO98ESA38R9VL8N2CEC06F6VRLUCF3AFCU0===="
								scriptHash: "HHB3582H40QFQK7U74QQRK0GB24M00NKJQDCTTKAEPL5Q2NDA2I0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.json"
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
