package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "rKFHusJpIYqBWmFyaNkmr60oPyVI4TaDICQ+udlvKYU="
								"x.cue":        "pv69NifJ1DKkW6kFOaZKxUUETb8x54Ldnjo4rk3eFaY="
								"x.json v2":    "7IN10+n91X7Nh/SgN5CUtQXCUvfD0yBwWx0QwLdAgs4="
								"fixed x.json": "q04/5V6Z+YVcWMwP68x4TEDQehaQIrFx1OevkZAvCZ4="
							}
							multi_step: {
								hash:       "8G7I2UQ03LQD3QSR4PBG83FDIP8J6POARL4S3IOV6F6VBG0021S0===="
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
