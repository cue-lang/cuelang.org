package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "QUDVWvoxihXM890fK+8cHgJnDm0SxlP2WE8ivpsVFK0="
								"schema.cue":         "dUH+k2PDsdx1DHjIjqKslhDYdbDxNxo+Ik3HwQwiE74="
								"split_pea.yml":      "AnWV337AntfFt3DQpa7mTDrPmjc+MHafPY3W0KESZxo="
								"pomodoro.yml":       "xkVb0KRZCP3QEYWspXdbY6LLxmHcbKAiy8SqvkDJmfs="
								"pomodoro.yml fixed": "ULlKUal8JPzeCWqNzbRNs5EihMP3OREq2kOGvkLCo/0="
							}
							multi_step: {
								hash:       "BJAOOVP6G4VGHV49S26Q3HRCJMDUG9M39JADPA120GVDRMT34VQ0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.18.0-0.dev.0.20260702073200-7686325819d2
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
