package site
{
	content: {
		docs: {
			tutorial: {
				"converting-json-schema-to-cue": {
					page: {
						cache: {
							upload: {
								"json schema":        "0IxX3nIStcu/E2+TnIq6ISjklyCujUPlpcBepl0hx5o="
								"schema.cue":         "YZvmxWbv8ivoqFPwE8TcXjDpCzp8IMUyP7ZYfSVbeS4="
								"split_pea.yml":      "LRMYXwUPb8oPc7kLgG0NtAxHwOLrC96rVHwF5x/BugI="
								"pomodoro.yml":       "SQzWauawPhwk3o5lNIMMHVCEnvDQn+exJA8ivIyQ7TA="
								"pomodoro.yml fixed": "pVINp4gZHNAH8Q9XpzFMtxZ91q2dNUJNVXF9oA7DEdM="
							}
							multi_step: {
								hash:       "46ABSMIV60CT013QN7CJF47M3FJAG3OFU2337UUOQ6L03PFECUF0===="
								scriptHash: "2H1HLF8MLQ185KCLUN5A8C2PGDEVV4KE1RC728N7NSJRN5BKQF6G===="
								steps: [{
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.9.0-rc.1
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
