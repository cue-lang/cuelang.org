package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "fnx26Wn6hLMXT48C/FB+NEEkN224Vd1BRtnx0obydxE="
								"schema.cue":         "uwhM9TfyxAfi/Ow6X7M4RXKVrd968hZ/7NtuThbNoxM="
								"split_pea.yml":      "3llG3e3uzh3eDK5lDd+qU4idxClxCHhrUeJPvzKgNrU="
								"pomodoro.yml":       "b4BjpXb0xWUD3PF/A/1BW4ZHsgE/tTA5l24wwHra0oY="
								"pomodoro.yml fixed": "1Mn+kQSwS/KcMXWFuy8PMB86n0RnbhmfWycpLSgWYSM="
							}
							multi_step: {
								"6V5GM5L6LM3FHN3CDIP7ULH273IVDHR038E8672AK774VOEEJ2E0====": [{
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
											    ./schema.cue:10:16
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
