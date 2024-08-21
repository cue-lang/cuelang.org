package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "FHlkgcVz6uNn5E384Q7SbiJvxUxqxeKRo3/z+Lg56cs="
								"x.cue":        "NOvZ9XX1LH/HOs5DifbqcKC+DqFjxjCARZ2jHAT/HPI="
								"x.json v2":    "cPxuZmAq4QGD3gS3p8re9N7UbJ97Hvuv1x8fpU8K+ck="
								"fixed x.json": "ZiqnYQDTsRNwaM+2AFU/VVX5VEI9uupGaKGtCO2yw5s="
							}
							multi_step: {
								hash:       "E3S8U33CS4EGNMGBC2SK4PSU8PI17C5RFRT345QI8D2K4T74FE20===="
								scriptHash: "UMP1JTJB5F0SVS45CSPDVU8KSNKPQ7SI0OEVSC7IQVT5NDCE1PM0===="
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
