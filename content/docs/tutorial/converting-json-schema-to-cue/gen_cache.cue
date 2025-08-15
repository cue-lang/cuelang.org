package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "GYrxSjzsUIkQv4J1qAhn6Enpsdf6Xao4U5Kc4PIDaPM="
								"schema.cue":         "Vcqc+qh7kXI79gH0yKg0N6XkW/DwG1vO35PJJUsKEws="
								"split_pea.yml":      "cnoP6FcV95+hth5d7LnF2PrOUVhhqbcGvkQ9RO0VV2g="
								"pomodoro.yml":       "gb+6urnK9sj7jRewwv3i5EjQZYKisDkWBwX7ygEhJuQ="
								"pomodoro.yml fixed": "0eZHpI3aqW9s6B00BPmx9Nc9cV+vsdxJviPnLfyq+Tc="
							}
							multi_step: {
								hash:       "PLK8KKNTMRQKKFIUN4L9E0PF50BNQLVGDA82GP51V1NHMJ2LJ5N0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.0-0.dev.0.20250815110336-a2eed3278a6c
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
