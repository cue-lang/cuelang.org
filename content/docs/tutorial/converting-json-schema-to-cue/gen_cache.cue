package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "jFkf9xIHUOeRdGLuB1sh79pX16NX1ifp83SP1Q5wXho="
								"schema.cue":         "WU/i1buRJAp/hfF2wB02Ao63lFa0M3B3HJDXetNSW20="
								"split_pea.yml":      "Htt5DcyU7Zcpc0+ULDVeWTLb/0boJRlBq113Ut9PVtc="
								"pomodoro.yml":       "h259XLXJfamdOoiCMxhoWfPwV/vpAuAlh7E8inf6/14="
								"pomodoro.yml fixed": "KrIlM4NMHtXyoNvFjd3zeqMM4IWTBUxvYkppUkpVAoE="
							}
							multi_step: {
								hash:       "VCC5N8AQO8U4FN66DOPVS8DC3A1LKESLA772IA9M4C82QJKKPBFG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.17.0
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
