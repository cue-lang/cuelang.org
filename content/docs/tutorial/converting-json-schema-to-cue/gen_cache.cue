package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "Pz7OLWfba2wwR6mOkd9JLpS6ilhaYqLbOgdfHdjXdDY="
								"schema.cue":         "N0tFwbtaMjiWojeUVbAQ1cI0dbNQMIpomwCyx6jXaX8="
								"split_pea.yml":      "AMi+UKmPyYoqBZKhOKF06VXJtJLl1kcJmICRrPPstog="
								"pomodoro.yml":       "5Hui4jFkXD6n03WccNnFDwKQRRcLopgYBVn1BKDQGGI="
								"pomodoro.yml fixed": "C27lcxN3BW2O/hT2ENbt7/7tzwcACbd2d6qWVi7vQyA="
							}
							multi_step: {
								hash:       "37FJFII1GS9UQHC3T6TV219VPLS1DB4RBS0UU97DQPUDH2A2Q9P0===="
								scriptHash: "S1P1N4BEQ13PVKLHR7S49GT6BCDNEBPHJ3GI7AJEV2HUL129L28G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.1
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cp schema.cue .schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -u .schema.cue schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:13:17
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c -d '#restaurant' schema.cue *.yml"
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
