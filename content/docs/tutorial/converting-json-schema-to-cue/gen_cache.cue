package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "mJ2AXRFkGfROIwKu4RmwORmc8TLXvZEXwEpVpuNcPOs="
								"schema.cue":         "kGaGV6dTRzml9PhYxadIEiaXRGtJ7XUyXTkybciAFy8="
								"split_pea.yml":      "BW6xpwo2lVU+akJOSoeb0kknKdwRBoXY4DT08r5rCg8="
								"pomodoro.yml":       "UHwibheP+TmPRizBOapoMyQlee8gJO9C7dtcHfv+UM4="
								"pomodoro.yml fixed": "ChUr7P2tH9NvB72AGShe9JvpE3zBv9u8uVEDw1UDcbM="
							}
							multi_step: {
								hash:       "6N3VGDB349H76NP55I6IFDIMSG85PT2L9SIK5RU6COAUROAQMPJ0===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.15.0-0.dev.0.20250808151001-88adc227ad53
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
