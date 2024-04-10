package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "yST9Kd4ZwJ2Wzs/nRAqS0yhWrNBkaVM7NmPpI3yD3Pk="
								"schema.cue":         "oXxp1U8jDXMwv2322hPCKpCqf6JvpBGiwxEYNBN4gBY="
								"split_pea.yml":      "hIKUCxr77K0itGNrn05I603mMVL/Y9aCLIjmE7bmCD0="
								"pomodoro.yml":       "XKOLrKgXYhgUTfUJADqo9MVUnwzEz+215OzaPOGPGDU="
								"pomodoro.yml fixed": "QsGFhTmg3xI0rBylpBI7IkgQTeWP6QwOGWlCB1NF0IU="
							}
							multi_step: {
								hash:       "27779O0BIQ01LB6Q9DT8BO9V7EC95Q204F1SMAEIQI0RLUBN9REG===="
								scriptHash: "SHPTQ81E95CP9JF83F3444BQ9IR0272SFCR8SS5QR85P2VR8OGV0===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.8.0
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
