package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "VE1EhTuzgiFqQfKKv+a1jQC+gtqsXB/hK2OnMv+H6iM="
								"x.cue":        "LGpd+74GGb50AmBTT03TO2kpXXDoFGsGz/RvFNyQKZY="
								"x.json v2":    "zKjWG0T5Pqj7VJ1YKtuUzq8w2ZG+a89GlZ75f/2wVNM="
								"fixed x.json": "kiV/Ro7TTt4VUBUPyMOEAI7xucxthAOEBbROyaSsK1o="
							}
							multi_step: {
								hash:       "RUS0MMTG60FVBP7802JA38PLC5647L7F29IBSMBIN4CGJQA28DQ0===="
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
