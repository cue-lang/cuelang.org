package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "W1jToVx7AIozZtFVvM6PxVmUJBYFf8XGdwNgNQ3TYOI="
								"schema.cue":         "cdBxmJwJqg2P/1C5stol3BGJrGHP9vA2GzVY9Qn6lxg="
								"split_pea.yml":      "sR83vw9tHqf5zzoXCMVx4z5FLygQqR7X26KRrYXtiOw="
								"pomodoro.yml":       "a/bA18mNvU2ErobkgFL2dSI4vMjGBx42LdypUE0K+qg="
								"pomodoro.yml fixed": "3xBntyyhRsI6ajlVdQ/tOQmX4/ij2dPUXsdvVQUw4HA="
							}
							multi_step: {
								hash:       "R3N80OJE3ANOSUJODKPH9NN0BAHDQDLHDR7IATSBLSH2NEM310K0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.18.0-rc.3.0.20261104170309-b057976c6156
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
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
