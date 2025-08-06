package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "9EuWIrfereu2vpNOT7Vr2UV/VQyrEZXH5ejqeKQPgsU="
								"x.cue":        "V9VkymFM966CRAEPB4ca+DJX8k3kJJm8RxNEyexj8yc="
								"x.json v2":    "yBgJpRPSAJZTIgU5jbje078L2nTVQ9EYktaftFB6Nt4="
								"fixed x.json": "pdPXCZirrFnv+bR8jFq+vDR5wnBV9d6l4t5gJV242R8="
							}
							multi_step: {
								hash:       "RGD4Q6EOM5O7HGGRVO3A9B4UAA37O7NCNV7P7H7LHHFPP6A3NEMG===="
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
