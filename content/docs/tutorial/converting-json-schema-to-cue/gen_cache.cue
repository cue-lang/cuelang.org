package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "+ag1PSCGpdq/fizh6K3yRcsABDe0R2QEfOu6CpDy6no="
								"schema.cue":         "zzQo2kZIy4272eQuIZqZ885SnclZ6opqc34X0tIrlFw="
								"split_pea.yml":      "9c7NAw9sd7NE6jMGN7zGBj2fhKOqmHQGD9T2XkoY+Ro="
								"pomodoro.yml":       "VNwwq/h3TnUqs+7+obpmeyamD8tMkFPO2G0lQ8c8VA0="
								"pomodoro.yml fixed": "iljK0GCtOf/kCqptnME/FTR/bWWf0r+/N+FhkVnIeV0="
							}
							multi_step: {
								hash:       "A81EJ6OVO6F0T5B9ES5R7L9J79BOPO40417HIE30GHF83EP2UVBG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.0.0-goreleaser.202609101448
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
