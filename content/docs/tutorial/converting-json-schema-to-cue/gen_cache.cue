package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "NN1V4//cPvWlH+uN0KOSp6Zizp5nIIdvTkiklhg9AmU="
								"schema.cue":         "7Q9iuF06M/3DEbO37dFgrLBSDWotIHzjvhx6SEM3QXA="
								"split_pea.yml":      "y8UOZF9JB0+M9aZmWKXzWabiV4+YJLEi+iJgLTJzKxU="
								"pomodoro.yml":       "KI6RNa+GhL7oOPZIni1G6ncxv1xHJLkJqySsAOaG8UI="
								"pomodoro.yml fixed": "0CMCYTVZVFmOwD8nR/o1n+DZAPC+0FD/amVt/5w+O1g="
							}
							multi_step: {
								hash:       "GED83C46JNS1TG0GG62MD24UCRL0ID7ATIOB779E0DLI0TMLDAS0===="
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
