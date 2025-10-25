package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "CUpPqeyrN/gEHF4e3HT0KytrvSfYjTdIHXxZaAru8Zg="
								"schema.cue":         "3e557BY4BZKHA2dyMjPxtZ8SEHZDfOejx7jkhnqJCwE="
								"split_pea.yml":      "kMHVfzFVm64R1hBdoL5lQPpQitFEVBJmHfTnnASBIXQ="
								"pomodoro.yml":       "s7mAGj+q8/JG/wtw1MT/dmSKH3R85EXtTz2CbewI0hg="
								"pomodoro.yml fixed": "VsjfDblBzmjmnE2Z963fzJFwMA++IVaO1+RbFBbRXIs="
							}
							multi_step: {
								hash:       "D1BDKRDOGAVV8N3OBDK12J3QI83U0MLQ3TOR2375GP3GLPCDTAV0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.0-alpha.3.0.20251025133102-654b5c06c385
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
