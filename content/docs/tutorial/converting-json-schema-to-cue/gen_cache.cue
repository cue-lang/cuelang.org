package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "JB74ySTsAGNPoQUW46pzqv7clXTLskRa6vgbXcI5IxU="
								"schema.cue":         "AbcgC4YWBnf/HG5VCzczXe2wKJ/E/fV/DsEWNeDb5TE="
								"split_pea.yml":      "loApT9mwtLf8EJc2WwSGhkzeNYWelVNk/OospjZGAaQ="
								"pomodoro.yml":       "DNb3M8zBaMfc47PphYROJ/zFIC7UMHjH3t1jMRL8q2w="
								"pomodoro.yml fixed": "czKeqo4XTuAtUX8UpL3jSHyEWt2A5B2VsqhkmJaQDcA="
							}
							multi_step: {
								hash:       "2D1EU8O153KUQBB88H0CQIS46Q6R5AS0QT3I1K15KHLJ0DKNCD4G===="
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
