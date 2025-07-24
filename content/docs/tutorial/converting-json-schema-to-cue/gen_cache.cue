package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "DTh5zqwtU9KzhvMBPDVbuboVWIlGRT42+8F3E+qeytY="
								"schema.cue":         "Cp1E7KbEoeWsvhXBz7avMOQgwUMVMQ3JOYyCERhn3TI="
								"split_pea.yml":      "t7W/41/WB+qgC+bM39wFY44am+rJ2QwBf5HP1TGwdUs="
								"pomodoro.yml":       "TT/5il5o+H+dep8Rg5WmY/ULTLuJQT0k0u/65pYzZs0="
								"pomodoro.yml fixed": "Q6VPYHtvgWNqi3Agd99JZC/xPxZSAi1dKZwCOFaggx0="
							}
							multi_step: {
								hash:       "QMRENPRR8D7LOQ0HK9S74D9HTMUU3NGAVH1N6K7TJ3NNKLH41UAG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.0-rc.1.0.20250724155554-6d101321cb41
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
