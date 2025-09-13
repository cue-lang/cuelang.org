package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "j2oTwaR80paHLEavDiPLdYeklToNqBPs9XnVu9HyKMk="
								"schema.cue":         "3NJjrIJTcJ6XsCVSUlkO88Dt5pUcfp2elsYQqC3YGCo="
								"split_pea.yml":      "FmK5NyYEw/To1ywShbLEsN+ASBz6flKJjkCsNfQ9WNM="
								"pomodoro.yml":       "e/A82wyKCFpim1HBDdP4Qx424OgLI/BS8ewxMOrsxV0="
								"pomodoro.yml fixed": "nD1W0O5rXrkD4HRsNE11gkJuF6g0UvOkeqCliCHIOqQ="
							}
							multi_step: {
								hash:       "EB3KAIN9C33MEB33B9DHPTGPAF67D2SAJ5CH3B7I2S44KN1IPSH0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.0-alpha.1.0.20250913190050-8572198e1792
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
