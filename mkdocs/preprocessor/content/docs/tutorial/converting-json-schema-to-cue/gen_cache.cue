package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "VbJwt+Y0yG7mqG1JYggDuU5H3h59oKD3NfBkB72MvWU="
								"schema.cue":         "3EtqGzjZevhJ/ghkA/LvWdNUzfx5iiUahWC2idOF4r8="
								"split_pea.yml":      "CXxb6+EmmsT0OmovNJunPbK9XpRcfLphIoe1tYNhOXw="
								"pomodoro.yml":       "4Voi0ArXWlZVT0Y0+6Lm+FFvWfg7oC04S8hEhH5xe8Y="
								"pomodoro.yml fixed": "qd+JXgIEMd41K9W1A1eHbPX1ng5myVxggEg6hsKG73E="
							}
							multi_step: {
								hash:       "EG17ADOS6AE90CFSV843G5QV8K36TKV1E9B9CSELO2C4GTQR3A10===="
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
