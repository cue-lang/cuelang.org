package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "V35lZnyEr5+nUxjc/8BVzreAsmYub0tsZQQsO/cXeUE="
								"schema.cue":         "/TxGy0xuGVeaYxSN8I3gyxHGDTYAsUMlRGY7K9OiYNE="
								"split_pea.yml":      "C9V4WgPqIbkJ3JneKN/Fgy06k2vvHL9T3ES2jyQz6iY="
								"pomodoro.yml":       "mJg1d2Gaou4K8bVkB3h3E71oD62PB8Hh3HnQRLWuWQo="
								"pomodoro.yml fixed": "uhChqUUF5BtmL9/e8mS5JTRmAxjy20+LSimcys004J8="
							}
							multi_step: {
								hash:       "OLJ664GR9QMJ6CFM7V1NQ01NEDE31424DV8E8JOOHETKEJE5RBUG===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.0-alpha.1
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
