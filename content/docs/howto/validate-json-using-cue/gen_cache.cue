package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "nbzSBc1dq4XLhxlyvDcG3mVnHC5Uqmke2O4G2n8Rqjg="
								"x.cue":        "PPWPBqcfd9UiZ78dwwVqiI8lvBTlCox66beHREotNXM="
								"x.json v2":    "ylbElGVwWnNJinyZEPUEf/udoPCAH7rJkU4jBC5CR/0="
								"fixed x.json": "Ddrlm1Sm9StLrlcjyJ4FjWFVWgtWUKQg2t9FNf99tHQ="
							}
							multi_step: {
								hash:       "NJ4ORSGPUAD78K2440SUT579I07G97MKFPU7IJOTNERN1G2EQ3E0===="
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
