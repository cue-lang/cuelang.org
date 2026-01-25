package site
{
	content: {
		docs: {
			concept: {
				"using-the-cue-export-command": {
					output: {
						page: {
							cache: {
								code: {
									"default output":             "ZyNywi2YU/XRhkyofj8aNWU4fdmL2amqaGxYNRTKm0w="
									"stdout yaml":                "h/dc2um4/CR0snP/7DZaCXwhuHO7rB66OhCY6PVhrxU="
									"yaml:-":                     "0u9yfLSlfInKrU/RF5L2GoZRlPeU62xVHW6OC+CuAO4="
									"--out cue":                  "NpUBa0gwCg7aDkA2YWu1W3Gy67GgtkUT4FwTggA5j7Q="
									"--out cue no hidden fields": "edvWU1wTajcGhevpJzqTweD7HNtJPFtd4c6klkcePIg="
									"--out cue --package foo":    "XlFZpS7DGDh9fIfQVkURMCZm/qC5lIisVmD8HnYcBx4="
									"--escape":                   "T6k6nsjyX6Omsa6rxHRSsGamWtQHUj/jsWVHXmDioIs="
								}
								upload: {
									"--outfile data.yml":            "t1sCay0B703Vcgzc9pqqnVEqWNJl7226tyHSulzWX/M="
									"--outfile data.txt":            "HQMMEA1peIpJrlh+SBEM3QoMdKerFf+X8oIshXSZ1Mc="
									"--outfile datafile --out json": "eF0pwH5tUiYKtQQJyR3smWYGOoDOrlaqeHgoA3Axte0="
									"--outfile json:datafile":       "K4RK1dyg4ntbU57AGoO1BgqNXqLdGUkXdYHdG6C77mU="
								}
								multi_step: {
									hash:       "35J25LQV7LOH2E1CSLS1C5GVAGR5QR4M190P2HPEFS4LHD4AH5HG===="
									scriptHash: "TVTCOHK1K6IF54PI4CB62FSIBJMCMB1BAOO6SNBVQ897AIDDN7UG===="
									steps: [{
										doc:      ""
										cmd:      "cue export --outfile data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.yml"
										exitCode: 0
										output: """
												data:
												  value: A string
												  list:
												    - 1
												    - 2

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.yml"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile data.txt -e data.value"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat data.txt"
										exitCode: 0
										output: """
												A string

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue data.txt"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile datafile --out json"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile json:datafile"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cat datafile"
										exitCode: 0
										output: """
												{
												    "data": {
												        "value": "A string",
												        "list": [
												            1,
												            2
												        ]
												    }
												}

												"""
									}, {
										doc:      ""
										cmd:      "rm 1.cue datafile"
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
}
