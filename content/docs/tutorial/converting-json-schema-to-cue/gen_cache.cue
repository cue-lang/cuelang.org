package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "X2J+/2TmGyelo5bkPXtGvXH26XMDIpRDu5V7OBcyG0w="
								"schema.cue":         "NCwxd7YXKfs4n9eC7zOD5EXCcPJK/A/V7IXpF5STEng="
								"split_pea.yml":      "BSG+gJ3Gw0T3GlVnNjqoYaYxRQoZaj1K/QnciN6PlYA="
								"pomodoro.yml":       "/8hYnnOGNmdAOYdFF9KuLj0QpH4/1d5gAfzNWeIkMVs="
								"pomodoro.yml fixed": "HjIQ7YsXVRjuvtC6laPtibiOSQb/dnqM6u4IjdK5fOU="
							}
							multi_step: {
								hash:       "07FTNQU8ULASFL10RO206DAJNN3C15HGI2HIE2F6JQHEJI05G3U0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.4
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
