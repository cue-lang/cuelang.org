package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "tEMseukJesHuKLhY/NPOfEjKQ32+joByeS1Grnxcy2A="
								"schema.cue":         "Fb9yi9qO6m/fX0HXqeq6lw6/79ffRJcejQz6rSnjfIc="
								"split_pea.yml":      "kEbLvqxcn9G4tswWRzwKA5K1riKeNnZzrZpxQhWnXkE="
								"pomodoro.yml":       "aT+t+R9kVoWKk60LxKZErKKp7NG6SvaiP5pr751nF30="
								"pomodoro.yml fixed": "ohYiQ+6mQj6Kx17RGnDV4pQvaUt0OCrb3qNinY1jtDg="
							}
							multi_step: {
								hash:       "HUL0JQN6P1PS92ES2MBRKR1UAKMN2KEKL9JG52GTV64R36LLIL2G===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.12.1
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
