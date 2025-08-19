package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "+xhvhrZ8HEQPvqwUHn5TLwonmWaHlftH+7hllbbDP38="
								"schema.cue":         "Npp9h/DPO5flII1RuaDMXRFTo9kdW/9GUE+HGCpCeJQ="
								"split_pea.yml":      "chcj9D9LIEEuYzf2R7dskHQSTZShwM86ymfGLnKYXIU="
								"pomodoro.yml":       "jaWTTNADKmtqALD+M47aziRJ+JXQaICAwqDXrafLUrY="
								"pomodoro.yml fixed": "1vrCdgboayJ4t3gQIQfQ/t3Eich9/aKUAEHS0Mxm0B8="
							}
							multi_step: {
								hash:       "3CQHTMU955VHUD37BM88MK1J5E0BRSSJ9BTL1T8KUU1SBDBKMIEG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.1
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
