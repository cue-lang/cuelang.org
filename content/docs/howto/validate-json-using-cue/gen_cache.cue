package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "mFEjpOPSQYpB5uYBn9YeOSh+OYZn98CjSCpfsHQpS0Y="
								"x.cue":        "Q7ZLypHbaGrwYFmNgccFN9oenuwJsUJsPw+306Cwvko="
								"x.json v2":    "2uxKbM0o0y9VDRAh/BCA6mmP6tdt5VMN3gjFv3z6xmc="
								"fixed x.json": "Qy87MM/RA9Dr9maIW+5of0IdURlTAXDpQ6BVa2xo4tM="
							}
							multi_step: {
								hash:       "LJRKTDCJMPL9922709BNVCK9930OEVFEO3UK94AJ0ANOE7BSRNN0===="
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
