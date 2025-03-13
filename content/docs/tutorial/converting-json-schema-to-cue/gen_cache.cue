package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "RPJb+h+jywEoPRvvroeAzRhECQUqb70uJjmW+kBIhrM="
								"schema.cue":         "CHUkD6kR3frg7HzoBKRFntsaC+hDkorGQKczeo+F6mU="
								"split_pea.yml":      "8zwa/rgEg6lT49JiZnNaDojuw0vD/gHuI0yXgWUE1+I="
								"pomodoro.yml":       "F7m9K9yhiBgvKB9ubIHH5ol8lXpVCUSw9GVjFevBFs8="
								"pomodoro.yml fixed": "EX8kr2q70mep45MJvnzkxs51wFRGp+7/AVu3YBd3wzU="
							}
							multi_step: {
								hash:       "PVJDL230G3UER29JPV89EU9EPKPIKD07V0KHK22U95FSL8UC8Q3G===="
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
