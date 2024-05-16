package site
{
	content: {
		docs: {
			howto: {
				"validate-json-using-cue": {
					page: {
						cache: {
							upload: {
								"x.json":       "AD+0czFNb4t+we4JIAJgstRULqmgia8RQ6cXvjJElUo="
								"x.cue":        "0BRxt/JUu1FHL/GXf8fA7svOV+h8rEVDN6J6YjqHQlU="
								"x.json v2":    "8T4tsQdkHs9uVTThMDP9NK8UxZvha8xPg+TSQtoApFY="
								"fixed x.json": "Y43Ajweu5gzERMCJp0MT0HrFAFoZpXEcevMffzR9KbQ="
							}
							multi_step: {
								hash:       "TEE73M05Q6ECN3DRQ41L8LFI56PQ9FUA6K77IE4KCPPJLH50MF5G===="
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
