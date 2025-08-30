package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "yS6psHtyg09lEPV9WnW10DO8D9MI710lM8/gfrFKMzY="
								"schema.cue":         "ZqgkCqPPKEib3UF7jNWWl/prkGG7AI32NLR3YAfpLvU="
								"split_pea.yml":      "UXAFV7L1k3GTEDQnVIPmTqra2N2y7SZtpvBgFhlIfnY="
								"pomodoro.yml":       "FmMLC7UaT6lSXfHdKSzHNwGSbJ5z11rdc8fpYybd1sc="
								"pomodoro.yml fixed": "YqcEfaDz95mQqumwW5pYjqbatg5b7y4FKbA4IrKle1Q="
							}
							multi_step: {
								hash:       "9URPOVQF9TAQVSN4B2724L2HULCSPE23FDMS1U3Q8E3FCHI3BSHG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.0-0.dev.0.20250829194412-e2b9c0d6d714
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
