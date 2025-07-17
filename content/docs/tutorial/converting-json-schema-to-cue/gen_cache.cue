package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "ez0YrIi+ha5Q1ZHVdmgf993aOKo/Oj2RyVpOh/rFgK8="
								"schema.cue":         "b5eRu0eLCY7k8Sh71vhkHISIdSOV5zYeMePiiYiKBJs="
								"split_pea.yml":      "seDM1EfEalXzP2Xow+bGL/Bf32ffVK+elig+2begqro="
								"pomodoro.yml":       "U7NNB+DcaNreYjcvn2vVSOxjy8lC2gFOqsA48DD0xeM="
								"pomodoro.yml fixed": "BLzVyogKmcyp/HG5lwv+dSTLPhLy6kHXBjlcEGFisD0="
							}
							multi_step: {
								hash:       "J8T302IFF5912PT2B7J2K69TA8DRJOI1RN1SNAVM93O9J29S7CCG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.2
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
