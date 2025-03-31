package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "5Yvwa30F8/UBVzsWa8iJKJzqr0y09HvRO+JNLt39HVE="
								"schema.cue":         "Gjk3kxTsEKXLxGSyqsTEJKGAC5jlj62bc0kwOf7ogCU="
								"split_pea.yml":      "KbTX041/JtHK7RQtM5R3gH3R5XkGrZMqY77t5rY1IQg="
								"pomodoro.yml":       "TMRZbAHIsR/QuG024zPLEyHR87/YxhPCz3Is+A7JHKA="
								"pomodoro.yml fixed": "BGby7v0snk7ipjWtKYV3HELV9A/cxUxZELgeB4Osm0E="
							}
							multi_step: {
								hash:       "FEHDDHI1FN5UB5CPVDRUPIR57LT58UHOJJO9EMUJ6OM8L99KAPJ0===="
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
