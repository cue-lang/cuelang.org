package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "ErcvoKrTThmIrLVyiexxwoeaqqU2Y4WpCdglfoeZgpM="
								"schema.cue":         "PiRhPZtfGW0CSe9X7c7rVTHCwsZP+9ezy6YH8MZJIhY="
								"split_pea.yml":      "2+vHZ3Dqjg0yddqAi8y+lWEP+ochgZIij/BAwYtfncQ="
								"pomodoro.yml":       "WbKJYzCGCL6LMZdM6uCqhI548Ut5C9Mtak3g8g8mme4="
								"pomodoro.yml fixed": "IE9t72C4MHVhnHYEoZjSKNlob77fx+iMm8ZSbGGDf1g="
							}
							multi_step: {
								hash:       "VUKD0HOJ6U31JFJUO0KCDLNBK1NRV54APCQJ51UGAAVKCEBTOBQ0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.0-0.dev.0.20250530082924-23f252784fe2
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
