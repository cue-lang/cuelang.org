package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "KjVojuf1aHnlWAdCMUaJKXjqYWJPu3hPkfek8L2kL4w="
								"schema.cue":         "zUZuqTsG5F6c7vkplOqCPyzKgws6Xy7AW2XdpSfN9co="
								"split_pea.yml":      "88O4DmOUMEyONUfaLJp6mtfhXV07PkvwpbZoz1Gw4Yk="
								"pomodoro.yml":       "ASPZ+KsW1rI38BODziOvYWEIbdFIzEn4X/P3eEMxLgU="
								"pomodoro.yml fixed": "8nFjceWoZ12tfQN+ueYkTA3SzInSxLVwO9R0Raezja8="
							}
							multi_step: {
								hash:       "37CHHI97RKMG8B90RIQ7OOQKMVCU7CNG2RI30U84L572S66DCCAG===="
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
