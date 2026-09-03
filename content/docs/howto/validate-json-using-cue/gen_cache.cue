package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "1BmaNshIF87UFdGT+tJS0S4s4WGzy2GDefSGdEK0gEg="
								"x.cue":        "gqczRKOCbxNKlQNGDdCtiVoJ4OvLSkZcu9Jpyf5UsDY="
								"x.json v2":    "ESSuIuzPHaKDcOC0UCHBGw/hV9qyC0++YNCWw3UC3es="
								"fixed x.json": "mEGKREByChEbjWzTgpCe/f9OcfYG+sJA6EMvXGqP3pw="
							}
							multi_step: {
								hash:       "UIH08ODUQPSOJ8NDVVRLI5Q7SDR6ISRVV15GL05MK4R1EHAMUFB0===="
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
