package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "lDC5Vt4nLPZUZM0SUG/o098VpkcqG18vuIrrwkDBLZM="
								"schema.cue":         "YyPWby4FwXqBh6v3UxWuIfxNF0wsd41T/f1isEmft/E="
								"split_pea.yml":      "eNl8FfmNgazUpP5qPSq17n5w4CGLGe/0GmuXSMCb00M="
								"pomodoro.yml":       "/L4Xx/srjsnVlpHlHLSkXOGQ2k8p4ebJxnDdOf1oEXk="
								"pomodoro.yml fixed": "yAQhkxgGLETXU+m9EMfmXleRTN78HurLLUMNK1lqLFQ="
							}
							multi_step: {
								hash:       "85BIG6A385HP69O5S6Q513ESJTGPDMGP4U685SBEKEFMM9H77MTG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.0
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
