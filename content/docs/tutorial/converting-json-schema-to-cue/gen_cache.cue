package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "qSalUzUJ7abYR7kdAjgKVk9zQ+NpyO2apn3Vzj7yPNc="
								"schema.cue":         "dud4czLJWyl6JUUNBYHaqQhdQTCLhwGn3lEbbR4BezU="
								"split_pea.yml":      "wy8oXg0CUZrGUTOjIVojgd1VoaD3L8zrCrW21LVDcRw="
								"pomodoro.yml":       "t+pCBkE0iw8bBpa43fdHq/Z9oTkOv9KJA61J4YJs5yM="
								"pomodoro.yml fixed": "XaYvZQurwpaUqbfcNLcyqbrz04y8KSqdyPo9kjNXbbU="
							}
							multi_step: {
								hash:       "7H4JCHEFS34EQH9DMI9PQF7SND6R3GUCLG7E3VF0C8MSKTR452M0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.1
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
