package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "SY+DxWqG5nkdvQWYC284NU5LHyZwHZ+3kgxQiJaG5cs="
								"schema.cue":         "xz4w98MraUIc8zXYTH4PqdXCKtmfujpPbH8B1Wj6Oa8="
								"split_pea.yml":      "O1HdFYHi/pO5VQXrgQtUojDqgtw4gsm3mVKg42aSgPY="
								"pomodoro.yml":       "dc6+E0WLFGMFPNoqCwfWd8EcPER08mP/vfu1BdMwUq4="
								"pomodoro.yml fixed": "BeLOGWMfbMtx5I4r8zFeHgtArlVxKYdzVdmvuX4/fAA="
							}
							multi_step: {
								hash:       "51OFQE0498D46084D8NG2FL2KHDNOGHKMPEGV95UI7162HRUK2LG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.19.0-0.dev.0.20261113115251-a5a9a9c5a2df
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
