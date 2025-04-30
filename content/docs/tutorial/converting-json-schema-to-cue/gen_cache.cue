package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "cKS/3TAVaRsJaHh/33LzyYrGKfZ0RvGJ/rY+7PnKsdI="
								"schema.cue":         "f6LlnF8N0ofCWottjf+5x7PWrmtGiBtB7USJthmdevQ="
								"split_pea.yml":      "OjRMJFBqbrzxNI4Gmhak6wWIEyx3062Ms7/lwRgpEWw="
								"pomodoro.yml":       "owcdxXkfG11mZxa/XKDfELU2fCleBHdVJTc82rRvq/U="
								"pomodoro.yml fixed": "6BP5KB7Teb7rNCSZwcuwr/OXbm0m6w98W3b0ZQet7Bs="
							}
							multi_step: {
								hash:       "DRH8OTLVS1O5L1KFPFSNSC51LFEK2H2NQDJC9ANMSCN9A3D30F30===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.0-alpha.4.0.20250430133040-3ba376f34cb6
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
