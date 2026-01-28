package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "SZV1ynUTJgB8fER4LXOWhXgVbnMaT1VphitjIUcoQfg="
								"schema.cue":         "eXN1mP4MnUy7gu4arPl4SPm8MQb/gfnPvJ+eFYQFLl4="
								"split_pea.yml":      "eo4ZEndz31UHfUozCEAkwEtj8gm0YoP+71+WixjPS74="
								"pomodoro.yml":       "3QOin1FWQS+ao6BlGcmH9g3l6hyHGUEphARz3pPir18="
								"pomodoro.yml fixed": "dacEq1Q6x2tUnmSARf2atcGEOWafVFvIL0HYq179bc4="
							}
							multi_step: {
								hash:       "G7NJFF1LIONSC24O9STFPKPFQ5IPUQO9CC80O4IGT3S52E2AOLPG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.4
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
