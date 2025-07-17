package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "lXB2qh6z7g8EcO+NgZwjzPKmYIrDvBMzwXnzDbJ5K54="
								"schema.cue":         "bc3Y+sO+eA1mBKg1v2Inz1yigju428HHFoaI7kbFZNk="
								"split_pea.yml":      "dk1toxmKbnhS3ipMnjf+n0+DBv6OLw3pwTVemp7Rb+E="
								"pomodoro.yml":       "e7kJpyovga5uI4ru0s/ZYskhBHX1bZQsK6QZZwyRAM8="
								"pomodoro.yml fixed": "Oh8dWMOQuVhmXgYyrEyF+gswv5SrAWMLvYY1kgvgB3E="
							}
							multi_step: {
								hash:       "ACJD8OPK71IDVU9TNBU0CPT6FSOF6IPQJ2IO2FGNCKAQDU5OBCRG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.2
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
