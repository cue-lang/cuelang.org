package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "lvD1iN3BaT+H/8SRy/9xnd/EL+yOl0ByzK5v3Q48Q0g="
								"schema.cue":         "oTSlRtT4ctsfKBlNV6aqjeRGlyjpyZXw6pLGG1HpxAU="
								"split_pea.yml":      "2kqtdkCTYwpZbEb0OMYln1VBS0SR5uOvmkn+MnUNDQM="
								"pomodoro.yml":       "wd8HAIBVczcBI18M347YSThRWqCwfbTDvRzzaBYJ+eQ="
								"pomodoro.yml fixed": "MXFilDuyuy4GyOWdaKYEDJLlw8N/VRUsJwoOHAGufTo="
							}
							multi_step: {
								hash:       "HEO63O8B165NP0KIE3D3A148AF6PUAQLPTSNCOITFDAIBIBCLNDG===="
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
