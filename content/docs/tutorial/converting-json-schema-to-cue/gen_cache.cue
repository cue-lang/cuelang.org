package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "brVpyXPnnQ8gItywIs7TnQqY9+rV9T3CgvbKOufD0Zg="
								"schema.cue":         "Pa6cYPn/fXWwXdM+TBprF+yfwFjKPaW2o2VgrshD0iY="
								"split_pea.yml":      "aTisWjX/OBu6XbIaBsq1NuONG95EcTsxdkRrBspj4k4="
								"pomodoro.yml":       "dhuSGdQIopt8Hx1rWpPFQwWQlOgHP1zJZNmw16CZNjA="
								"pomodoro.yml fixed": "D51ShPtPvUWgaK8OaMimW8NBdG45Ngo/wGPseMjpJ48="
							}
							multi_step: {
								hash:       "L7G5QU3E5LQ2JKGAT7C57015IIJL76ROG9VEKG42LGEM3IJ9OBL0===="
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
