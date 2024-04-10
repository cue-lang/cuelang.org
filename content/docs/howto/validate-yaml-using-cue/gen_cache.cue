package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "HqQfkFySkEwgn/SQCsKt3PI4L65VH/2KSMZG9ZhjrC4="
								"initial x.cue":  "q2SoBLQb3qn/u4hNHaNRX99dCcUQHFSs4MomYHMuxJQ="
								"another person": "GZDcGN7mTvL8WzKXpqpUskaSrQjw6M5LSeFJ1YCxKOE="
								"fixed yaml":     "vDHTPmPyxmsX+NxluGdtLSGuw1w1OCvzvdIWfjMH8Wk="
							}
							multi_step: {
								hash:       "AJLQG5AI7107RF4IFMIUUUTAC862I2UCGDHK55GH3NECOAFS2CGG===="
								scriptHash: "DE9VH3D0G7UR7VTKS164SH6455EO8BDDJ06SC0TH6SBBKB4RMM60===="
								steps: [{
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet x.cue x.yaml"
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
