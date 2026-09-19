package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "vedalgwTeB29ESy2i20K6oP6c7vR3QkK/ajJOQNIgp8="
								"schema.cue":         "MlF4ruRv6UNGBVNhWKBYUru1uBaa7wYxIAi7Esq6Cl4="
								"split_pea.yml":      "6MtbWsp8/ySsIn1IBGYzSTozOcdLsOSzOxW0/v1tzJ0="
								"pomodoro.yml":       "gTa7XKFeE5zIH0Yb7MFgTwWa1lA7W43tMmK+h2nKuQ4="
								"pomodoro.yml fixed": "+6oz+InhyrWFEfm3PcyiLt5xMsgGQwZC924LZmb8kWk="
							}
							multi_step: {
								hash:       "N0KKISKBD3KBQU3BSIPREP3320HV938R46TP05J7S61S3ONVKKK0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.18.0-alpha.2.0.20260918143709-50e1f64b6460
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
