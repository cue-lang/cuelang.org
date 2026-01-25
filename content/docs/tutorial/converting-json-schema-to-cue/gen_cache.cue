package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "yI9a4nHKyetNQFo73qmnVmUms9MkeMNAqmJol2J5q5s="
								"schema.cue":         "sCLlDsGbBhgliXY3j6xdx2S3NYUfPMqM/MT2IYKF+Mo="
								"split_pea.yml":      "PFOl6zLzeLAiN7UGDKKyJ9aBmNWVXwHiRvH48akOGBg="
								"pomodoro.yml":       "LFsD0zISOEGOCmnvoijyvpl5spP/AhFt61NRqZVb8NE="
								"pomodoro.yml fixed": "c7W1sRTch6yDqUgYmfmUcqIdfRt4yJxgABYQ0VQfLa4="
							}
							multi_step: {
								hash:       "FL1PFQCFVDNEB7G8CVODMPJLA1GB50N18Q9QUELLS6AITOL2RTBG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.3
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
