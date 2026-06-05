package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "qlkU2gV4SFaliF1Jfw+I32wHna5PwEIv/AzRqcIbzBY="
								"schema.cue":         "fV0slzhaer/7KJIaDnS3zsG1jnQZ8IKPsMrS1FbZqXE="
								"split_pea.yml":      "23ns6ZqskBKIx0djCy3/l5ZQE66Z+CnfpZR7ZVxpQCE="
								"pomodoro.yml":       "PqdQafAenGKGZZZ2cbM/4ZqjYf21F99fsZLeOaWNufE="
								"pomodoro.yml fixed": "x7kqUJBPzNUhqbda6Z05XG3tDysXqvMTf5OpY/3sKdc="
							}
							multi_step: {
								hash:       "O9LGE7FPUSLKAHRJI49C469PUI2O0IQOTHIVKJJ1H6OOFR76E8E0===="
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
