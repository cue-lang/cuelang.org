package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "jCr3rYXC17xyqM+f+ZorqFcwQHFzCawVw0MV6bI4pbI="
								"schema.cue":         "shcr9YjtnZyLAL1hWg4BWwUF7czwInyEulOIl3UZ0SQ="
								"split_pea.yml":      "bdyo4+IcaWwIV9QYNLxgI0aPQ1iaCrckpGVlFWp0gow="
								"pomodoro.yml":       "VLujZ09GK6ejJq7NSIXvSE+wxoh/CLAvgzLTlE9rUn4="
								"pomodoro.yml fixed": "r98PapHAi+pAufnG71HiD5NbSwgwkdzcjPxOoBL96DQ="
							}
							multi_step: {
								hash:       "M5T4N37IJ2D3OJEQ2IGM9NLQETOL2HJTL5D9NQG470O86RQA9C70===="
								scriptHash: "G1P78LAGG4P0LTVP123AUGTEBMR9LFCQE6P9P3HR8DBT7BUG71SG===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.14.0
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
