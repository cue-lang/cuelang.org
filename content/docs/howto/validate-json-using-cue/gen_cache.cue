package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "y0jVdzmIgYupgGtSVT3Deh1QNqjHGeeTq3zscKIcoWE="
								"x.cue":        "yff9qBPg6yBHZBF6pjQoI9PofqRV2+wtnGgy8RAsAu0="
								"x.json v2":    "vdHoCv/fZ22TTDnSiw5+rn89HGk0kEe17kTTKQpjMNk="
								"fixed x.json": "c+9Xpwiv+c6EamsC6XRtBDisyvkBt1/WIS2XXL64Hyw="
							}
							multi_step: {
								hash:       "R3P5UF9E29261Q1I862IECE0TEFFHTLE38U52DCSHI96P16INH90===="
								scriptHash: "U165M0FDB210K43KGC992DB07G23RP7ULJKBO7O7UJ28GPM1DEFG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.json:15:20

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.json"
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
