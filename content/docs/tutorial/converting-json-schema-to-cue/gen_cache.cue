package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "M19bu4CiJ5QPG65B1ZUGqzOfpCR7DeF7eB26AtaKYEE="
								"schema.cue":         "ddRvoEZJ9FDjO33SzCAKQxlq/qksod3Zgzq7NsKBxC8="
								"split_pea.yml":      "uyYblI+OOQxcOrsYZKPwpGSKBSXqmVTETnjsiCV5jTk="
								"pomodoro.yml":       "PzJbE4wthmVXJWdue/bEAzpKppQOFD2R5eQQvsfrzaE="
								"pomodoro.yml fixed": "xswi1/BwqGqK3GuaN+M+xpmcyq5qRkeexmuS4XGDtkc="
							}
							multi_step: {
								hash:       "0IKBVLRIIE2R3VOQIPC7B4948FSNAHJ3R2AOO9DQ5MG8VK7T8VH0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.16.1
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
