package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "yC7O+itchoKvYufSFaqkyRuYs7SmzXuGFvvA600rcdE="
								"schema.cue":         "8mafxPP059SOnU4Ce86u6PQizokqSDRXdZZB9IaRAiM="
								"split_pea.yml":      "UWnJ4NJOo0gZ5erYh4eoxjCBJ/3j7RGUilDDTrjsKvc="
								"pomodoro.yml":       "I2n8jO1ouK/WbipsKHiQDQCZZ92FGmpNmqQegcAHF0A="
								"pomodoro.yml fixed": "kZJCWS9VH9CJwI72DjKKTjr9X+8y1aN6ga1iRUYYFV0="
							}
							multi_step: {
								hash:       "UA5S7CM4G1VF4U36HSLEHQBFPFBR4B2UUFEK82V6GPF9QOVP16VG===="
								scriptHash: "EEKUOTTD6EPHLI57C8VDPJM17PGNAHR4LE3VPVJK8JJJ1NVQDBEG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.0
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue import -l '#restaurant:' -p cuisine schema.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cp schema.cue .schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff -u .schema.cue schema.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
									exitCode: 1
									output: """
											tables.0.seats: invalid value 100 (out of bound <=10):
											    ./schema.cue:13:17
											    ./pomodoro.yml:4:12

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -d '#restaurant' schema.cue *.yml"
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
