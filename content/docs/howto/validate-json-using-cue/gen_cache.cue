package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "NNnxhItQxX5LndGUJUPfBPZb1/t55a5PhPfEPiwNj+w="
								"x.cue":        "jIMCnoQE5XbD4TrahH/r8oGF3trkrx5jvYUwKS0q450="
								"x.json v2":    "Z/cS9h90sxFmmT7EV6hzomPtq7cxajhmjLmbh4Mzk48="
								"fixed x.json": "Bw1SvJSM7F1/Amsj1dlCEiGWp4jj0PJ4Wbe6QuCR3Sc="
							}
							multi_step: {
								hash:       "HCDPREGPA4J3I89P60CSCR5RQJ2AQ4Q88E739J43435NO9OBQ92G===="
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
